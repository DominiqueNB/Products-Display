//
//  ViewController.swift
//  Products Display
//
//  Created by Dominique Bezerra on 17/06/24.
//

import UIKit

class ViewController: UIViewController {
    private lazy var sampleView: View = {
        return View()
    }()

    override func loadView() {
        super.loadView()

        self.view = sampleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        sampleView.setup(labelText: "Busca de Produtos", buttonTitle: "Buscar")
    }
}
