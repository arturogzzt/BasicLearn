//
//  descriptionDimension.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 5/4/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation

class dimensionDescription {
    let limInf = 1
    var limSup : Int
    var R = 1
    let Dim = 1
    var K = 0
    var mDim = 0
    
    init(superior: Int) {
        self.limSup = superior
        self.R = superior
        self.mDim = self.R/(self.limSup)
        self.K = -mDim
    }
}
