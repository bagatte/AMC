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

	func banners(completion: @escaping ((Result<[String]>) -> Void)) {
		do {
			let jsonObject = try jsonFileReader.contentsOfFile("banners") as! JSON
			guard
				let photosJson = jsonObject["photos"] as? JSON,
				let photosJsonArray = photosJson["photo"] as? [JSON] else {
					completion(.error(UtilityError.jsonParserInvalidJSON))
					return
			}
			let filteredJson = Array(photosJsonArray.prefix(4))
			let imagesUrlString = filteredJson.compactMap({ json -> String? in
				guard let imageUrl = json["url_m"] as? String else {
					return nil
				}
				return imageUrl
			})
			completion(.success(value: imagesUrlString))
		} catch {
			completion(.error(error))
		}
	}
	
	func featuredMovies(completion: @escaping ((Result<[Movie]>) -> Void)) {
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
