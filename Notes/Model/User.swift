//
//  User.swift
//  Notes
//
//  Created by Shiny on 20.05.2018.
//  Copyright © 2018 Alexey Petrenko. All rights reserved.
//

import Foundation

class User: Hashable, Codable{
    var hashValue: Int{
        return id
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var name: String
    let id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    
}
