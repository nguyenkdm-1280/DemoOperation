//
//  Random.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/6/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import UIKit

extension Array {
    func randomItem() -> Element? {
        return isEmpty ? nil : self[Int.random(in: 0..<count)]
    }
}

extension String {
    public static func randomImage() -> String {
        let urlImages = [
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466821-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466876-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467032-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466780-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466818-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466931-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466881-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466978-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466848-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466925-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467042-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466910-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467052-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467028-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466853-jpeg.jpg",
        ]
        return urlImages.randomItem() ?? ""
    }
}
