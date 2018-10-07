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
	@IBOutlet private weak var carouselView: CarouselView!

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

		loadBanners()
		loadFeaturedMovies()
		setupNavigationBar()
    }

	// MARK: - Private methods

	private func loadBanners() {
		featuredMovieResource.banners { [weak self] result in
			switch result {
			case .success(let urlStrings):
				DispatchQueue.main.async { [weak self] in
					self?.carouselView.layout(urlStrings: urlStrings)
				}
			case .error(let error):
				self?.showAlertWithError(error)
			}
		}
	}

	private func loadFeaturedMovies() {
		featuredMovieResource.featuredMovies() { [weak self] result in
			switch result {
			case .success(let movies):
				DispatchQueue.main.async { [weak self] in
					let featuredMoviesViewModel = FeaturedMoviesViewModel(movies: movies)
					self?.setupFeaturedSections(featuredMoviesViewModel: featuredMoviesViewModel)
				}
			case .error(let error):
				self?.showAlertWithError(error)
			}
		}
	}

	private func showAlertWithError(_ error: Error) {
		let errorMessage: String
		if let error = error as? UtilityError {
			errorMessage = error.localizedDescription
		} else {
			errorMessage = error.localizedDescription
		}
		let alert = UIAlertController(title: "OPS!", message: errorMessage, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
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
		UIApplication.shared.statusBarStyle = .lightContent
		
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar
			.barTintColor = UIColor(red: 26.0/255.0, green: 29.0/255.0, blue: 31.0/255.0, alpha: 1)

		let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 163, height: 28))
		titleImageView.image = UIImage(named: "shudder_logo")
		titleImageView.contentMode = .scaleToFill
		navigationItem.titleView = titleImageView
	}
}
