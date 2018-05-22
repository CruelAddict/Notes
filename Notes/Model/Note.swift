//
//  Note.swift
//  Notes
//
//  Created by Shiny on 20.05.2018.
//  Copyright © 2018 Alexey Petrenko. All rights reserved.
//

import Foundation

class Note : NSObject, NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.creator, forKey: "creator")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        <#code#>
    }
    
//    var blocks: [Block]
    var name : String
    var creator: User
    
    init(creator: User, name: String) {
       // self.blocks = blocks
        self.creator = creator
        self.name = name
    }
}


class OfflineNote: Note{
    var blocks: [Block] = []
}

//class SharedNote: Note {
//    var members: Set<User>
//    var text: [TextStruct]
//    
//    
//    init(text: [TextStruct], creator: User, members: Set<User>) {
//        self.members = members
//        self.text = text
//        super.init(creator: creator)
//    }
//    
//    func addMember(_ users:[User]) {
//        for user in users{
//            members.insert(user)
//        }
//    }
//    
//    func makeNote(){
//        
//    }
//}









