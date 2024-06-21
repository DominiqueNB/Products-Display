//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

final class CoordinatorSpy: CoordinatorProtocol {
    private(set) var navigateToDetailedItemCalled = false
    private(set) var navigateToDetailedItemPassed: ItemViewModel?

    func navigateToDetail(item: Products_Display.ItemViewModel) {
        navigateToDetailedItemCalled = true
        navigateToDetailedItemPassed = item
    }
}
