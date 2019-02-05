//
//  APITests.swift
//  HelloCanadaTests
//
//  Created by Pranil on 2/5/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import XCTest
@testable import HelloCanada

class APITests: XCTestCase {

    var expectation: XCTestExpectation?

    override func setUp() {
    }

    // Testing homedata API
    func testGetHomeDataAPI() {
        self.expectation = XCTestExpectation(description: "Fetching home data...")
        let homeViewInteractor = HomeViewInteractor(presenter: self)
        homeViewInteractor.fetchAboutCanadaDetails()
        wait(for: [self.expectation!], timeout: 20)
    }

    override func tearDown() {
        expectation = nil
    }
}

extension APITests: HomeViewOutputInteractorProtocol {

    func aboutCanadaListDidFetch(aboutCanada: AboutCanadaResponse?) {
        // Testing whether API is giving about candada details
        XCTAssertNotNil(aboutCanada,"HomeAPI Failed")

        guard let aboutCanadaDeails = aboutCanada else { return }

        // For testing whether all details getting from API
        if let canadaDetails = aboutCanadaDeails.rows {

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

    func aboutCanadaListDidFetchFailed(error: Error?) {

        XCTFail((error as? APIError)?.localizedDescription ?? "Home API Failed")
        expectation?.fulfill()
    }

}
