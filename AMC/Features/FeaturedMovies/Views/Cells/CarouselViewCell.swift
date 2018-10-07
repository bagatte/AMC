//
//  CarouselViewCell.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class CarouselViewCell: UICollectionViewCell, NibLoadable {

	// MARK: - Outlets
	
	@IBOutlet private weak var imageView: UIImageView!

	// MARK: - Public methods
	
	func layout(stringUrl: String) {
		guard let url = URL(string: stringUrl) else {
			return
		}
		imageView.loadImage(from: url)
	}
}
