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
    
    //Guardar nuestras variables en la memoria en estos diccionarios
    private var numbers = [Int : Int]()
    private var decimals = [Int : Float]()
    private var sentences = [Int : String]()
    private var bools = [Int : Bool]()
    
    
    init (baseAddress: Int){
        self.base = baseAddress
        // Estos numeros son los de la memoria real, no dentro de la clase
        self.numberBase = baseAddress + self.number
        self.decimalBase = baseAddress + self.decimal
        self.sentenceBase = baseAddress + self.sentence
        self.boolBase = baseAddress + self.bool
        
    }
    
    //Funciones para obtener pedazos de memoria disponibles
    //ahorita no me preocupo por arreglos
    //Spaces es cuanta memoria se va a ocupar (despues para arreglos)
    func getNumberAddress(spaces:Int) -> Int{
        var auxNumber = number
        number = number + spaces
        if spaces > 1 {
            for _ in 0...spaces-1{
                self.saveNumberConstant(value: 0, address: auxNumber)
                auxNumber+=1
            }
        }
        return (number + base - spaces)
    }
    
    func getDecimalAddress(spaces:Int) -> Int{
        decimal = decimal + spaces
        return (decimal + base - spaces)
    }
    
    func getSentenceAddress(spaces:Int) -> Int{
        sentence = sentence + spaces
        return (sentence + base - spaces)
    }
    
    func getBoolAddress(spaces:Int) -> Int{
        bool = bool + spaces
        return (bool + base - spaces)
    }
    
    // Funciones para obtener la siguiente dirección disponible en memoria
    func getLastNumberAddress(spaces : Int) -> Int {
        var addresses = [Int]()
        
        for address in numbers {
            addresses.append(address.key)
        }
        
        return addresses.last! + 1
    }
    
    func getLastDecimalAddress(spaces : Int) -> Int {
        var addresses = [Int]()
        
        for address in decimals {
            addresses.append(address.key)
        }
        
        return addresses.last! + 1
    }
    
    func getLastBoolAddress(spaces : Int) -> Int {
        var addresses = [Int]()
        
        for address in bools {
            addresses.append(address.key)
        }
        
        return addresses.last! + 1
    }
    
    func getLastSentenceAddress(spaces : Int) -> Int {
        var addresses = [Int]()
        
        for address in sentences {
            addresses.append(address.key)
        }
        
        return addresses.last! + 1
    }
    
    // Funciones para limpiar memoria
    // Esto eliminó un error que tenía que los valores de number ya estaban aumentados por quads
    func cleanMemory() {
        self.number = 0
        self.decimal = 1500
        self.sentence = 3000
        self.bool = 4500

        numbers.removeAll()
        decimals.removeAll()
        bools.removeAll()
        sentences.removeAll()
    }
    
    //Grabar a memoria, usado para las constantes inicialmente
    //Regresa la memoria donde se grabo la constante
    func saveNumberConstant(value: Int, address: Int){
        numbers.updateValue(value, forKey: address)
    }
    
    func saveDecimalConstant(value: Float, address: Int){
        decimals.updateValue(value, forKey: address)
    }
    
    func saveBoolConstant(value: Bool, address: Int){
        bools.updateValue(value, forKey: address)
    }

    func saveSentenceConstant(value: String, address: Int){
        sentences.updateValue(value, forKey: address)
    }
    
    // Funciones para obtener los valores de las llaves.
    func getNumberValue(address: Int) -> Int {
        if self.numbers[address] != nil{
            return self.numbers[address]!
        } else {
            return -1
        }
        
    }
    
    func getDecimalValue(address: Int) -> Float {
        if self.decimals[address] != nil{
            return self.decimals[address]!
        }else{
            return -1
        }
        
    }
    
    func getBoolValue(address: Int) -> Bool {
        if self.bools[address] != nil {
            return self.bools[address]!
        } else {
            print( "ERROR: Bool esta variable bool esta vacia")
            return false
        }
        
    }
    
    func getSentenceValue(address: Int) -> String {
        if self.sentences[address] != nil {
            return self.sentences[address]!
        } else {
            return "-1"
        }
        
    }
    
    // Función para obtener el valor dependiendo el tipo de dato
    func getValue(address: Int) -> (Any, type: Type) {
        switch address {
        case _ where address < decimalBase:
            return (getNumberValue(address: address), Type.number)
        case _ where address < sentenceBase:
            return (getDecimalValue(address: address), Type.decimal)
        case _ where address < boolBase:
            return (getSentenceValue(address: address), Type.sentence)
        default:
            return (getBoolValue(address: address), Type.bool)
        }
    }
    
    // Función para guardar un valor en memoria
    func saveNumber(address : Int, value : Int) {
        self.numbers[address] = value
    }
    
    func saveDecimal(address : Int, value : Float) {
        self.decimals[address] = value
    }
    
    func saveBool(address : Int, value : Bool) {
        self.bools[address] = value
    }
    
    func saveSentence(address : Int, value : String) {
        self.sentences[address] = value
    }
    
}
