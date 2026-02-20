//
//  PortadaViewController.swift
//  Prueba_Fianl
//
//  Created by Tardes on 19/2/26.
//

import UIKit

class PortadaViewController: UIViewController {
    @IBOutlet weak var StarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //ocultamos el navigation controller (el titulo)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    //y cuando salga de la pantalla de bienvenidos lo muestra
    //lo usamos asi para poder que no muestre el navigation en la pantalla principal
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}
