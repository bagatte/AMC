//
//  MovieTest.swift
//  AMCTests
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import XCTest

class MovieTest: XCTestCase {

	private var jsonFileReader: JSONFileReader!

	override func setUp() {
		super.setUp()

		jsonFileReader = JSONFileReader()
	}

	// MARK: - Public methods

	func testMovieModelWithEmptyArguments() {
		let movie = Movie(id: "", imageUrl: "")
		XCTAssertTrue(movie == nil, "Movie should be nil.")
	}

	func testMovieModelWithArguments() {
		let movie = Movie(id: "0", imageUrl: "imageUrl")
		XCTAssertTrue(movie != nil, "Movie should not be nil.")
		XCTAssertTrue(movie!.id.isEmpty == false, "id should not be nil")
		XCTAssertTrue(movie!.imageUrl.isEmpty == false, "imageUrl should not be nil")
	}

	func testMovieModelWithJsonInitializer() {
		let jsonObject = try! jsonFileReader.contentsOfFile("movies") as! JSON
		let photosJson = jsonObject["photos"] as! JSON
		JSONParserTests.parseCollection(photosJson, model: Movie.self)
	}
}
