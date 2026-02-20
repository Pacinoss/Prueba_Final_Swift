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
    @IBOutlet weak var imdbRating: UILabel!
    @IBOutlet weak var CardViewView: UIView!
    @IBOutlet weak var CardView: UIView!
    @IBOutlet weak var Runtime: UILabel!

    
    
    
    // MARK: - Rellena la celda con los datos de la pelicula
    func configurar(con pelicula: Movie) {
        Titulo.text = pelicula.title
        Anio.text = pelicula.year
        Genre.text = " - \(pelicula.genre ?? "N/A")"
        imdbRating.text = pelicula.imdbRating.map { "⭐️ \($0)" } ?? "N/A"
        Runtime.text = "⏱\(pelicula.runtime ?? "N/A")"
        ImagePoster.image = UIImage(systemName: "film")
        ImagePoster.loadFrom(url: pelicula.poster)//carga la pelicula desde = UIImageView + ImageLoading
        configurelabes()

    }
    // MARK: - configuracionde cardView
    func configurelabes(){
        ImagePoster.layer.cornerRadius = 20
        ImagePoster.layer.masksToBounds = true
        ImagePoster.layer.borderWidth = 1
        ImagePoster.layer.borderColor = UIColor.gray.cgColor
        CardViewView.layer.masksToBounds = true
        CardViewView.layer.borderWidth = 1
        CardViewView.layer.borderColor = UIColor.gray.cgColor
        CardViewView.layer.cornerRadius = 20
        CardView.layer.cornerRadius = 20
        CardView.layer.masksToBounds = true
        CardView.layer.borderWidth = 1
        CardView.layer.borderColor = UIColor.gray.cgColor
        Anio.adjustsFontSizeToFitWidth = true

    }
}
