//
//  Interactor.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import Foundation

protocol InteractorProtocol {
    var items: [Results] { get }
    func search(_ term: String)
}

final class Interactor: InteractorProtocol {
    var items: [Results] = []
    let presenter: PresenterProtocol
    let service: ServiceProtocol

    init(presenter: PresenterProtocol, service: ServiceProtocol) {
        self.presenter = presenter
        self.service = service
    }

    func search(_ term: String) {
        items.removeAll()

        service.load(item: term) { [weak self] result in
            switch result {
            case .success(let results):
                self?.items = results
                self?.presenter.presentItems()
            case .failure(let error):
                self?.items.removeAll()
                self?.presenter.present(errorMessage: error.localizedDescription)
            }
        }
    }
}
