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
    private var number = 0
    private var decimal = 1500
    private var sentence = 3000
    private var bool = 4500
    
    //Lugar para saber las verdaderas ubicaciones de las memorias
    private let base : Int!
    private let numberBase : Int!
    private let decimalBase : Int!
    private let boolBase : Int!
    private let sentenceBase : Int!
    
    //Guardar nuestras variables en la memoria en estos arreglos
    private var numbers = [Int?]()
    private var decimals = [Double?]()
    private var sentences = [String?]()
    private var bools = [Bool?]()
    
    
    init (baseAddress: Int){
        self.base = baseAddress
        // Estos numeros son los de la memoria real, no dentro de la clase
        self.numberBase = baseAddress + self.number
        self.decimalBase = baseAddress + self.decimal
        self.sentenceBase = baseAddress + self.sentence
        self.boolBase = baseAddress + self.bool
        
        prepareArrays()
        
    }
    
    func prepareArrays() {
        // Buscar eficientizar esto...
        for _ in 1...18700 {
            numbers.append(nil)
            decimals.append(nil)
            sentences.append(nil)
            bools.append(nil)
        }
    }
    
    //Funciones para obtener pedazos de memoria disponibles
    //ahorita no me preocupo por arreglos
    //Spaces es cuanta memoria se va a ocupar (despues para arreglos)
    func getNumberAddress(spaces:Int) -> Int{
        number = number + spaces
        return (number + base - spaces)
    }
    
    func getDecimalAddress(spaces:Int) -> Int{
        decimal = decimal + spaces
        return (decimal + base - spaces)
    }
    
    func getSentenceAddress(spaces:Int) -> Int{
        sentence = sentence + spaces
        return (sentenceBase + base - spaces)
    }
    
    func getBoolAddress(spaces:Int) -> Int{
        bool = bool + spaces
        return (bool + base - spaces)
    }
    
    func saveNumber(address : Int, value : Int) {
        numbers.insert(value, at: address)
    }
    
    func saveDecimal(address : Int, value : Double) {
        decimals.insert(value, at: address)
    }
    
}
