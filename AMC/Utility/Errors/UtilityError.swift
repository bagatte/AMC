//
//  UtilityError.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

enum UtilityError: Error {

	case jsonFileReadUnsuccessful
	case jsonParserDecodingFailure
	case jsonParserInvalidJSON
	case serverError
	case networkingError
	case notFoundError

	var localizedDescription: String {
		switch self {
		case .jsonFileReadUnsuccessful:
			return "Error reading JSON file."
		case .jsonParserDecodingFailure:
			return "Error decoding JSON."
		case .jsonParserInvalidJSON:
			return "Error transforming JSON into valid format."
		case .serverError:
			return "Server error."
		case .networkingError:
			return "Networking error."
		case .notFoundError:
			return "Not found."
		}
	}
}
