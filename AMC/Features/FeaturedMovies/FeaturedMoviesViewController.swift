//
//  FeaturedMoviesViewController.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class FeaturedMoviesViewController: UIViewController {

	// MARK: - Public properties

	var featuredMovieResource = RemoteFeaturedMovieResource(
		networkingManager: NetworkingManager(),
		jsonParser: JSONParser()
	)

	// MARK: - Lifecycle methods
	
    override func viewDidLoad() {
        super.viewDidLoad()

		featuredMovieResource.moviesBy(tag: "horror") { result in
			switch result {
			case .success(let movies):
				break
			case .error(let error):
				let errorMessage: String
				if let error = error as? UtilityError {
					errorMessage = error.localizedDescription
				} else {
					errorMessage = error.localizedDescription
				}
				print("error: \(errorMessage)")
			}
		}
    }
}
