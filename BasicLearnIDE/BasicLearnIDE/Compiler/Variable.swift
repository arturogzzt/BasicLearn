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
    var dimensionated = false
    var descriptionDim = [dimensionDescription]()
    
    init(name : String, type : Type, address : Int) {
        self.name = name
        self.type = type
        self.address = address
    }
    
    func isDimentioned(){
        self.dimensionated = true
    }
    
    func getAddressDimention(value: Int) -> Int {
        if value < 0 {
            print("Error: No se puede accesar a dicha lugar")
            return -1
        } else if value >= self.descriptionDim[0].R{
            print("Error: Estas accesando un numero mayor de memoria al asignado a dicho arreglo")
            return -1
        } else {
            return self.address + value
        }
    }
}
