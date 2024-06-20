//
//  ItemViewModel.swift
//  Products Display
//
//  Created by Dominique Bezerra on 19/06/24.
//

import Foundation
import UIKit

struct ItemViewModel {
    let id, title, catalogProductID, buyingMode, siteID, categoryID, domainID, thumbnail: String
    let orderBackend, price, availableQuantity: Int?
    let useThumbnailID, acceptsMercadopago: Bool?
    let seller: Seller?
    let installments: Installments?
    let attribute: Attribute?
    var image: UIImage?

    init(item: Results) {
        self.id = item.id ?? ""
        self.title = item.title ?? ""
        self.catalogProductID = item.catalogProductID ?? ""
        self.buyingMode = item.buyingMode ?? ""
        self.siteID = item.siteID ?? ""
        self.categoryID = item.categoryID ?? ""
        self.domainID = item.domainID ?? ""
        self.thumbnail = item.thumbnail ?? ""
        self.orderBackend = item.orderBackend
        self.price = item.price
        self.availableQuantity = item.availableQuantity
        self.useThumbnailID = item.useThumbnailID
        self.acceptsMercadopago = item.acceptsMercadopago
        self.seller = item.seller
        self.installments = item.installments
        self.attribute = item.attribute
    }
}
