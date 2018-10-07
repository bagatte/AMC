//
//  UICollectionView+Extensions.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

extension UICollectionView {

	func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadable {
		self.register(UINib(nibName: T.nibName, bundle: nil), forCellWithReuseIdentifier: T.identifier)
	}

	func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type, forIndexPath indexPath: IndexPath) -> T where T: NibLoadable {
		guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
			fatalError("No table view cell could be dequeued with identifier \(T.identifier)")
		}
		return cell
	}
}
