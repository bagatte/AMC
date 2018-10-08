//
//  UIImageView+Extensions.swift
//  AMC
//
//  Created by Bruno Agatte on 10/7/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

let cache = NSCache<NSString, UIImage>()

extension UIImageView {

	func loadImage(from url: URL) {
		image = nil

		if let image = cache.object(forKey: url.absoluteString as NSString) {
			self.image = image
			return
		}

		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if error != nil {
				return
			}

			if let data = data {
				let imageToCache = UIImage(data: data)
				cache.setObject(imageToCache!, forKey: NSString(string: url.absoluteString))

				DispatchQueue.main.async { [weak self] in
					guard let imageToCache = UIImage(data: data) else {
						return
					}
					self?.image = imageToCache
				}
			}
		}.resume()
	}
}
