//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

final class Products_DisplayCoordinatorTests: XCTestCase {
    private let viewControllerSpy = ViewControllerSpy()

    private lazy var sut = {
        let coordinator = Coordinator()
        coordinator.viewController = viewControllerSpy
        return coordinator
    }()

    func test_presentItems_should() {
        sut.navigateToDetail(item: .fixture())

        XCTAssertTrue(viewControllerSpy.presentViewControllerCalled)
        XCTAssertTrue(viewControllerSpy.presentViewControllerPassed is DetailViewController)
    }
}

