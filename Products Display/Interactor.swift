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
}

final class Interactor: InteractorProtocol {
    var items: [String] = []

    func fetchItems() {
        items.append("Item1")
        items.append("Item2")
        items.append("Item3")
    }
}
