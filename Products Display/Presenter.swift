//
//  Presenter.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import Foundation

protocol PresenterProtocol {
    func presentItems()
}

final class Presenter: PresenterProtocol {
    weak var viewController: ViewControllerProtocol?

    func presentItems() {
        viewController?.reloadTableView()
    }
}
