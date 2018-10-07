//
//  FeaturedMoviesViewModel.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct FeaturedMoviesViewModel {

	// MARK: - Private properties

	private(set) var newlyAddedViewModel: FeaturedSectionViewModel?
	private(set) var curatorsChoiceViewModel: FeaturedSectionViewModel?
	private(set) var bestSoundTracksViewModel: FeaturedSectionViewModel?
	private(set) var getRadViewModel: FeaturedSectionViewModel?
	private(set) var vengeanceIsHersViewModel: FeaturedSectionViewModel?
	private(set) var blackMagicViewModel: FeaturedSectionViewModel?
	private(set) var hauntsViewModel: FeaturedSectionViewModel?
	private(set) var bingeThisViewModel: FeaturedSectionViewModel?

	// MARK: - Init

	init(movies: [Movie]) {
		guard movies.isEmpty == false else {
			return
		}

		var sortedMovies: [Movie]
		let numberOfItemsPerSection = movies.count / FeaturedMoviesSection.allSections.count
		var imageIndex = 0

		for index in 0...FeaturedMoviesSection.allSections.count {
			sortedMovies = []
			var count = numberOfItemsPerSection

			repeat {
				sortedMovies.append(movies[imageIndex])
				imageIndex += 1
				count -= 1
			} while count > 0 && imageIndex <= movies.count - 1

			if index == FeaturedMoviesSection.newlyAdded.index {
				newlyAddedViewModel = FeaturedSectionViewModel(title: FeaturedMoviesSection.newlyAdded.rawValue, movies: sortedMovies)
			} else if index == FeaturedMoviesSection.curatorsChoice.index {
				curatorsChoiceViewModel = FeaturedSectionViewModel(title: FeaturedMoviesSection.curatorsChoice.rawValue, movies: sortedMovies)
			} else if index == FeaturedMoviesSection.bestSoundTracks.index {
				bestSoundTracksViewModel = FeaturedSectionViewModel(title: FeaturedMoviesSection.bestSoundTracks.rawValue, movies: sortedMovies)
			} else if index == FeaturedMoviesSection.getRad.index {
				getRadViewModel = FeaturedSectionViewModel(title: FeaturedMoviesSection.getRad.rawValue, movies: sortedMovies)
			} else if index == FeaturedMoviesSection.vengeanceIsHers.index {
				vengeanceIsHersViewModel = FeaturedSectionViewModel(title: FeaturedMoviesSection.vengeanceIsHers.rawValue, movies: sortedMovies)
			} else if index == FeaturedMoviesSection.blackMagic.index {
				blackMagicViewModel = FeaturedSectionViewModel(title: FeaturedMoviesSection.blackMagic.rawValue, movies: sortedMovies)
			} else if index == FeaturedMoviesSection.haunts.index {
				hauntsViewModel = FeaturedSectionViewModel(title: FeaturedMoviesSection.haunts.rawValue, movies: sortedMovies)
			} else if index == FeaturedMoviesSection.bingeThis.index {
				bingeThisViewModel = FeaturedSectionViewModel(title: FeaturedMoviesSection.bingeThis.rawValue, movies: sortedMovies)
			}
		}
	}
}
