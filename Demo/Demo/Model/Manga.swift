//
//  Manga.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/6/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import Foundation

struct Manga {
    var name: String
    var chapters: [Chapter]
    var description: String
}

extension Manga: Mockable {
    static func mock() -> Manga {
        return Manga(name: "", chapters: [], description: "")
    }
    
    static func mockArray() -> [Manga] {
        return Array(1...5).map { i -> Manga in
            return Manga.mock()
        }
    }
}
