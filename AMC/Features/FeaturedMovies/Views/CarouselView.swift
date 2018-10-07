//
//  CarouselView.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class CarouselView: UIView {

	@IBOutlet private weak var collectionView: UICollectionView!

	var urlStrings: [String]!

	func layout(urlStrings: [String]) {
		let display3bis = urlStrings[3]
		let display0 = urlStrings[0]
		let display1 = urlStrings[1]
		let display2 = urlStrings[2]
		let display3 = urlStrings[3]
		let display0bis = urlStrings[0]
		self.urlStrings = [display3bis, display0, display1, display2, display3, display0bis]

		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(CarouselViewCell.self)
	}
}

extension CarouselView: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return urlStrings.count
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

		cell.layout(stringUrl: urlStrings[indexPath.row])
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
			if visibleIndexPath.row == (urlStrings.count - 1) {
				let newIndexPath = IndexPath(row: 1, section: 0)
				collectionView.scrollToItem(at: newIndexPath,
											at: .centeredHorizontally,
											animated: false)

			} else if visibleIndexPath.row == 0 {
				let newIndexPath = IndexPath(row: urlStrings.count - 2, section: 0)
				collectionView.scrollToItem(at: newIndexPath,
											at: .centeredHorizontally,
											animated: false)
			}
		}
	}
}
