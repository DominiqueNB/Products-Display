//
//  Initializer.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import UIKit

struct Initializer {
    static func make() -> UIViewController? {
        let interactor = Interactor()
        let presenter = Presenter()
        let viewController = ViewController()

        presenter.viewController = viewController

        return viewController
    }
}
