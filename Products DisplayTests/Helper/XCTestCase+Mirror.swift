//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest

public extension XCTestCase {
    func mirror<T>(from object: Any, property propertyName: String) throws -> T {
        let mirror = Mirror(reflecting: object)
        guard let value = mirror.descendant(propertyName) as? T else {
            throw NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Property \(propertyName) not found"])
        }
        return value
    }
}
