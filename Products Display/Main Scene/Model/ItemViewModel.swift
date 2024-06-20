//
//  ItemViewModel.swift
//  Products Display
//
//  Created by Dominique Bezerra on 19/06/24.
//

import Foundation
import UIKit

struct ItemViewModel {
    let id, title, thumbnail: String
    let price, availableQuantity: String
    let attributes: [Attributes]
    var image: UIImage?
}
