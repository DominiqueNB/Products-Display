//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

extension Products_Display.ItemViewModel {
    static func fixture(id: String = "",
                        title: String = "",
                        thumbnail: String = "",
                        price: String = "0.0",
                        availableQuantity: String = "0",
                        attributes: [Attributes] = [],
                        image: UIImage? = nil) -> Self {
        return .init(id: id, title: title, thumbnail: thumbnail, price: price, availableQuantity: availableQuantity, attributes: attributes, image: image)
    }
}
