//
//  SearchItem.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import Foundation

// MARK: - Search
struct Search: Decodable {
    let site_id, countryDefaultTimeZone, query: String?
    let paging: Paging?
    let results: [Results]
    let sort: Sort?
    let availableSorts: [Sort]?
    let filters: [Filter]?
    let availableFilters: [AvailableFilter]?
    let pdpTracking: PDPTracking?
    let userContext: String?
}

// MARK: - Results
public struct Results: Decodable {
    let id, title, condition, thumbnailID: String?
    let catalogProductID, listingTypeID: String?
    let buyingMode, siteID, categoryID, domainID: String?
    let thumbnail: String?
    let orderBackend, price: Int?
    let availableQuantity: Int?
    let useThumbnailID, acceptsMercadopago: Bool?
    let seller: Seller?
    let attributes: [Attribute]?
    let installments: Installments?
}

struct Paging: Decodable {
    let total, primaryResults, offset, limit: Int?
}

struct Sort: Decodable {
    let id, name: String?
}

struct Filter: Decodable {
    let id, name, type: String?
    let values: [FilterValue]?
}

struct FilterValue: Decodable {
    let id, name: String?
    let pathFromRoot: [Sort]?
}

struct AvailableFilter: Decodable {
    let id, name: String?
    let type: TypeEnum?
    let values: [AvailableFilterValue]?
}

struct AvailableFilterValue: Decodable {
    let id, name: String?
    let results: Int?
}

struct PDPTracking: Decodable {
    let group: Bool?
    let productInfo: [ProductInfo]?
}

struct ProductInfo: Decodable {
    let id: String?
    let score: Int?
    let status: String?
}

enum TypeEnum: Decodable {
    case boolean
    case list
    case range
    case string
    case text
}

struct Attribute: Decodable {
    let id, name: String?
    let valueID: String?
    let valueName, attributeGroupID, attributeGroupName: String?
    let valueStruct: Struct?
    let values: [AttributeValue]?
    let source: Int?
    let valueType: String?
}

struct Struct: Decodable {
    let number: Int?
    let unit: String?
}

struct AttributeValue: Decodable {
    let id: String?
    let name: String?
    let valueStruct: Struct?
    let source: Int?
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

struct Shipping: Decodable {
    let storePickUp, freeShipping: Bool?
    let logisticType, mode: String?
    let tags: [String]?
    let shippingScore: Int?
}
