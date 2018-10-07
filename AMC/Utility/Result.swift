//
//  Result.swift
//  AMC
//
//  Created by Bruno Agatte on 10/6/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

enum Result<T> {
	case success(value : T)
	case error(Error)
}
