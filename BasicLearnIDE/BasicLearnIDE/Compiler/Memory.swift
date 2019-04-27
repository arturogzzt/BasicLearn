//
//  Memory.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 4/27/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation

//Esta clase será utilizada para las memoria global, local, constante
class Memory{
    //Donde se pondran nuestra variables de acuerdo a cada tipo
    private let number = 0
    private let decimal = 1500
    private let sentence = 3000
    private let bool = 4500
    
    //Lugar para saber las verdaderas ubicaciones de las memorias
    private let base : Int!
    private let numberBase : Int!
    private let decimalBase : Int!
    private let boolBase : Int!
    private let sentenceBase : Int!
    
    //Guardar nuestras variables en la memoria en estos arreglos
    private let numbers = [Int]()
    private let decimals = [Double]()
    private let sentences = [String]()
    private let bools = [Bool]()
    
    
    init (baseAddress: Int){
        self.base = baseAddress
        self.numberBase = baseAddress + self.number
        self.decimalBase = baseAddress + self.decimal
        self.sentenceBase = baseAddress + self.sentence
        self.boolBase = baseAddress + self.bool
        
    }
    
}
