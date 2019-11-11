//
//  Page.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/6/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import Foundation

struct Page {
    var mangaImageURL: String
    var thumnailImageURL: String
}

extension Page: Mockable {
    static func mock() -> Page {
        let image = String.randomImage()
        return Page(mangaImageURL: image, thumnailImageURL: image)
    }
    
    static func mockArray() -> [Page] {
        return Array(1...10).map { _ in return Page.mock() }
    }
}
