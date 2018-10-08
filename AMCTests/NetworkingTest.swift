//
//  NetworkingTest.swift
//  AMCTests
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import XCTest

class NetworkingTest: XCTestCase {

	private var networkingManager: NetworkingManager!

	override func setUp() {
		super.setUp()

		networkingManager = NetworkingManager()
	}
        
	func testEndpointModel() {
		let path = "https://www.path.com/"
		let method: HTTPMethod = .get

		let endpoint = Endpoint(path: path, method: method)

		XCTAssertEqual(endpoint.path, path, "path property doesn't match.")
		XCTAssertEqual(endpoint.method, method, "method poperty doesn't match.")
	}

	func testHTTPMethod() {
		let method: HTTPMethod = .get
		XCTAssertEqual("GET", method.rawValue, "HTTP method rawValue doesn't match.")
	}
}
