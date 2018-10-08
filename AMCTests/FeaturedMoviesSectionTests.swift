//
//  FeaturedMoviesSectionTests.swift
//  AMCTests
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import XCTest

class FeaturedMoviesSectionTests: XCTestCase {
        
	func testFeaturedSectionsIndex() {
		let newlyAddedSectionIndex = 1
		let curatorsChoiceSectionIndex = 2
		let bestSoundTracksSectionIndex = 3
		let getRadSectionIndex = 4
		let vengeanceIsHersSectionIndex = 5
		let blackMagicSectionIndex = 6
		let hauntsSectionIndex = 7
		let bingeThisSectionIndex = 8

		let newlyAddedSection = FeaturedMoviesSection.newlyAdded
		let curatorsChoiceSection = FeaturedMoviesSection.curatorsChoice
		let bestSoundTracksSection = FeaturedMoviesSection.bestSoundTracks
		let getRadSection = FeaturedMoviesSection.getRad
		let vengeanceIsHersSection = FeaturedMoviesSection.vengeanceIsHers
		let blackMagicSection = FeaturedMoviesSection.blackMagic
		let hauntsSection = FeaturedMoviesSection.haunts
		let bingeThisSection = FeaturedMoviesSection.bingeThis

		XCTAssertEqual(newlyAddedSectionIndex, newlyAddedSection.index)
		XCTAssertEqual(curatorsChoiceSectionIndex, curatorsChoiceSection.index)
		XCTAssertEqual(bestSoundTracksSectionIndex, bestSoundTracksSection.index)
		XCTAssertEqual(getRadSectionIndex, getRadSection.index)
		XCTAssertEqual(vengeanceIsHersSectionIndex, vengeanceIsHersSection.index)
		XCTAssertEqual(blackMagicSectionIndex, blackMagicSection.index)
		XCTAssertEqual(hauntsSectionIndex, hauntsSection.index)
		XCTAssertEqual(bingeThisSectionIndex, bingeThisSection.index)
	}

	func testFeaturedSectionViewModel() {
		let title = "title"
		let movies = [Movie(id: "0", imageUrl: "url")!]

		let viewModel = FeaturedSectionViewModel(title: title, movies: movies)
		XCTAssertEqual(viewModel.title, title)
		XCTAssertEqual(viewModel.movies.first!.id, movies.first!.id)
		XCTAssertEqual(viewModel.movies.first!.imageUrl, movies.first!.imageUrl)
	}
}
