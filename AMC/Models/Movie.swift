//
//  Movie.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct Movie {

	let id: String

	let imageUrl: String

	init?(id: String, imageUrl: String) {
		guard id.isEmpty == false, imageUrl.isEmpty == false else {
			return nil
		}
		self.id = id
		self.imageUrl = imageUrl
	}
}

extension Movie: Model {

	init?(json: JSON) {
		guard
			let id = json["id"] as? String, id.isEmpty == false,
			let imageUrl = json["url_m"] as? String, imageUrl.isEmpty == false else {
				return nil
		}
		self.id = id
		self.imageUrl = imageUrl
	}
}
