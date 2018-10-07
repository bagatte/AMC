//
//  FeaturedMovieResource.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

protocol FeaturedMovieResource {

	func moviesBy(tag: String, completion: @escaping ((Result<[Movie]>) -> Void))
}
