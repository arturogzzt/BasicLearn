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
    var numParam = 0
    var numVariable = 0
    var variables = [Variable]()
    var ParamTable = [Variable]()
    var quadrupleNumber : Int
    
    init(name : String, type : Type, address : Int, quadrupleNumber : Int) {
        self.name = name
        self.type = type
        self.address = address
        self.quadrupleNumber = quadrupleNumber
    }
    
    func insertNumParam (num : Int){
        self.numParam = num
    }
    
    func inserNumVariable (num : Int){
        self.numVariable = num
    }
}
