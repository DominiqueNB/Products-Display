//
//  Interactor.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import Foundation

protocol InteractorProtocol {
    var items: [String] { get }
    func fetchItems() -> [String]
    func search(_ term: String)
}

final class Interactor: InteractorProtocol {
    var items: [String] = []
    let presenter: PresenterProtocol
    let service: ServiceProtocol

    init(presenter: PresenterProtocol, service: ServiceProtocol) {
        self.presenter = presenter
        self.service = service
    }

    func fetchItems() -> [String] {
        return items
    }

    func search(_ term: String) {
        items.removeAll()
        items.append("\(term)1")
        items.append("\(term)2")
        items.append("\(term)3")

        presenter.presentItems()
    }
}
