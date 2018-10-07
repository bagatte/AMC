//
//  NetworkingManager.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class NetworkingManager: NSObject {

	func request(endpoint: Endpoint, completion: @escaping ((Result<Any>) -> Void)) {
		guard let url = URL(string: endpoint.path) else {
			return
		}

		var request = URLRequest(url: url)
		request.httpMethod = endpoint.method.rawValue

		let sessionConfiguration = URLSessionConfiguration.default
		let urlSession = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: nil)
		let sessionTask = urlSession.dataTask(with: request) { (data, response, error) in
			if error != nil {
				completion(Result.error(UtilityError.serverError(description: nil)))
				return
			}

			do {
				guard let data = data else {
					completion(Result.error(UtilityError.notFoundError))
					return
				}
				let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])

				if
					let json = jsonObject as? JSON,
					let status = json["stat"] as? String,
					status == "fail" {
					if let messsage = json["message"] as? String {
						completion(Result.error(UtilityError.serverError(description: messsage)))
					}
				} else {
					completion(Result.success(value: jsonObject))
				}

			} catch {
				completion(Result.error(UtilityError.networkingError))
			}
		}
		sessionTask.resume()
	}
}
