//
//  FeaturedSectionView.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class FeaturedSectionView: UIView, NibLoadable {

	// MARK: - Outlets

	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var collectionView: UICollectionView!

	// MARK: - Private properties

	private var viewModel: FeaturedSectionViewModel!

	// MARK: - Public methods

	func layout(viewModel: FeaturedSectionViewModel) {
		self.viewModel = viewModel

		titleLabel.text = viewModel.title

		collectionView.dataSource = self
		collectionView.register(FeaturedSectionViewCell.self)
	}
}

extension FeaturedSectionView: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.movies.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(FeaturedSectionViewCell.self, forIndexPath: indexPath)
		cell.layout(urlString: viewModel.movies[indexPath.row].imageUrl)
		return cell
	}
}
