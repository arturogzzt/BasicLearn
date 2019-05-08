//
//  VirtualMachine.swift
//  BasicLearnIDE
//
//  Created by Arturo González on 4/30/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation

class VirtualMachine {
    var quadruples = [Quadruple]()
    
    var functions = [Function]()
    
    var globalMemory : Memory
    var localMemory : Memory
    var constantMemory : Memory
    var temporalMemory : Memory
    var localTemporalMemory : Memory
    
    var quadIndex : Int = 0
    
    var subQuadIndex = [Int]()
    
    var currentFunction : Int = 0
    
    var outputs = [String]()
    
    var semanticTypeCheck = semanticCube()
    
    var localMemoryStack = [Memory]()
    var localTemporalMemoryStack = [Memory]()
    var currentFunctionAddress = [Int]()
    
    init(quadruples : [Quadruple], globalMemory : Memory, localMemory : Memory, constantMemory : Memory, temporalMemory : Memory, localTemporalMemory : Memory, functions : [Function]) {
        self.quadruples = quadruples
        self.globalMemory = globalMemory
        self.localMemory = localMemory
        self.constantMemory = constantMemory
        self.temporalMemory = temporalMemory
        self.localTemporalMemory = localTemporalMemory
        self.functions = functions
        
        localMemoryStack.insert(localMemory, at: 0)
        localTemporalMemoryStack.insert(localTemporalMemory, at: 0)
    }
    
    // Function to clean all memories but constant
    func cleanAllMemory() {
        self.temporalMemory.cleanMemory()
        self.globalMemory.cleanMemory()
        self.localMemory.cleanMemory()
        self.localTemporalMemory.cleanMemory()
    }
    
    // Function to clean temporalMemory
    func cleanLocalMemory() {
        self.localMemoryStack.removeFirst()
        self.localTemporalMemoryStack.removeFirst()
//        self.localMemory.cleanMemory()
//        self.localTemporalMemory.cleanMemory()
    }
    
    func getAddressArray(auxString: String) -> Int{
        let index = auxString.index(auxString.startIndex , offsetBy: 1)
        let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
        let subString = Int(auxString[index...index1])
        let (memoryAddress, _) = getMemory(address: subString!).getValue(address: subString!)
        return memoryAddress as! Int + 1
    }
    
