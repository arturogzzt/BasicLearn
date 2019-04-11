//
//  Types.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 4/10/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation

enum Type:Int {
    case number = 1
    case decimal = 2
    case bool = 3
    case sentence = 4
    case void = 5
    case program = 6
    case error = -1
    
    init(type : String){
        switch type {
        case "number":
            self = .number
        case "decimal":
            self = .decimal
        case "bool":
            self = .bool
        case "sentence":
            self = .sentence
        case "program":
            self = .program
        case "void":
            self = .void
        default:
            self = .error
        }
        
    }
}
