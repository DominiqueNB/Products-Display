//
//  Coordinator.swift
//  Products Display
//
//  Created by Dominique Bezerra on 19/06/24.
//

import Foundation

protocol CoordinatorProtocol {
    func navigateToDetail(item: ItemViewModel)
}

final class Coordinator: CoordinatorProtocol {
    weak var viewController: ViewControllerProtocol?

    func navigateToDetail(item: ItemViewModel) {
        let destinationController = DetailViewController(item: item)
        viewController?.present(viewController: destinationController)
    }
}
