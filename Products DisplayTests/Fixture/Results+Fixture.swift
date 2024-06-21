//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

extension Products_Display.Results {
    static func fixture(id: String = "",
                        title: String = "",
                        thumbnail: String = "",
                        price: Double = .zero,
                        availableQuantity: Int = 0,
                        attributes: [Attributes] = []) -> Self {
        return .init(id: id, title: title, thumbnail: thumbnail, price: price, availableQuantity: availableQuantity, attributes: attributes)
    }
}
