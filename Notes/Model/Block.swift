//
//  Block.swift
//  Notes
//
//  Created by Shiny on 20.05.2018.
//  Copyright © 2018 Alexey Petrenko. All rights reserved.
//

import Foundation

struct Block: Hashable {
    var isLocked: Bool = false
    var text: String
    mutating func editText() -> Bool?{
        return true
    }
    func copy() -> Bool?{
        return true
    }
}
