//
//  JSONParserTests.swift
//  AMCTests
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import XCTest

class JSONParserTests {

	private static let jsonParser: JSONParser = JSONParser()
        
	static func parseCollection<T: Model>(_ json: JSON, model: T.Type) {
		do {
			let _: [T] = try jsonParser.parseCollection(json: json, key: "photo")
		} catch {
			XCTFail("Coulnd't parse json into \(model) \(error)")
		}
	}
}
