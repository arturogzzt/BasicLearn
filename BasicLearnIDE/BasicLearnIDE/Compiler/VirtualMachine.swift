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
    var localTemporalMemory : Memory
    // Revisar si si necesito dirFunc
    var dirFunc = [Function]()
//    var params = [Int]()
    
    var quadIndex : Int = 0
    
    var subQuadIndex : Int = 0
    
    var outputs = [String]()
    
    var semanticTypeCheck = semanticCube()
    
    init(quadruples : [Quadruple], globalMemory : Memory, localMemory : Memory, constantMemory : Memory, temporalMemory : Memory, localTemporalMemory : Memory, dirFunc : [Function]) {
        self.quadruples = quadruples
        self.globalMemory = globalMemory
        self.localMemory = localMemory
        self.constantMemory = constantMemory
        self.temporalMemory = temporalMemory
        self.localTemporalMemory = localTemporalMemory
        self.dirFunc = dirFunc
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
        self.localMemory.cleanMemory()
        self.localTemporalMemory.cleanMemory()
    }
    
    func executeProgram() {
        cleanAllMemory()
        
        while quadIndex < quadruples.count {
            let currentQuadruple = quadruples[quadIndex]
            print("CURRENT QUAD: \(quadIndex)")
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
                show(resultAddress: Int(currentQuadruple.result)!)
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
//        var currentFunction : Function
//        
//        for funct in dirFunc {
//            if function == funct.name {
//                currentFunction = funct
//            }
//        }
    }
    
    func param(paramAddress : Int, paramPosition : String) {
//        let param = Int(String(paramPosition.last!))
        
        let(paramValue, paramType) = getMemory(address: paramAddress).getValue(address: paramAddress)
        
//        params[param!] = paramAddress
        
        switch paramType {
        case Type.number:
         localMemory.saveNumber(address: localMemory.getNumberAddress(spaces: 1), value: paramValue as! Int)
        case Type.decimal:
            localMemory.saveDecimal(address: localMemory.getDecimalAddress(spaces: 1), value: paramValue as! Float)
        case Type.bool:
            localMemory.saveBool(address: localMemory.getBoolAddress(spaces: 1), value: paramValue as! Bool)
        case Type.sentence:
            localMemory.saveSentence(address: localMemory.getSentenceAddress(spaces: 1), value: paramValue as! String)
        default:
            break
        }
    }
    
    func gosub(functionIndex : Int) {
        // Save current IP
        subQuadIndex = quadIndex
        
        // Update IP with the start of the function
        quadIndex = functionIndex - 1
    }
    
    func endproc() {
        // Clean local memory
        cleanLocalMemory()
        
        // Update IP with next line of sub
        quadIndex = subQuadIndex + 1
    }
    
    func ret(returnValueAddress : Int) {
        let (returnValueVal, returnValueType) = getMemory(address: returnValueAddress).getValue(address: returnValueAddress)
        
        switch returnValueType {
        case Type.number:
            globalMemory.saveNumber(address: globalMemory.getLastNumberAddress(spaces: 1), value: returnValueVal as! Int)
        case Type.decimal:
            globalMemory.saveDecimal(address: globalMemory.getDecimalAddress(spaces: 1), value: returnValueVal as! Float)
        case Type.bool:
            globalMemory.saveBool(address: globalMemory.getBoolAddress(spaces: 1), value: returnValueVal as! Bool)
        case Type.sentence:
            globalMemory.saveSentence(address: globalMemory.getSentenceAddress(spaces: 1), value: returnValueVal as! String)
        default:
            break
        }
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
    
    // Función para obtener la memoria dependiendo del scope
    func getMemory(address: Int) -> Memory {
        switch address {
        case _ where address < 6000:
            return self.globalMemory
        case _ where address < 12000:
            return self.localMemory
        case _ where address < 18000:
            return self.constantMemory
        case _ where address < 24000:
            return self.temporalMemory
        default:
            return self.localTemporalMemory
        }
    }
}
