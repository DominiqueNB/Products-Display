//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

final class PresenterSpy: PresenterProtocol {
    public private(set) var presentItemsCalled = false
    func presentItems() {
        presentItemsCalled = true
    }

    public private(set) var presentErrorMessageCalled = false
    public private(set) var presentErrorPassed: String?
    func present(errorMessage: String) {
        presentErrorMessageCalled = true
        presentErrorPassed = errorMessage
    }

    public private(set) var presentDetailedItemCalled = false
    public private(set) var presentDetailedItemPassed: Results?
    func presentDetailed(_ item: Products_Display.Results) {
        presentDetailedItemCalled = true
        presentDetailedItemPassed = item
    }
}
