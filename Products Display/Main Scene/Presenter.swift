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
    func presentDetailed(_ item: Results)
}

final class Presenter: PresenterProtocol {
    weak var viewController: ViewControllerProtocol?
    let coordinator: CoordinatorProtocol

    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func presentItems() {
        viewController?.reloadTableView()
    }

    func present(errorMessage: String) {
        viewController?.renderError(message: errorMessage)
    }

    func presentDetailed(_ item: Results) {
        let item = ItemViewModel(id: item.id,
                                 title: item.title,
                                 thumbnail: item.thumbnail,
                                 price: "\(item.price)",
                                 availableQuantity: "\(item.availableQuantity)",
                                 attributes: item.attributes)

        coordinator.navigateToDetail(item: item)
    }
}
