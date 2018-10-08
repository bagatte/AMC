//
//  CarouselView.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class CarouselView: UIView {

	// MARK: - Outlets

	@IBOutlet private weak var collectionView: UICollectionView!

	// MARK: - Private properties

	private var viewModels: [String]!

	// MARK: - Public methods

	func layout(urlStrings: [String]) {
		viewModels = setupCarouselViewModels(urlStrings: urlStrings)

		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(CarouselViewCell.self)
	}

	// MARK: - Private methods

	private func setupCarouselViewModels(urlStrings: [String]) -> [String] {
		var displays = [String](repeatElement("", count: urlStrings.count + 2))

		displays[0] = urlStrings.last!
		displays[displays.count - 1] = urlStrings.first!

		for index in 1...urlStrings.count {
			displays[index] = urlStrings[index - 1]
		}

		return displays
	}
}

extension CarouselView: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModels.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(CarouselViewCell.self, forIndexPath: indexPath)
		return cell
	}
}

extension CarouselView: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView,
						willDisplay cell: UICollectionViewCell,
						forItemAt indexPath: IndexPath) {
		guard let cell = cell as? CarouselViewCell else {
			return
		}

		cell.layout(stringUrl: viewModels[indexPath.row])
	}
}

extension CarouselView: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
	}

	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0.01
	}
}

extension CarouselView: UIScrollViewDelegate {

	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		let visibleItems = collectionView.indexPathsForVisibleItems

		var highestItem = visibleItems.last
		if visibleItems.count > 1 {
			highestItem = visibleItems.max { (indexPath, nextIndexPath) -> Bool in
				return indexPath.row < nextIndexPath.row
			}
		}

		if let visibleIndexPath = highestItem {
			if visibleIndexPath.row == (viewModels.count - 1) {
				let newIndexPath = IndexPath(row: 1, section: 0)
				collectionView.scrollToItem(at: newIndexPath,
											at: .centeredHorizontally,
											animated: false)

			} else if visibleIndexPath.row == 0 {
				let newIndexPath = IndexPath(row: viewModels.count - 2, section: 0)
				collectionView.scrollToItem(at: newIndexPath,
											at: .centeredHorizontally,
											animated: false)
			}
		}
	}
}
