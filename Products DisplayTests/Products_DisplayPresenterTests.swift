//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

final class Products_DisplayPresenterTests: XCTestCase {
    private let coordinatorSpy = CoordinatorSpy()
    private let viewControllerSpy = ViewControllerSpy()

    private lazy var sut = {
        let presenter = Presenter(coordinator: coordinatorSpy)
        presenter.viewController = viewControllerSpy
        return presenter
    }()

    func test_presentItems_shouldCallViewControllerReloadTableView() {
        sut.presentItems()

        XCTAssertTrue(viewControllerSpy.reloadTableViewCalled)
    }

    func test_presentError_shouldRenderErrorMessage() {
        sut.present(errorMessage: "")

        XCTAssertTrue(viewControllerSpy.renderErrorMessageCalled)
        XCTAssertEqual(viewControllerSpy.messagePassed, "")
    }

    func test_presentDetailedItem_shouldNavigateToDetailedItem() {
        sut.presentDetailed(.fixture())

        XCTAssertTrue(coordinatorSpy.navigateToDetailedItemCalled)
        XCTAssertEqual(coordinatorSpy.navigateToDetailedItemPassed, ItemViewModel.fixture())
    }
}