    func executeProgram() {
        cleanAllMemory()
        
        while quadIndex < quadruples.count {
            let currentQuadruple = quadruples[quadIndex]
            print("CURRENT QUAD: \(quadIndex)")
            let op = currentQuadruple.operand
            
            switch op {
            case "+":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    add(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    add(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                     add(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    add(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    add(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    add(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }

            case "-":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    substract(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    substract(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                    substract(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    substract(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    substract(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    substract(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }
            case "*":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    multiply(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    multiply(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                    multiply(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    multiply(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    multiply(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    multiply(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }
            case "/":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    divide(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    divide(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                    divide(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    divide(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    divide(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    divide(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }
            case "=":
                if currentQuadruple.result.contains("(") && currentQuadruple.leftOp.contains("("){
                    let auxStringLeft = currentQuadruple.leftOp
                    let subStringLeft = getAddressArray(auxString: auxStringLeft)
                    let auxStringResult = currentQuadruple.result
                    let subStringResult = getAddressArray(auxString: auxStringResult)
                    asign(leftOperandAddress: subStringLeft, resultOperandAddress: subStringResult)
                }else if currentQuadruple.leftOp.contains("("){
                    let auxStringLeft = currentQuadruple.leftOp
                    let subStringLeft = getAddressArray(auxString: auxStringLeft)
                    asign(leftOperandAddress: subStringLeft, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = Int(auxString[index...index1])
                    let (memoryAddress, _) = getMemory(address: subString!).getValue(address: subString!)
                    asign(leftOperandAddress: Int(currentQuadruple.leftOp)!, resultOperandAddress: memoryAddress as! Int + 1)
                }else{
                    asign(leftOperandAddress: Int(currentQuadruple.leftOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }

            case "<":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    lessThan(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    lessThan(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                    lessThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    lessThan(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    lessThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    lessThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }
            case ">":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    greaterThan(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    greaterThan(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                    greaterThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    greaterThan(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    greaterThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    greaterThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }
            case "<=":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    lessOrEqualThan(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    lessOrEqualThan(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                    lessOrEqualThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    lessOrEqualThan(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    lessOrEqualThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    lessOrEqualThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }
            case ">=":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    greaterOrEqualThan(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    greaterOrEqualThan(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                    greaterOrEqualThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    greaterOrEqualThan(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    greaterOrEqualThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    greaterOrEqualThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }
            case "equal":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    equal(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    equal(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                    equal(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    equal(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    equal(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    equal(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }
            case "notEqual":
                if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(") && currentQuadruple.result.contains(")")){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subStringResult = auxString[index...index1]
                    let auxStringRight = currentQuadruple.rightOp
                    let rightSubstring = getAddressArray(auxString: auxStringRight)
                    let auxStringLeft = currentQuadruple.leftOp
                    let leftSubstring = getAddressArray(auxString: auxStringLeft)
                    
                    notEqual(leftOperandAddress: leftSubstring, rightOperandAddress: rightSubstring, resultOperandAddress: Int(subStringResult)!)
                } else if (currentQuadruple.leftOp.contains("(") && currentQuadruple.rightOp.contains("(")){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    let auxString1 = currentQuadruple.rightOp
                    let subString1 = getAddressArray(auxString: auxString1)
                    notEqual(leftOperandAddress: subString, rightOperandAddress: subString1, resultOperandAddress: Int(currentQuadruple.result)!)
                }
                else if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let index = auxString.index(auxString.startIndex , offsetBy: 1)
                    let index1 = auxString.index(auxString.endIndex, offsetBy: -2)
                    let subString = auxString[index...index1]
                    notEqual(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(subString)!)
                    
                } else if currentQuadruple.leftOp.contains("("){
                    let auxString = currentQuadruple.leftOp
                    let subString = getAddressArray(auxString: auxString)
                    notEqual(leftOperandAddress: subString, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }else if currentQuadruple.rightOp.contains("("){
                    let auxString = currentQuadruple.rightOp
                    let subString = getAddressArray(auxString: auxString)
                    notEqual(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: subString, resultOperandAddress: Int(currentQuadruple.result)!)
                } else{
                    notEqual(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
                }
            case "GOTOF":
                gotoF(resultAddress: Int(currentQuadruple.leftOp)!, newQuadIndex: Int(currentQuadruple.result)!)
            case "GOTO":
                goto(newQuadIndex: Int(currentQuadruple.result)!)
            case "ERA":
                era(function: currentQuadruple.result)
            case "PARAM":
                param(paramAddress: Int(currentQuadruple.leftOp)!, paramPosition: currentQuadruple.result)
            case "GOSUB":
                gosub(functionIndex: Int(currentQuadruple.result)!)
            case "ENDPROC":
                endproc()
            case "RET":
                ret(returnValueAddress: Int(currentQuadruple.result)!)
            case "SHOW":
                if currentQuadruple.result.contains("("){
                    let auxString = currentQuadruple.result
                    let memory = getAddressArray(auxString: auxString)
                    show(resultAddress: memory)
                }else{
                    show(resultAddress: Int(currentQuadruple.result)!)
                }
                
            case "AREATRI":
                multiply(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "AREASQ":
                multiply(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "AREAREC":
                multiply(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "PERIMETERSQ":
                perim(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "PERIMETERREC":
                perim(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "SQUARE_ROOT":
                squareRoot(leftOperandAddress: Int(currentQuadruple.leftOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "ABSOLUTE":
                absolute(leftOperandAddress: Int(currentQuadruple.leftOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "PYTHAGORASHYP":
                pythagorasHyp(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "PYTHAGORASSIDE":
                pythagorasSide(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "PERIMETERTRI":
                add(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "VER":
                verifyArray(result: Int(currentQuadruple.leftOp)!, limInf: Int(currentQuadruple.rightOp)!, limSup: Int(currentQuadruple.result)!)
            case "FIRST_L":
                firstArray(arrayAddress: Int(currentQuadruple.leftOp)!, resultAddress: Int(currentQuadruple.result)!)
            default:
                break
            }

            quadIndex += 1
        }
    }
    
    func add(leftOperandAddress : Int, rightOperandAddress: Int, resultOperandAddress: Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        let resultType = semanticTypeCheck.checkOperation(op: "+", operand1: leftOperandType, operand2: rightOperandType)
        
        if resultType == Type.number {
            let addedValue = (leftOperandValue as! Int) + (rightOperandValue as! Int)
            resultOperandMemory.saveNumber(address: resultOperandAddress, value: addedValue)
        } else if resultType == Type.decimal {
            let addedValue : Float
            if leftOperandType == Type.number {
                addedValue = (Float(leftOperandValue as! Int)) + (rightOperandValue as! Float)
            } else if rightOperandType == Type.number {
                addedValue = (leftOperandValue as! Float) + (Float(rightOperandValue as! Int))
            } else {
                addedValue = (leftOperandValue as! Float) + (rightOperandValue as! Float)
            }
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: addedValue)
        } else {
            // HANDLE ERROR
            print("ERROR TYPE MISMATCH")
        }
    }
    
    func substract(leftOperandAddress : Int, rightOperandAddress: Int, resultOperandAddress: Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        let resultType = semanticTypeCheck.checkOperation(op: "-", operand1: leftOperandType, operand2: rightOperandType)
        
        if resultType == Type.number {
            let addedValue = (leftOperandValue as! Int) - (rightOperandValue as! Int)
            resultOperandMemory.saveNumber(address: resultOperandAddress, value: addedValue)
        } else if resultType == Type.decimal {
            let addedValue : Float
            if leftOperandType == Type.number {
                addedValue = (Float(leftOperandValue as! Int)) - (rightOperandValue as! Float)
            } else if rightOperandType == Type.number {
                addedValue = (leftOperandValue as! Float) - (Float(rightOperandValue as! Int))
            } else {
                addedValue = (leftOperandValue as! Float) - (rightOperandValue as! Float)
            }
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: addedValue)
        } else {
            // HANDLE ERROR
            print("ERROR TYPE MISMATCH")
        }
    }
    
    func multiply(leftOperandAddress : Int, rightOperandAddress: Int, resultOperandAddress: Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        let resultType = semanticTypeCheck.checkOperation(op: "*", operand1: leftOperandType, operand2: rightOperandType)
        
        if resultType == Type.number {
            let addedValue = (leftOperandValue as! Int) * (rightOperandValue as! Int)
            resultOperandMemory.saveNumber(address: resultOperandAddress, value: addedValue)
        } else if resultType == Type.decimal {
            let addedValue : Float
            if leftOperandType == Type.number {
                addedValue = (Float(leftOperandValue as! Int)) * (rightOperandValue as! Float)
            } else if rightOperandType == Type.number {
                addedValue = (leftOperandValue as! Float) * (Float(rightOperandValue as! Int))
            } else {
                addedValue = (leftOperandValue as! Float) * (rightOperandValue as! Float)
            }
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: addedValue)
        } else {
            // HANDLE ERROR
            print("ERROR TYPE MISMATCH")
        }
    }
    
    func divide(leftOperandAddress : Int, rightOperandAddress: Int, resultOperandAddress: Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        let resultType = semanticTypeCheck.checkOperation(op: "/", operand1: leftOperandType, operand2: rightOperandType)
        
        if resultType == Type.number {
            let addedValue = (leftOperandValue as! Int) / (rightOperandValue as! Int)
            resultOperandMemory.saveNumber(address: resultOperandAddress, value: addedValue)
        } else if resultType == Type.decimal {
            let addedValue : Float
            if leftOperandType == Type.number {
                addedValue = (Float(leftOperandValue as! Int)) / (rightOperandValue as! Float)
            } else if rightOperandType == Type.number {
                addedValue = (leftOperandValue as! Float) / (Float(rightOperandValue as! Int))
            } else {
                addedValue = (leftOperandValue as! Float) / (rightOperandValue as! Float)
            }
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: addedValue)
        } else {
            // HANDLE ERROR
            print("ERROR TYPE MISMATCH")
        }
    }
    
    func asign(leftOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        let resultType = leftOperandType
        
        switch resultType {
        case Type.number:
            resultOperandMemory.saveNumber(address: resultOperandAddress, value: leftOperandValue as! Int)
        case Type.decimal:
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: leftOperandValue as! Float)
        case Type.bool:
            resultOperandMemory.saveBool(address: resultOperandAddress, value: leftOperandValue as! Bool)
        case Type.sentence:
            resultOperandMemory.saveSentence(address: resultOperandAddress, value: leftOperandValue as! String)
        default:
            break
        }
    }
    
    func lessThan(leftOperandAddress : Int, rightOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        _ = semanticTypeCheck.checkOperation(op: "<", operand1: leftOperandType, operand2: rightOperandType)
        
        let addedValue : Bool
        
        if leftOperandType == Type.number && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Int) < (rightOperandValue as! Int)
        } else if leftOperandType == Type.number && rightOperandType == Type.decimal {
            addedValue = (Float(leftOperandValue as! Int)) < (rightOperandValue as! Float)
        } else if leftOperandType == Type.decimal && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Float) < (Float(rightOperandValue as! Int))
        } else {
            addedValue = (leftOperandValue as! Float) < (rightOperandValue as! Float)
        }
        
        resultOperandMemory.saveBool(address: resultOperandAddress, value: addedValue)
    }
    
    func greaterThan(leftOperandAddress : Int, rightOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        _ = semanticTypeCheck.checkOperation(op: ">", operand1: leftOperandType, operand2: rightOperandType)
        
        let addedValue : Bool
        
        if leftOperandType == Type.number && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Int) > (rightOperandValue as! Int)
        } else if leftOperandType == Type.number && rightOperandType == Type.decimal {
            addedValue = (Float(leftOperandValue as! Int)) > (rightOperandValue as! Float)
        } else if leftOperandType == Type.decimal && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Float) > (Float(rightOperandValue as! Int))
        } else {
            addedValue = (leftOperandValue as! Float) > (rightOperandValue as! Float)
        }
        
        resultOperandMemory.saveBool(address: resultOperandAddress, value: addedValue)
    }
    
    func lessOrEqualThan(leftOperandAddress : Int, rightOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        _ = semanticTypeCheck.checkOperation(op: "<=", operand1: leftOperandType, operand2: rightOperandType)
        
        let addedValue : Bool
        
        if leftOperandType == Type.number && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Int) <= (rightOperandValue as! Int)
        } else if leftOperandType == Type.number && rightOperandType == Type.decimal {
            addedValue = (Float(leftOperandValue as! Int)) <= (rightOperandValue as! Float)
        } else if leftOperandType == Type.decimal && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Float) <= (Float(rightOperandValue as! Int))
        } else {
            addedValue = (leftOperandValue as! Float) <= (rightOperandValue as! Float)
        }
        
        resultOperandMemory.saveBool(address: resultOperandAddress, value: addedValue)
    }
    
    func greaterOrEqualThan(leftOperandAddress : Int, rightOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        _ = semanticTypeCheck.checkOperation(op: ">=", operand1: leftOperandType, operand2: rightOperandType)
        
        let addedValue : Bool
        
        if leftOperandType == Type.number && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Int) >= (rightOperandValue as! Int)
        } else if leftOperandType == Type.number && rightOperandType == Type.decimal {
            addedValue = (Float(leftOperandValue as! Int)) >= (rightOperandValue as! Float)
        } else if leftOperandType == Type.decimal && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Float) >= (Float(rightOperandValue as! Int))
        } else {
            addedValue = (leftOperandValue as! Float) >= (rightOperandValue as! Float)
        }
        
        resultOperandMemory.saveBool(address: resultOperandAddress, value: addedValue)
    }
    
    func equal(leftOperandAddress : Int, rightOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        _ = semanticTypeCheck.checkOperation(op: "equal", operand1: leftOperandType, operand2: rightOperandType)
        
        let addedValue : Bool
        
        if leftOperandType == Type.number && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Int) == (rightOperandValue as! Int)
        } else if leftOperandType == Type.number && rightOperandType == Type.decimal {
            addedValue = (Float(leftOperandValue as! Int)) == (rightOperandValue as! Float)
        } else if leftOperandType == Type.decimal && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Float) == (Float(rightOperandValue as! Int))
        } else {
            addedValue = (leftOperandValue as! Float) == (rightOperandValue as! Float)
        }
        
        resultOperandMemory.saveBool(address: resultOperandAddress, value: addedValue)
    }
    
    func notEqual(leftOperandAddress : Int, rightOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        _ = semanticTypeCheck.checkOperation(op: "notEqual", operand1: leftOperandType, operand2: rightOperandType)
        
        let addedValue : Bool
        
        if leftOperandType == Type.number && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Int) != (rightOperandValue as! Int)
        } else if leftOperandType == Type.number && rightOperandType == Type.decimal {
            addedValue = (Float(leftOperandValue as! Int)) != (rightOperandValue as! Float)
        } else if leftOperandType == Type.decimal && rightOperandType == Type.number {
            addedValue = (leftOperandValue as! Float) != (Float(rightOperandValue as! Int))
        } else {
            addedValue = (leftOperandValue as! Float) != (rightOperandValue as! Float)
        }
        
        resultOperandMemory.saveBool(address: resultOperandAddress, value: addedValue)
    }
    
    func gotoF(resultAddress : Int, newQuadIndex : Int) {
        let (resultAddress, _) = getMemory(address: resultAddress).getValue(address: resultAddress)
        
        if !(resultAddress as! Bool) {
            quadIndex = newQuadIndex - 1
        }
    }
    
    func goto(newQuadIndex : Int) {
        quadIndex = newQuadIndex - 1
    }
    
    func era(function : String) {
        for funct in functions {
            if funct.name == function {
                currentFunction = funct.address
            }
        }
        
//        localMemoryStack.insert(localMemoryStack.last!, at: 0)
//        localTemporalMemoryStack.insert(localTemporalMemoryStack.last!, at: 0)
       
//

    }
    
    func param(paramAddress : Int, paramPosition : String) {
        
        let(paramValue, paramType) = getMemory(address: paramAddress).getValue(address: paramAddress)
        
        localMemoryStack.insert(Memory.init(baseAddress: 6000), at: 0)
        localTemporalMemoryStack.insert(Memory.init(baseAddress: 24000), at: 0)
        
        switch paramType {
        case Type.number:
            localMemoryStack.first!.saveNumber(address: localMemoryStack.first!.getNumberAddress(spaces: 1), value: paramValue as! Int)
        case Type.decimal:
            localMemoryStack.first!.saveDecimal(address: localMemoryStack.first!.getDecimalAddress(spaces: 1), value: paramValue as! Float)
        case Type.bool:
            localMemoryStack.first!.saveBool(address: localMemoryStack.first!.getBoolAddress(spaces: 1), value: paramValue as! Bool)
        case Type.sentence:
            localMemoryStack.first!.saveSentence(address: localMemoryStack.first!.getSentenceAddress(spaces: 1), value: paramValue as! String)
        default:
            break
        }
    }
    
    func gosub(functionIndex : Int) {
        // Save current IP
        subQuadIndex.insert(quadIndex, at: 0)
        
        // Update IP with the start of the function
        quadIndex = functionIndex - 1
    }
    
    func endproc() {
        // Clean local memory
        cleanLocalMemory()
        
        // Update IP with next line of sub
        quadIndex = subQuadIndex.first! + 1
        subQuadIndex.removeFirst()
    }
    
    func ret(returnValueAddress : Int) {
       
        let (returnValueVal, returnValueType) = getMemory(address: returnValueAddress).getValue(address: returnValueAddress)
        
        switch returnValueType {
        case Type.number:
            globalMemory.saveNumber(address: currentFunction, value: returnValueVal as! Int)
        case Type.decimal:
            globalMemory.saveDecimal(address: currentFunction, value: returnValueVal as! Float)
        case Type.bool:
            globalMemory.saveBool(address: currentFunction, value: returnValueVal as! Bool)
        case Type.sentence:
            globalMemory.saveSentence(address: currentFunction, value: returnValueVal as! String)
        default:
            break
        }
        
        quadIndex = subQuadIndex.first!
        subQuadIndex.removeFirst()
        localMemoryStack.removeFirst()
        localTemporalMemoryStack.removeFirst()
        
    }
    
    func show(resultAddress : Int) {
        let (resultValue, resultType) = getMemory(address: resultAddress).getValue(address: resultAddress)
        
        let resultString : String
        
        switch resultType {
        case Type.number:
            resultString = String(resultValue as! Int)
        case Type.decimal:
            resultString = String(resultValue as! Float)
        case Type.bool:
            resultString = String(resultValue as! Bool)
        default:
            resultString = String(resultValue as! String)
        }
        print(resultString)
        outputs.append(resultString)
    }
    
    func perim(leftOperandAddress : Int, rightOperandAddress: Int, resultOperandAddress: Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        let resultType = semanticTypeCheck.checkOperation(op: "*", operand1: leftOperandType, operand2: rightOperandType)
        
        if resultType == Type.number {
            let addedValue = ((leftOperandValue as! Int) * 2) + ((rightOperandValue as! Int) * 2)
            resultOperandMemory.saveNumber(address: resultOperandAddress, value: addedValue)
        } else if resultType == Type.decimal {
            let addedValue : Float
            if leftOperandType == Type.number {
                addedValue = ((Float(leftOperandValue as! Int)) * 2) + ((rightOperandValue as! Float) * 2)
            } else if rightOperandType == Type.number {
                addedValue = ((leftOperandValue as! Float) * 2) + ((Float(rightOperandValue as! Int)) * 2)
            } else {
                addedValue = ((leftOperandValue as! Float) * 2) + ((rightOperandValue as! Float) * 2)
            }
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: addedValue)
        } else {
            // HANDLE ERROR
            print("ERROR TYPE MISMATCH")
        }
    }
    
    func squareRoot(leftOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        if leftOperandType == Type.number {
            let addedValue = sqrt(Float((leftOperandValue as! Int)))
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: addedValue)
        } else if leftOperandType == Type.decimal {
            let addedValue = sqrt(leftOperandValue as! Float)
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: addedValue)
        } else {
            // handle error
            print("ERROR TYPE MISMATCH")
        }
        
    }
    
    func absolute(leftOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        
        if leftOperandType == Type.number {
            let addedValue = abs(leftOperandValue as! Int)
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: Float(addedValue))
        } else if leftOperandType == Type.decimal {
            let addedValue = abs(leftOperandValue as! Float)
            resultOperandMemory.saveDecimal(address: resultOperandAddress, value: addedValue)
        } else {
            // Handle error
            print("ERROR TYPE MISMATCH")
        }
    }
    
    func pythagorasHyp(leftOperandAddress : Int, rightOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        var addedValue : Float
        if leftOperandType == Type.number {
            if rightOperandType == Type.number {
                let leftVal = Float(leftOperandValue as! Int)
                let rightVal = Float(rightOperandValue as! Int)
                addedValue = sqrt(pow(leftVal, 2) + pow(rightVal, 2))
            } else {
                let leftVal = Float(leftOperandValue as! Int)
                let rightVal = rightOperandValue as! Float
                addedValue = sqrt(pow(leftVal, 2) + pow(rightVal, 2))
            }
        } else if rightOperandType == Type.number {
            let leftVal = leftOperandValue as! Float
            let rightVal = Float(rightOperandValue as! Int)
            addedValue = sqrt(pow(leftVal, 2) + pow(rightVal, 2))
        } else {
            let leftVal = leftOperandValue as! Float
            let rightVal = rightOperandValue as! Float
            addedValue = sqrt(pow(leftVal, 2) + pow(rightVal, 2))
        }
        resultOperandMemory.saveDecimal(address: resultOperandAddress, value: Float(addedValue))
    }
    
    func pythagorasSide(leftOperandAddress : Int, rightOperandAddress : Int, resultOperandAddress : Int) {
        let (leftOperandValue, leftOperandType) = getMemory(address: leftOperandAddress).getValue(address: leftOperandAddress)
        let (rightOperandValue, rightOperandType) = getMemory(address: rightOperandAddress).getValue(address: rightOperandAddress)
        
        let resultOperandMemory = getMemory(address: resultOperandAddress)
        
        var addedValue : Float
        if leftOperandType == Type.number {
            if rightOperandType == Type.number {
                let leftVal = Float(leftOperandValue as! Int)
                let rightVal = Float(rightOperandValue as! Int)
                addedValue = sqrt(pow(leftVal, 2) - pow(rightVal, 2))
            } else {
                let leftVal = Float(leftOperandValue as! Int)
                let rightVal = rightOperandValue as! Float
                addedValue = sqrt(pow(leftVal, 2) - pow(rightVal, 2))
            }
        } else if rightOperandType == Type.number {
            let leftVal = leftOperandValue as! Float
            let rightVal = Float(rightOperandValue as! Int)
            addedValue = sqrt(pow(leftVal, 2) - pow(rightVal, 2))
        } else {
            let leftVal = leftOperandValue as! Float
            let rightVal = rightOperandValue as! Float
            addedValue = sqrt(pow(leftVal, 2) - pow(rightVal, 2))
        }
        resultOperandMemory.saveDecimal(address: resultOperandAddress, value: Float(addedValue))
    }
    
    func verifyArray(result: Int, limInf: Int, limSup: Int){
        let (resultValue, resultType) = getMemory(address: result).getValue(address: result)
        let auxResult = resultValue as! Int
        if resultType == Type.number{
            if auxResult+1 >= limInf && auxResult+1 <= limSup{
                print("Verificacion correcta")
            }else {
                print("ERROR: Se sale del indice preestablecido del arreglo")
            }
        }else{
            print("ERROR: Tiene que ser un number al accesar indice de un arreglo")
        }
    }
    
    func firstArray(arrayAddress: Int, resultAddress: Int){
        let resultOperandMemory = getMemory(address: resultAddress)
        let (resultValue, resultType) = getMemory(address: arrayAddress).getValue(address: arrayAddress)
        switch resultType {
        case Type.number:
            let auxRes = resultValue as! Int
            resultOperandMemory.saveNumber(address: resultAddress, value:auxRes )
        case Type.decimal:
            let auxRes = resultValue as! Float
            resultOperandMemory.saveDecimal(address: resultAddress, value: auxRes )
        case Type.bool:
            let auxRes = resultValue as! Bool
            resultOperandMemory.saveBool(address: resultAddress, value:auxRes)
        case Type.sentence:
            let auxRes = resultValue as! String
            resultOperandMemory.saveSentence(address: resultAddress, value:auxRes )
        default:
            break
        }
        
    }
    
    // Función para obtener la memoria dependiendo del scope
    func getMemory(address: Int) -> Memory {
        switch address {
        case _ where address < 6000:
            return self.globalMemory
        case _ where address < 12000:
            return self.localMemoryStack.first!
        case _ where address < 18000:
            return self.constantMemory
        case _ where address < 24000:
            return self.temporalMemory
        default:
            return self.localTemporalMemoryStack.first!
        }
    }
}
