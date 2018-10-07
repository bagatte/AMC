//
//  RemoteFeaturedMovieResource.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class RemoteFeaturedMovieResource: FeaturedMovieResource {

	// MARK: - Private properties

	private var networkingManager: NetworkingManager
	private var jsonParser: JSONParser
	private let baseUrl = Constants.Flickr.baseUrl

	// MARK: - Init

	init(networkingManager: NetworkingManager, jsonParser: JSONParser) {
		self.networkingManager = networkingManager
		self.jsonParser = jsonParser
	}

	// MARK: - Public functions
	
	func moviesBy(tag: String, completion: @escaping ((Result<[Movie]>) -> Void)) {
		networkingManager
			.request(endpoint: Endpoint(path: "\(baseUrl)?method=flickr.photos.search&format=json&orientation=portrait&media=photos&tags=\(tag)&nojsoncallback=1&extras=url_m&api_key=\(Constants.Flickr.apiKey)",
										method: .get)) { [weak self] result in
											guard let `self` = self else {
												return
											}
											switch result {
											case .success(let object):
												do {
													guard
														let json = object as? JSON,
														let photosJson = json["photos"] as? JSON else {
															completion(.error(UtilityError.jsonParserInvalidJSON))
															return
													}

													let movies: [Movie] = try self.jsonParser.parseCollection(json: photosJson, key: "photo")
													completion(.success(value: movies))
												} catch (let error) {
													completion(.error(error))
												}
											case .error(let error):
												completion(.error(error))
											}
		}
	}
}
