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
    let id, title, condition, thumbnailID: String
    let catalogProductID, listingTypeID: String
    let permalink: String
    let buyingMode, siteID, categoryID, domainID: String
    let thumbnail: String
    let currencyID: String
    let orderBackend, price: Int
    let availableQuantity: Int
    let useThumbnailID, acceptsMercadopago: Bool
    let shipping: Shipping
    let stopTime: String
    let seller: Seller
    let attributes: [Attribute]
    let installments: Installments
    let catalogListing: Bool
}

// MARK: - Attribute
struct Attribute: Decodable {
    let id, name: String
    let valueID: String?
    let valueName, attributeGroupID, attributeGroupName: String
    let valueStruct: Struct?
    let values: [AttributeValue]
    let source: Int
    let valueType: String
}

// MARK: - Struct
struct Struct: Decodable {
    let number: Int
    let unit: String
}

// MARK: - AttributeValue
struct AttributeValue: Decodable {
    let id: String?
    let name: String
    let valueStruct: Struct?
    let source: Int
}

// MARK: - Installments
struct Installments: Decodable {
    let quantity: Int
    let amount, rate: Double
    let currencyID: String
}

// MARK: - Seller
struct Seller: Decodable {
    let id: Int
    let nickname: String
}

// MARK: - Shipping
struct Shipping: Decodable {
    let storePickUp, freeShipping: Bool
    let logisticType, mode: String
    let tags: [String]
    let shippingScore: Int
}
