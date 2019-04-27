//
//  Quadruple.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 4/26/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation


class Quadruple {
    let operand:String
    let leftOp: Int
    let rightOp: Int
    let result: Int
    
    init(operand: String, leftOp: Int, rightOp: Int, result: Int) {
        self.operand = operand
        self.leftOp = leftOp
        self.rightOp = rightOp
        self.result = result
    }
}
