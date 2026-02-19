//
//  SearchResponse.swift
//  Prueba_Fianl
//
//  Created by Tardes on 19/2/26.
//


import Foundation

struct SearchResponse: Codable {
    let search: [Movie]?
    let response: String

    enum CodingKeys: String, CodingKey {
        case search   = "Search"
        case response = "Response"
    }
}