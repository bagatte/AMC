//
//  Movie.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct Movie {

	let imageUrl: String

	init?(imageUrl: String) {
		guard imageUrl.isEmpty == false else {
			return nil
		}

		self.imageUrl = imageUrl
	}
}

extension Movie: Model {

	init?(json: JSON) {
		guard let imageUrl = json["url_m"] as? String, imageUrl.isEmpty == false else {
			return nil
		}

		self.imageUrl = imageUrl
	}
}
