//
//  Initializer.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import UIKit

struct Initializer {
    static func make() -> UIViewController? {
        let presenter = Presenter()
        let httpClient = URLSessionHTTPClient()
        let url = "api.mercadolibre.com/sites/MLA/search?=q"
        let service = Service(url: URL(string: url)!, client: httpClient)
        let interactor = Interactor(presenter: presenter, service: service)
        let viewController = ViewController(interactor: interactor)

        presenter.viewController = viewController

        return viewController
    }
}
