//
//  NibLoadable.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

protocol NibLoadable {}

extension NibLoadable {

	/// Returns type name as default nib name.
	static var nibName: String {
		return String(describing: self)
	}

	/// Returns type name as default identifier.
	static var identifier: String {
		return String(describing: self)
	}
}
