//
//  JSONParser.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

typealias JSON = [String: Any]

struct JSONParser {

	// MARK: - Public functions

	func parseCollection<T: Model>(json: JSON, key: String) throws -> [T] {
		guard let jsonArray = json[key] as? [JSON] else {
			throw UtilityError.jsonParserInvalidJSON
		}

		let collection = try jsonArray.map { json -> T in
			guard let model = T(json: json) else {
				throw UtilityError.jsonParserDecodingFailure
			}
			return model
		}

		return collection
	}
}
