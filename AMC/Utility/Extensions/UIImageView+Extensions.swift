//
//  UIImageView+Extensions.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

extension UIImageView {

	func loadImage(from url: URL) {
		image = nil

		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if error != nil {
				print("error")
			}
			if let data = data {
				DispatchQueue.main.async { [weak self] in
					self?.image = UIImage(data: data)
				}
			}
		}.resume()
	}
}
