//
//  FeaturedMovieResource.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

protocol FeaturedMovieResource {

	func banners(completion: @escaping ((Result<[String]>) -> Void))

	func featuredMovies(completion: @escaping ((Result<[Movie]>) -> Void))
}
