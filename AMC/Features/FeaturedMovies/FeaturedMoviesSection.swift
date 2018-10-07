//
//  FeaturedMoviesSection.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

enum FeaturedMoviesSection: String {
	case newlyAdded = "Newly Added"
	case curatorsChoice = "Curator's Choice"
	case bestSoundTracks = "Best Soundtracks"
	case getRad = "Get Rad"
	case vengeanceIsHers = "Vengeance is Hers"
	case blackMagic = "Black Magic"
	case haunts = "Haunts"
	case bingeThis = "Binge This"

	var index: Int {
		switch self {
		case .newlyAdded:
			return 1
		case .curatorsChoice:
			return 2
		case .bestSoundTracks:
			return 3
		case .getRad:
			return 4
		case .vengeanceIsHers:
			return 5
		case .blackMagic:
			return 6
		case .haunts:
			return 7
		case .bingeThis:
			return 8
		}
	}

	static let allSections: [FeaturedMoviesSection] = [
		.newlyAdded, .curatorsChoice, .bestSoundTracks,
		.getRad, .vengeanceIsHers, .blackMagic, .haunts, .bingeThis
	]
}
