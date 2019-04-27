//
//  Variable.swift
//  BasicLearnIDE
//
//  Created by Arturo González on 4/27/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation

class Variable {
    var name : String
    var type : Type
    var address : Int
    
    init(name : String, type : Type, address : Int) {
        self.name = name
        self.type = type
        self.address = address
    }
}
