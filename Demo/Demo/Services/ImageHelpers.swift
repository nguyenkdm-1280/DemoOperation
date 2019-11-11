//
//  ImageHelpers.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/5/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import UIKit
class ImageHelper: NSObject {
    static let shared = ImageHelper()
    
    let imageCache = NSCache<NSString, UIImage>()
    
    func loadImage(from url: URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, nil)
        } else {
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let data = data, let image = UIImage(data: data) else {
                    completion(nil, error)
                    return
                }
                self?.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                completion(image, nil)
            }
            
            task.resume()
        }
    }
}
