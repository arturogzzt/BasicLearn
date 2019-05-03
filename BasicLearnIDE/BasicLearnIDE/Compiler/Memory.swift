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
    
    // Funciones para limpiar memoria
    // Esto eliminó un error que tenía que los valores de number ya estaban aumentados por quads
    func cleanMemory() {
        self.number = 0
        self.decimal = 1500
        self.bool = 3000
        self.sentence = 4500
        
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
        return self.numbers[address]!
    }
    
    func getDecimalValue(address: Int) -> Float {
        return self.decimals[address]!
    }
    
    func getBoolValue(address: Int) -> Bool {
        return self.bools[address]!
    }
    
    func getSentenceValue(address: Int) -> String {
        return self.sentences[address]!
    }
    
    // Función para obtener el valor dependiendo el tipo de dato
    func getValue(address: Int) -> (Any, type: Type) {
        switch address {
        case _ where address < decimalBase:
            return (getNumberValue(address: address), Type.number)
        case _ where address < boolBase:
            return (getDecimalValue(address: address), Type.decimal)
        case _ where address < sentenceBase:
            return (getBoolValue(address: address), Type.bool)
        default:
            return (getSentenceValue(address: address), Type.sentence)
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
