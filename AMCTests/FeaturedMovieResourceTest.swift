//
//  FeaturedMovieResourceTest.swift
//  AMCTests
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import XCTest

class FeaturedMovieResourceTest: XCTestCase {

	private var featuredMovieResource: FeaturedMovieResource!

	override func setUp() {
		super.setUp()

		featuredMovieResource = StaticFeaturedMovieResource(jsonParser: JSONParser(), jsonFileReader: JSONFileReader())
	}

	func testBanners() {
		featuredMovieResource.banners { result in
			switch result {
			case .success(let urlStrings):
				let urlString = urlStrings.first!
				XCTAssertEqual("https://farm2.staticflickr.com/1938/45159452081_b19edd5869.jpg", urlString)
			case .error(let error):
				XCTFail(error.localizedDescription)
			}
		}
	}
        
	func testFeaturedMovies() {
		featuredMovieResource.featuredMovies() { result in
			switch result {
			case .success(let movies):
				let movie = movies.first!
				XCTAssertEqual("https://farm2.staticflickr.com/1944/31269824148_a12cee4a39.jpg", movie.imageUrl)
			case .error(let error):
				XCTFail(error.localizedDescription)
			}
		}
	}
}
