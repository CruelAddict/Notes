//
//  Note.swift
//  Notes
//
//  Created by Shiny on 20.05.2018.
//  Copyright © 2018 Alexey Petrenko. All rights reserved.
//

import Foundation

class Note {
//    var blocks: [Block]
    var creator: User
    
    init(creator: User) {
       // self.blocks = blocks
        self.creator = creator
    }
}


class OfflineNote: Note{
    
}

class SharedNote: Note {
    var members: Set<User>
    var text: [TextStruct]
    
    
    init(text: [TextStruct], creator: User, members: Set<User>) {
        self.members = members
        self.text = text
        super.init(creator: creator)
    }
    
    func addMember(_ users:[User]) {
        for user in users{
            members.insert(user)
        }
    }
    
    func makeNote(){
        
    }
}









