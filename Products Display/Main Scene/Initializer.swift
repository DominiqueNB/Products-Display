//
//  Initializer.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import UIKit

struct Initializer {
    static func make() -> UIViewController? {
        let coordinator = Coordinator()
        let httpClient = URLSessionHTTPClient()
        let service = Service(client: httpClient)
        let presenter = Presenter(coordinator: coordinator)
        let interactor = Interactor(presenter: presenter,
                                    service: service)
        let viewController = ViewController(interactor: interactor)

        presenter.viewController = viewController
        coordinator.viewController = viewController

        return viewController
    }
}
