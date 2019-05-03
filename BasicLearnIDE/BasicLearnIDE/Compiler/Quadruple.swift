//
//  Quadruple.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 4/26/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation


class Quadruple {
    let operand : String
    let leftOp : String
    let rightOp : String
    var result : String
    
    init(operand: String, leftOp: String, rightOp: String, result: String) {
        self.operand = operand
        self.leftOp = leftOp
        self.rightOp = rightOp
        self.result = result
    }
    
    func fillJump(jump: String){
        self.result = jump
    }
}
