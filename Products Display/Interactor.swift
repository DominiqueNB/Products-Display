//
//  Interactor.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import Foundation

protocol InteractorProtocol {
    var items: [String] { get }
    func fetchItems()
    func search(_ term: String)
}

final class Interactor: InteractorProtocol {
    var items: [String] = []
    let presenter: PresenterProtocol = Presenter()


    func fetchItems() {
        items.append("Item1")
        items.append("Item2")
        items.append("Item3")
    }

    func search(_ term: String) {
        items.removeAll()
        items.append("\(term)1")
        items.append("\(term)2")
        items.append("\(term)3")

        presenter.presentItems()
    }
}
