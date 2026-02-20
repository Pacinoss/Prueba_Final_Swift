//
//  DetalleViewController.swift
//  Prueba_Fianl
//
//  Created by Tardes on 19/2/26.
//


import UIKit

class DetalleViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblAnio: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblActores: UILabel!
    @IBOutlet weak var lblTrama: UILabel!
    @IBOutlet weak var lblCalificacion: UILabel!
    @IBOutlet weak var lblRuntime: UILabel!
    @IBOutlet weak var lblPremios: UILabel!
    @IBOutlet weak var lblBoxOffice: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Variable que recibe del ListaViewController
    var imdbID: String = ""

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        cargarDetalle()
        
    }

    // MARK: - Llama a la API con el imdbID
    func cargarDetalle() {
        activityIndicator.startAnimating()

        Task {
            let detalle = await MovieAPI.getMovieDetails(imdbID: imdbID)
            await MainActor.run {
                self.activityIndicator.stopAnimating()
                if let detalle = detalle {
                    self.mostrarDatos(pelicula: detalle)
                }
            }
        }
    }

    // MARK: - Rellena la pantalla con los datos
    func mostrarDatos(pelicula: Movie) {
        title                = pelicula.title
        lblTitulo.text       = pelicula.title
        lblAnio.text         = "Año: \(pelicula.year)"
        lblGenero.text       = "Género: \(pelicula.genre ?? "N/A")"
        lblDirector.text     = "Director: \(pelicula.director ?? "N/A")"
        lblActores.text      = "Actores: \(pelicula.actors ?? "N/A")"
        lblTrama.text        = pelicula.plot ?? "Sin descripción"
        lblCalificacion.text = "⭐ IMDB: \(pelicula.imdbRating ?? "N/A")"
        lblRuntime.text      = "⏱ \(pelicula.runtime ?? "N/A")"
        lblPremios.text      = "🏆 \(pelicula.awards ?? "N/A")"
        lblBoxOffice.text    = "💰 \(pelicula.boxOffice ?? "N/A")"
        
        imgPoster.loadFrom(url: pelicula.poster)
    }
}

