//
//  UIView+Extensions.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

extension UIView {

	static func loadFromNibOfType<T: NibLoadable>(_ type: T.Type) -> T {
		guard let nibViews = Bundle.main.loadNibNamed(T.nibName, owner: nil, options: nil) else {
			fatalError("Could not instantiate view from nib file.")
		}

		for view in nibViews {
			if let typedView = view as? T {
				return typedView
			}
		}

		fatalError("Could not instantiate view from nib file.")
	}
}
