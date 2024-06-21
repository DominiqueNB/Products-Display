//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

final class ViewControllerSpy: ViewControllerProtocol {
    private(set) var reloadTableViewCalled = false
    func reloadTableView() {
        reloadTableViewCalled = true
    }

    private(set) var presentViewControllerCalled = false
    private(set) var presentViewControllerPassed: UIViewController?
    func present(viewController: UIViewController) {
        presentViewControllerCalled = true
        presentViewControllerPassed = viewController
    }

    private(set) var renderErrorMessageCalled = false
    private(set) var messagePassed: String?
    func renderError(message: String) {
        renderErrorMessageCalled = true
        messagePassed = message
    }
}
