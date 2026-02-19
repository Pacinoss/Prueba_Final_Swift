//
//  MovieCell.swift
//  Prueba_Fianl
//
//  Created by Tardes on 19/2/26.
//

import UIKit

class MovieCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var ImagePoster: UIImageView!
    @IBOutlet weak var Titulo: UILabel!
    @IBOutlet weak var Anio: UILabel!
    @IBOutlet weak var Genre: UILabel!

    @IBOutlet weak var CardView: UIView!
    // MARK: - Rellena la celda con los datos de la pelicula
    func configurar(con pelicula: Movie) {
        Titulo.text = pelicula.title
        Anio.text   = pelicula.year
        Genre.text   = pelicula.genre?.capitalized ?? "Película"

        ImagePoster.image = UIImage(systemName: "film")
        
        
        ImagePoster.loadFrom(url: pelicula.poster)

    }
    func configurelabes(){
        CardView.layer.cornerRadius = 32
        CardView.layer.masksToBounds = true
        CardView.layer.borderWidth = 1
        CardView.layer.borderColor = UIColor.gray.cgColor
        Anio.adjustsFontSizeToFitWidth = true
        Anio.layer.cornerRadius = 10
        Anio.layer.masksToBounds = true
        Genre.adjustsFontSizeToFitWidth = true
        Genre.layer.cornerRadius = 10
        Genre.layer.masksToBounds = true
    }
}
