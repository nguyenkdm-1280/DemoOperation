//
//  Chapter.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/6/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import Foundation

struct Chapter {
    var pages: [Page]
}

extension Chapter: Mockable {
    static func mock() -> Chapter {
        return Chapter(pages: Page.mockArray())
    }
}
