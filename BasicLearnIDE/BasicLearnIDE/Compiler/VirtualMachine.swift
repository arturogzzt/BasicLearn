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
    
    var globalMemory : Memory
    var localMemory : Memory
    var constantMemory : Memory
    var temporalMemory : Memory
    
    var semanticTypeCheck = semanticCube()
    
   init(quadruples : [Quadruple], globalMemory : Memory, localMemory : Memory, constantMemory : Memory, temporalMemory : Memory) {
        self.quadruples = quadruples
        self.globalMemory = globalMemory
        self.localMemory = localMemory
        self.constantMemory = constantMemory
        self.temporalMemory = temporalMemory
    }
    
    // Function to clean all memories but constant
    func cleanAllMemory() {
        self.temporalMemory.cleanMemory()
        self.globalMemory.cleanMemory()
        self.localMemory.cleanMemory()
    }
    
    // Function to clean temporalMemory
    func cleanTempMemory() {
        self.temporalMemory.cleanMemory()
    }
    
    func executeProgram() {
        cleanAllMemory()
        
        var quadIndex : Int = 0
        
        while quadIndex < quadruples.count {
            let currentQuadruple = quadruples[quadIndex]
            
            let op = currentQuadruple.operand
            
            switch op {
            case "+":
                add(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "-":
                substract(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "*":
                multiply(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "/":
                divide(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "=":
                asign(leftOperandAddress: Int(currentQuadruple.leftOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "<":
                lessThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case ">":
                greaterThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "<=":
                lessOrEqualThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case ">=":
                greaterOrEqualThan(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "equal":
                equal(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
            case "notEqual":
                notEqual(leftOperandAddress: Int(currentQuadruple.leftOp)!, rightOperandAddress: Int(currentQuadruple.rightOp)!, resultOperandAddress: Int(currentQuadruple.result)!)
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
            let resultAddress = resultOperandMemory.getNumberAddress(spaces: 1)
            resultOperandMemory.saveNumber(address: resultAddress, value: addedValue)
        } else if resultType == Type.decimal {
            let addedValue : Float
            if leftOperandType == Type.number {
                addedValue = (Float(leftOperandValue as! Int)) + (rightOperandValue as! Float)
            } else if rightOperandType == Type.number {
                addedValue = (leftOperandValue as! Float) + (Float(rightOperandValue as! Int))
            } else {
                addedValue = (leftOperandValue as! Float) + (rightOperandValue as! Float)
            }
            let resultAddress = resultOperandMemory.getDecimalAddress(spaces: 1)
            resultOperandMemory.saveDecimal(address: resultAddress, value: addedValue)
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
            let resultAddress = resultOperandMemory.getNumberAddress(spaces: 1)
            resultOperandMemory.saveNumber(address: resultAddress, value: addedValue)
        } else if resultType == Type.decimal {
            let addedValue : Float
            if leftOperandType == Type.number {
                addedValue = (Float(leftOperandValue as! Int)) - (rightOperandValue as! Float)
            } else if rightOperandType == Type.number {
                addedValue = (leftOperandValue as! Float) - (Float(rightOperandValue as! Int))
            } else {
                addedValue = (leftOperandValue as! Float) - (rightOperandValue as! Float)
            }
            let resultAddress = resultOperandMemory.getDecimalAddress(spaces: 1)
            resultOperandMemory.saveDecimal(address: resultAddress, value: addedValue)
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
            let resultAddress = resultOperandMemory.getNumberAddress(spaces: 1)
            resultOperandMemory.saveNumber(address: resultAddress, value: addedValue)
        } else if resultType == Type.decimal {
            let addedValue : Float
            if leftOperandType == Type.number {
                addedValue = (Float(leftOperandValue as! Int)) * (rightOperandValue as! Float)
            } else if rightOperandType == Type.number {
                addedValue = (leftOperandValue as! Float) * (Float(rightOperandValue as! Int))
            } else {
                addedValue = (leftOperandValue as! Float) * (rightOperandValue as! Float)
            }
            let resultAddress = resultOperandMemory.getDecimalAddress(spaces: 1)
            resultOperandMemory.saveDecimal(address: resultAddress, value: addedValue)
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
            let resultAddress = resultOperandMemory.getNumberAddress(spaces: 1)
            resultOperandMemory.saveNumber(address: resultAddress, value: addedValue)
        } else if resultType == Type.decimal {
            let addedValue : Float
            if leftOperandType == Type.number {
                addedValue = (Float(leftOperandValue as! Int)) / (rightOperandValue as! Float)
            } else if rightOperandType == Type.number {
                addedValue = (leftOperandValue as! Float) / (Float(rightOperandValue as! Int))
            } else {
                addedValue = (leftOperandValue as! Float) / (rightOperandValue as! Float)
            }
            let resultAddress = resultOperandMemory.getDecimalAddress(spaces: 1)
            resultOperandMemory.saveDecimal(address: resultAddress, value: addedValue)
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
        let resultAddress = resultOperandMemory.getBoolAddress(spaces: 1)
        resultOperandMemory.saveBool(address: resultAddress, value: addedValue)
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
        
        let resultAddress = resultOperandMemory.getBoolAddress(spaces: 1)
        resultOperandMemory.saveBool(address: resultAddress, value: addedValue)
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
        
        let resultAddress = resultOperandMemory.getBoolAddress(spaces: 1)
        resultOperandMemory.saveBool(address: resultAddress, value: addedValue)
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
        
        let resultAddress = resultOperandMemory.getBoolAddress(spaces: 1)
        resultOperandMemory.saveBool(address: resultAddress, value: addedValue)
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
        
        let resultAddress = resultOperandMemory.getBoolAddress(spaces: 1)
        resultOperandMemory.saveBool(address: resultAddress, value: addedValue)
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
        
        let resultAddress = resultOperandMemory.getBoolAddress(spaces: 1)
        resultOperandMemory.saveBool(address: resultAddress, value: addedValue)
    }
    
    // Función para obtener la memoria dependiendo del scope
    func getMemory(address: Int) -> Memory {
        switch address {
        case _ where address < 6000:
            return self.globalMemory
        case _ where address < 12000:
            return self.localMemory
        case _ where address < 18000:
            return self.constantMemory
        default:
            return self.temporalMemory
        }
    }
}
