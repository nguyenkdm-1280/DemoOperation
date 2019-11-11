//
//  Mockable.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/6/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import Foundation

protocol Mockable {
    static func mock() -> Self
    static func mockArray() -> [Self]
}

extension Mockable {
    static func mockArray() -> [Self] {
        return []
    }
}
