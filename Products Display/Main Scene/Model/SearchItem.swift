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
    enum CodingKeys: String, CodingKey {
        case availableQuantity = "available_quantity"
        case id, title, thumbnail
        case price
        case attributes
    }
    let id, title, thumbnail: String
    let price, availableQuantity: Int
    let attributes: [Attributes]
}

struct Attributes: Decodable {
    enum CodingKeys: String, CodingKey {
        case valueName = "value_name"
        case name
    }
    let name: String
    let valueName: String
}
