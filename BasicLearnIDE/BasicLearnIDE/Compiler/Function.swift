//
//  Function.swift
//  BasicLearnIDE
//
//  Created by Arturo González on 4/27/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation

class Function {
    var name : String
    var type : Type
    var address : Int
    var variables = [Variable]()
    var quadrupleNumber : Int
    
    init(name : String, type : Type, address : Int, quadrupleNumber : Int) {
        self.name = name
        self.type = type
        self.address = address
        self.quadrupleNumber = quadrupleNumber
    }
}
