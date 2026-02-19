//
//  UIImageView + ImageLoading.swift
//  Juegos Multiplatform
//
//  Created by Tardes on 18/2/26.
//


import Foundation
import UIKit
//esta funcion es al quew hace el trabajo
//nos decarga la imagen que selceonamos
extension UIImageView {
    func loadFrom(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    // esta es la ayuda
    func loadFrom(url: String) {
        if let url = URL(string: url) {
            self.loadFrom(url: url)
        }
    }
}
