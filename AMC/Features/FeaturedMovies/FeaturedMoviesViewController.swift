//
//  FeaturedMoviesViewController.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class FeaturedMoviesViewController: UIViewController {

	// MARK: - Outlets

	@IBOutlet private weak var stackView: UIStackView!

	// MARK: - Private properties

	private weak var newlyAddedView: FeaturedSectionView?
	private weak var curatorsChoiceView: FeaturedSectionView?
	private weak var bestSoundTracksView: FeaturedSectionView?
	private weak var getRadView: FeaturedSectionView?
	private weak var vengeanceIsHersView: FeaturedSectionView?
	private weak var blackMagicView: FeaturedSectionView?
	private weak var hauntsView: FeaturedSectionView?
	private weak var bingeThisView: FeaturedSectionView?

	// MARK: - Public properties

	var featuredMovieResource = RemoteFeaturedMovieResource(
		networkingManager: NetworkingManager(),
		jsonParser: JSONParser()
	)

	// MARK: - Lifecycle methods
	
    override func viewDidLoad() {
        super.viewDidLoad()

		loadHorrorMovies()
		setupNavigationBar()
    }

	// MARK: - Private methods

	private func loadHorrorMovies() {
		featuredMovieResource.moviesBy(tag: "horror%20movie") { result in
			switch result {
			case .success(let movies):
				DispatchQueue.main.async { [weak self] in
					let featuredMoviesViewModel = FeaturedMoviesViewModel(movies: movies)
					self?.setupFeaturedSections(featuredMoviesViewModel: featuredMoviesViewModel)
				}
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

	private func setupFeaturedSections(featuredMoviesViewModel: FeaturedMoviesViewModel) {
		setupSectionView(&newlyAddedView, featuredMoviesViewModel: featuredMoviesViewModel, in: .newlyAdded)
		setupSectionView(&curatorsChoiceView, featuredMoviesViewModel: featuredMoviesViewModel, in: .curatorsChoice)
		setupSectionView(&bestSoundTracksView, featuredMoviesViewModel: featuredMoviesViewModel, in: .bestSoundTracks)
		setupSectionView(&getRadView, featuredMoviesViewModel: featuredMoviesViewModel, in: .getRad)
		setupSectionView(&vengeanceIsHersView, featuredMoviesViewModel: featuredMoviesViewModel, in: .vengeanceIsHers)
		setupSectionView(&blackMagicView, featuredMoviesViewModel: featuredMoviesViewModel, in: .blackMagic)
		setupSectionView(&hauntsView, featuredMoviesViewModel: featuredMoviesViewModel, in: .haunts)
		setupSectionView(&bingeThisView, featuredMoviesViewModel: featuredMoviesViewModel, in: .bingeThis)
	}

	private func setupSectionView(_ view: inout FeaturedSectionView?,
								  featuredMoviesViewModel: FeaturedMoviesViewModel,
								  in section: FeaturedMoviesSection) {
		view = UIView.loadFromNibOfType(FeaturedSectionView.self)

		if let view = view {
			let viewModel: FeaturedSectionViewModel?
			switch section {
			case .newlyAdded:
				viewModel = featuredMoviesViewModel.newlyAddedViewModel
			case .curatorsChoice:
				viewModel = featuredMoviesViewModel.curatorsChoiceViewModel
			case .bestSoundTracks:
				viewModel = featuredMoviesViewModel.bestSoundTracksViewModel
			case .getRad:
				viewModel = featuredMoviesViewModel.getRadViewModel
			case .vengeanceIsHers:
				viewModel = featuredMoviesViewModel.vengeanceIsHersViewModel
			case .blackMagic:
				viewModel = featuredMoviesViewModel.blackMagicViewModel
			case .haunts:
				viewModel = featuredMoviesViewModel.hauntsViewModel
			case .bingeThis:
				viewModel = featuredMoviesViewModel.bingeThisViewModel
			}

			if let viewModel = viewModel {
				view.layout(viewModel: viewModel)
				stackView.insertArrangedSubview(view, at: section.index)
			}
		}
	}

	private func setupNavigationBar() {
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar
			.barTintColor = UIColor(red: 26.0/255.0, green: 29.0/255.0, blue: 31.0/255.0, alpha: 1)
	}
}
