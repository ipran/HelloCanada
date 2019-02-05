//
//  HomeViewTests.swift
//  HelloCanadaTests
//
//  Created by Pranil on 2/2/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import XCTest
@testable import HelloCanada

class HomeViewTests: XCTestCase {

    var homeViewController = HomeViewController()
    var expectation: XCTestExpectation?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        HomeViewRouter.createHomeViewModule(homeViewRef: homeViewController)

    }

    // MARK: - Base Tests
    func testWhetherHomeModuleConfiguredCorrectly() {
        XCTAssertNotNil(homeViewController.presentor, "Presenter is nil")
        XCTAssertNotNil(homeViewController.presentor?.interactor, "Interactor is nil")
        XCTAssertNotNil(homeViewController.presentor?.router, "Router is nil")
    }

    // MARK: - Home view module integration test
    func testHomeViewDidLoadAndHomeDataFetching() {
        expectation = XCTestExpectation(description: "Fetch homedata")
        homeViewController.presentor?.view = self
        homeViewController.presentor?.viewDidLoad()
        wait(for: [expectation!], timeout: 20.0)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        expectation?.fulfill()
        expectation = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}


extension HomeViewTests: HomeViewProtocol {

    func showCountryDetails(forTheCountry canada: AboutCanadaResponse) {

        // Testing whether aapi is giving about canada details
        XCTAssert(canada.rows?.count ?? 0 > 0, "Empty country details")

        // For testing whether all details getting from API
        if let canadaDetails = canada.rows {

            for aboutCanada in canadaDetails {

                if let title = aboutCanada.title,
                    let description = aboutCanada.description,
                    let imageURL = aboutCanada.imageHref {

                    XCTAssertFalse(title.isEmpty, "Canada detail with empty title")
                    XCTAssertFalse(description.isEmpty, "Canada detail with empty description")
                    XCTAssertNotNil(imageURL, "Canada detail with no image")
                }
            }
        }
        expectation?.fulfill()
    }

    func showAPIError(message: String) {
        XCTFail(message)
        expectation?.fulfill()
    }

}
