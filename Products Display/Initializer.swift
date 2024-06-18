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
        let interactor = Interactor(presenter: presenter)
        let viewController = ViewController(interactor: interactor)

        presenter.viewController = viewController

        return viewController
    }
}
