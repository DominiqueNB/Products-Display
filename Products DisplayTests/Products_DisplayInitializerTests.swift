//
//  Products_DisplayTests.swift
//  Products DisplayTests
//
//  Created by Dominique Bezerra on 21/06/24.
//

import XCTest
@testable import Products_Display

final class Products_DisplayInitializerTests: XCTestCase {
    func test_make_shouldReturnConfiguredViewController() {
        guard let viewController = Initializer.make() as? ViewController else {
            XCTFail("Expected a ViewController instance, got nil or another type")
            return
        }

        do {
            try validateViewController(viewController)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    private func validateViewController(_ viewController: ViewController) throws {
        let interactor: Interactor = try XCTUnwrap(mirror(from: viewController, property: "interactor"))
        try validateInteractor(interactor)
    }

    private func validateInteractor(_ interactor: Interactor) throws {
        let presenter: Presenter = try XCTUnwrap(mirror(from: interactor, property: "presenter"))
        try validatePresenter(presenter)

        let service: Service = try XCTUnwrap(mirror(from: interactor, property: "service"))
        try validateService(service)
    }

    private func validatePresenter(_ presenter: Presenter) throws {
        let viewController: ViewController = try XCTUnwrap(mirror(from: presenter, property: "viewController"))
        XCTAssertNotNil(viewController, "ViewController should not be nil")

        let coordinator: Coordinator = try XCTUnwrap(mirror(from: presenter, property: "coordinator"))
        try validateCoordinator(coordinator)
    }

    private func validateService(_ service: Service) throws {
        let client: URLSessionHTTPClient = try XCTUnwrap(mirror(from: service, property: "client"))
        XCTAssertNotNil(client, "HTTPClient should not be nil")
    }

    private func validateCoordinator(_ coordinator: Coordinator) throws {
        let viewController: ViewController = try XCTUnwrap(mirror(from: coordinator, property: "viewController"))
        XCTAssertNotNil(viewController, "ViewController should not be nil")
    }
}
