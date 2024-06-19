//
//  Presenter.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import Foundation

protocol PresenterProtocol {
    func presentItems()
    func present(errorMessage: String)
}

struct ItemViewModel {
    let title: String
}

final class Presenter: PresenterProtocol {
    weak var viewController: ViewControllerProtocol?

    func presentItems() {
        viewController?.reloadTableView()
    }

    func present(errorMessage: String) {
        viewController?.renderError(message: errorMessage)
    }
}
