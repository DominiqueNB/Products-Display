//
//  DetailInteractor.swift
//  Products Display
//
//  Created by Dominique Bezerra on 20/06/24.
//

import UIKit

struct DetailInitializer {
    static func make(item: ItemViewModel) -> UIViewController{
        let imageFetcher = DetailImageFetcher()
        return DetailViewController(imageFetcher: imageFetcher, item: item)
    }
}

