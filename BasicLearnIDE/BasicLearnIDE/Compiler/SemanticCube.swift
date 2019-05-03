//
//  SemanticCube.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 4/26/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation

class semanticCube {
    
    func checkOperation(op: String, operand1: Type, operand2: Type) -> Type{
        if op == "+" || op == "-" || op == "*" || op == "/" {
            if(operand1 == Type.number){
                if(operand2 == Type.decimal){
                    return Type.decimal
                }else if (operand2 == Type.number){
                    return Type.number
                } else{
                    print("error")
                    return Type.error
                }
            } else if (operand1 == Type.decimal){
                if(operand2 == Type.number){
                    return Type.decimal
                } else if (operand2 == Type.decimal){
                    return Type.decimal
                } else{
                    print("error")
                    return Type.error
                }
            } else{
                print ("error")
                return Type.error
            }
        } else if op == "=" {
            if(operand1 == Type.number){
                if(operand2 == Type.decimal){
                    return Type.decimal
                }else if (operand2 == Type.number){
                    return Type.number
                } else{
                    print("error")
                    return Type.error
                }
            } else if (operand1 == Type.decimal){
                if(operand2 == Type.number){
                    return Type.decimal
                } else if (operand2 == Type.decimal){
                    return Type.decimal
                } else{
                    print("error")
                    return Type.error
                }
            } else if (operand1 == Type.bool){
                if(operand2 == Type.bool) {
                    return Type.bool
                } else {
                    print("error")
                    return Type.error
                }
            } else if (operand2 == Type.bool){
                if(operand1 == Type.bool) {
                    return Type.bool
                } else {
                    print("error")
                    return Type.error
                }
            } else if (operand1 == Type.sentence) {
                if(operand2 == Type.sentence) {
                    return Type.sentence
                } else {
                    print("error")
                    return Type.error
                }
            } else if (operand2 == Type.sentence) {
                if (operand1 == Type.sentence) {
                    return Type.sentence
                } else {
                    print("error")
                    return Type.error
                }
            } else {
                print ("error")
                return Type.error
            }
            
        }else if op == "<" || op == ">" || op == "<=" || op == ">=" || op == "equal" || op == "notEqual"{
            if ((operand1 == Type.number) || (operand1 == Type.decimal)){
                if((operand2 == Type.number) || (operand2 == Type.decimal)){
                    return Type.bool
                } else{
                    print ("error")
                    return Type.error
                }
            } else if ((operand2 == Type.number) || (operand2 == Type.decimal)){
                if((operand1 == Type.number) || (operand1 == Type.decimal)){
                    return Type.bool
                } else {
                    print ("error")
                    return Type.error
                }
            } else {
                print( "error")
                return Type.error
            }
        }
        return Type.error
    }
}
