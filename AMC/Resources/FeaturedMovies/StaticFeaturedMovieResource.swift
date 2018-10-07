//
//  StaticFeaturedMovieResource.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class StaticFeaturedMovieResource: FeaturedMovieResource {

	// MARK: - Private properties

	private var jsonFileReader: JSONFileReader
	private var jsonParser: JSONParser

	// MARK: - Init
	
	init(jsonParser: JSONParser, jsonFileReader: JSONFileReader) {
		self.jsonParser = jsonParser
		self.jsonFileReader = jsonFileReader
	}

	// MARK: - Public functions
	
	func moviesBy(tag: String, completion: @escaping ((Result<[Movie]>) -> Void)) {
		do {
			let jsonObject = try jsonFileReader.contentsOfFile("movies") as! JSON
			let photosJson = jsonObject["photos"] as! JSON
			let movies: [Movie] = try jsonParser.parseCollection(json: photosJson, key: "photo")
			completion(Result.success(value: movies))
		} catch {
			completion(.error(error))
		}
	}
}
