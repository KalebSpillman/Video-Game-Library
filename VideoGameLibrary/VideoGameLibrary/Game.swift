//
//  Game.swift
//  VideoGameLibrary
//
//  Created by Kaleb Spillman on 9/11/18.
//  Copyright © 2018 Kaleb Spillman. All rights reserved.
//

import Foundation
// class for the games in the library so the user can add games 
class Game {
    
    let title: String
    var checkedIn: Bool = true
    var dueDate: Date? = nil
    
    init(title: String) {
        self.title = title
    }
}
