//
//  FeaturedSectionViewCell.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class FeaturedSectionViewCell: UICollectionViewCell, NibLoadable {

	// MARK: - Outlets
	
	@IBOutlet private weak var imageView: UIImageView!

	// MARK: - Lifecycle methods
	
	override func awakeFromNib() {
		super.awakeFromNib()
		layer.cornerRadius = 5
	}

	// MARK: - Public methods

	func layout(urlString: String) {
		guard let url = URL(string: urlString) else {
			return
		}
		imageView.loadImage(from: url)
	}
}
