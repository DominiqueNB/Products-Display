//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

final class Products_DisplayInteractorTests: XCTestCase {
    private let presenterSpy = PresenterSpy()
    private let serviceSpy = ServiceSpy()
    let item: Results = .fixture()

    private lazy var sut = {
        let interactor = Interactor(presenter: presenterSpy, service: serviceSpy)
        interactor.items = [item]
        return interactor
    }()

    func test_clearItems_shouldEmptyItemsAndCallPresentItems() {
        sut.clearItems()

        XCTAssertEqual(sut.items.count, 0)
        XCTAssertTrue(presenterSpy.presentItemsCalled)
    }

    func test_didSelectItem_shouldCallPresenterPresentDetailedItem() {
        let index = 0
        sut.didSelectItem(at: index)

        XCTAssertTrue(presenterSpy.presentDetailedItemCalled)
        XCTAssertEqual(presenterSpy.presentDetailedItemPassed, item)
    }

    func test_searchValidTerm_shouldPresentItems() {
        serviceSpy.completeWithResult = .success([ item ])
        sut.search("Casa")

        XCTAssertTrue(serviceSpy.loadItemCompletionCalled)
        XCTAssertTrue(presenterSpy.presentItemsCalled)
    }

    func test_searchTerm_whenFails_shouldPresentError() {
        let error: Service.Error = .connectivity
        serviceSpy.completeWithResult = .failure(error)
        sut.search("")

        XCTAssertEqual(sut.items.count, 0)
        XCTAssertTrue(presenterSpy.presentErrorMessageCalled)
    }
}
