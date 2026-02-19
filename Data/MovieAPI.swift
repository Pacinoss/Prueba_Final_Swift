//
//  Peliculas.swift
//  Juegos Multiplatform
//
//  Created by Tardes on 19/2/26.
//




import Foundation

class MovieAPI {

    // La direccion de la API y la clave
    static let SERVER_BASE_URL = "https://www.omdbapi.com"
    static let API_KEY  = "96029931"

    // Funcion para buscar peliculas por nombre
    static func buscarPeliculas(title: String) async -> [Movie] {

        // Preparamos el nombre para que funcione en la URL (los espacios se convierten en %20)
        let nombreParaURL = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? title

        // Armamos la URL completa
        let urlTexto = "\(SERVER_BASE_URL)/?apikey=\(API_KEY)&s=\(nombreParaURL)"

        // Comprobamos que la URL sea valida
        guard let url = URL(string: urlTexto) else {
            print("Error: la URL no es valida")
            return []
        }

        // Hacemos la llamada a internet
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // Convertimos el JSON que nos llego en nuestros structs
            let respuesta = try JSONDecoder().decode(SearchResponse.self, from: data)

            // Si la respuesta es "True" devolvemos las peliculas, si no devolvemos lista vacia
            if respuesta.response == "True" {
                return respuesta.search ?? []
            } else {
                print("No se encontraron peliculas")
                return []
            }

        } catch {
            print("Algo salio mal: \(error)")
            return []
        }
    }
    
    static func getMovieDetails(imdbID: String) async -> Movie? {
        
        let urlTexto = "\(SERVER_BASE_URL)/?apikey=\(API_KEY)&i=\(imdbID)"
        
        guard let url = URL(string: urlTexto) else {
            print("Error: la URL no es valida")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let respuesta = try  JSONDecoder().decode(Movie.self, from: data)
            return respuesta
        } catch {
            print("Invalid data")
            print("Error info: \(error)")
            return nil
        }
    }
}
