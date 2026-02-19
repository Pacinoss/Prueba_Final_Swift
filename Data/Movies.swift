//
//  Peliculas.swift
//  Juegos Multiplatform
//
//  Created by Tardes on 19/2/26.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let imdbID: String
    let poster: String
    
    //campos opcionales; detalle (&i=)
    let rated: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let director: String?
    let writer: String?
    let actors: String?
    let plot: String?
    let language: String?
    let country: String?
    let awards: String?
    let imdbRating: String?
    let imdbVotes: String?
    let boxOffice: String?
    let response: String?

    enum CodingKeys: String, CodingKey {
        case title      = "Title"
        case year       = "Year"
        case rated      = "Rated"
        case released   = "Released"
        case runtime    = "Runtime"
        case genre      = "Genre"
        case director   = "Director"
        case writer     = "Writer"
        case actors     = "Actors"
        case plot       = "Plot"
        case language   = "Language"
        case country    = "Country"
        case awards     = "Awards"
        case poster     = "Poster"
        case imdbRating = "imdbRating"
        case imdbVotes  = "imdbVotes"
        case imdbID     = "imdbID"
        case boxOffice  = "BoxOffice"
        case response   = "Response"
    }
}
/*
 {
     "Title": "Guardians of the Galaxy Vol. 2",
     "Year": "2017",
     "Rated": "PG-13",
     "Released": "05 May 2017",
     "Runtime": "136 min",
     "Genre": "Action, Adventure, Comedy",
     "Director": "James Gunn",
     "Writer": "James Gunn, Dan Abnett, Andy Lanning",
     "Actors": "Chris Pratt, Zoe Saldaña, Dave Bautista",
     "Plot": "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father, the ambitious celestial being Ego.",
     "Language": "English",
     "Country": "United States",
     "Awards": "Nominated for 1 Oscar. 15 wins & 60 nominations total",
     "Poster": "https://m.media-amazon.com/images/M/MV5BNWE5MGI3MDctMmU5Ni00YzI2LWEzMTQtZGIyZDA5MzQzNDBhXkEyXkFqcGc@._V1_SX300.jpg",
     "Ratings": [
         {
             "Source": "Internet Movie Database",
             "Value": "7.6/10"
         },
         {
             "Source": "Rotten Tomatoes",
             "Value": "85%"
         },
         {
             "Source": "Metacritic",
             "Value": "67/100"
         }
     ],
     "Metascore": "67",
     "imdbRating": "7.6",
     "imdbVotes": "819,917",
     "imdbID": "tt3896198",
     "Type": "movie",
     "DVD": "N/A",
     "BoxOffice": "$389,813,101",
     "Production": "N/A",
     "Website": "N/A",
     "Response": "True"
 }
 */
