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
        let coordinator = Coordinator()
        let httpClient = URLSessionHTTPClient()
        let service = Service(client: httpClient)
        let interactor = Interactor(coordinator: coordinator,
                                    presenter: presenter,
                                    service: service)
        let viewController = ViewController(interactor: interactor)

        presenter.viewController = viewController
        coordinator.viewController = viewController

        return viewController
    }
}
