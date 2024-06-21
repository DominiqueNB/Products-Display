//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

final class ServiceSpy: ServiceProtocol {
    public private(set) var loadItemCompletionCalled = false
    public private(set) var loadItemPassed: String?
    var completeWithResult: ProductResult?

    func load(item: String, completion: @escaping (Products_Display.ProductResult) -> Void) {
        loadItemCompletionCalled = true
        loadItemPassed = item
        if let result = completeWithResult {
            completion(result)
        }
    }
}
