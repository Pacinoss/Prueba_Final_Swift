import UIKit

class ListaViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables
    var peliculas: [Movie] = []
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate   = self
        tableView.dataSource = self
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        self.mostrarAlerta(mensaje: "Escribe tu pelicula en el buscador")
        self.tableView.reloadData()
        
    }

    // MARK: - Actions
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let texto = searchBar.text, !texto.isEmpty else {
            mostrarAlerta(mensaje: "Escribe el nombre de una pelicula")
            return
        }
        Task {
            // 1. Búsqueda inicial con &s=
            let resultados = await MovieAPI.buscarPeliculas(title: texto)
            
            // 2. Por cada película pedimos el detalle con &i= para obtener genre e imdbRating
            var peliculasDetalladas: [Movie] = []
            for pelicula in resultados {
                if let detalle = await MovieAPI.getMovieDetails(imdbID: pelicula.imdbID) {
                    peliculasDetalladas.append(detalle)
                } else {
                    peliculasDetalladas.append(pelicula) // si falla usamos la básica
                }
            }
            
            await MainActor.run {
                self.peliculas = peliculasDetalladas
                self.tableView.reloadData()
                if peliculasDetalladas.isEmpty {
                    self.mostrarAlerta(mensaje: "No se encontraron resultados")
                }
            }
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        peliculas = []
        tableView.reloadData()
    }

    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "MovieCell",
                                                   for: indexPath) as! MovieCell
        celda.configurar(con: peliculas[indexPath.row])
        return celda
    }


    // MARK: - Navegacion
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "irAlDetalle" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destino = segue.destination as! DetalleViewController
                destino.imdbID = peliculas[indexPath.row].imdbID
            }
        }
    }

    // MARK: - Alerta
    func mostrarAlerta(mensaje: String) {
        let alerta = UIAlertController(title: "Aviso",
                                       message: mensaje,
                                       preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default))
        present(alerta, animated: true)
    }
}
