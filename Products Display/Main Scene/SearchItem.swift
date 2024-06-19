//
//  SearchItem.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import Foundation

// MARK: - Search
struct Search: Decodable {
    let results: [Results]
}

// MARK: - Results
public struct Results: Decodable {
    let id, title, catalogProductID, buyingMode, siteID, categoryID, domainID, thumbnail: String?
    let orderBackend, price, availableQuantity: Int?
    let useThumbnailID, acceptsMercadopago: Bool?
    let seller: Seller?
    let installments: Installments?
    let attribute: Attribute?
}

struct Installments: Decodable {
    let quantity: Int?
    let amount, rate: Double?
    let currencyID: String?
}

struct Seller: Decodable {
    let id: Int?
    let nickname: String?
}

struct Attribute: Decodable {
    let id, name, valueID, valueName: String?
}
