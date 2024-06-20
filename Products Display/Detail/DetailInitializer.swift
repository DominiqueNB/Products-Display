//
//  DetailInteractor.swift
//  Products Display
//
//  Created by Dominique Bezerra on 20/06/24.
//

import UIKit

struct DetailInitializer {
    static func make(item: ItemViewModel) -> UIViewController{
        let interactor = DetailInteractor()
        return DetailViewController(interactor: interactor, item: item)
    }
}

