//
//  SemanticCube.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 4/26/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation

class semanticCube {
    
    let NUM = "number"
    let DECIMAL = "decimal"
    let SENTENCE = "sentence"
    let BOOLEAN = "bool"
    
    func checkOperation(op: String, operand1: String, operand2: String) -> String{
        if op == "+" {
            if(operand1 == NUM){
                if(operand2 == DECIMAL){
                    return DECIMAL
                }else if (operand2 == NUM){
                    return NUM
                } else{
                    print("error")
                    return ("error")
                }
            } else if (operand2 == DECIMAL){
                if(operand1 == NUM){
                    return DECIMAL
                } else if (operand1 == DECIMAL){
                    return DECIMAL
                } else{
                    print("error")
                    return ("error")
                }
            } else{
                print ("error")
                return ("error")
            }
        }
        else if op == "-"{
            if(operand1 == NUM){
                if(operand2 == DECIMAL){
                    return DECIMAL
                }else if (operand2 == NUM){
                    return NUM
                } else{
                    print("error")
                    return ("error")
                }
            } else if (operand2 == DECIMAL){
                if(operand1 == NUM){
                    return DECIMAL
                } else if (operand1 == DECIMAL){
                    return DECIMAL
                } else{
                    print("error")
                    return ("error")
                }
            } else{
                print ("error")
                return ("error")
            }
        } else if op == "*"{
            if(operand1 == NUM){
                if(operand2 == DECIMAL){
                    return DECIMAL
                }else if (operand2 == NUM){
                    return NUM
                } else{
                    print("error")
                    return ("error")
                }
            } else if (operand2 == DECIMAL){
                if(operand1 == NUM){
                    return DECIMAL
                } else if (operand1 == DECIMAL){
                    return DECIMAL
                } else{
                    print("error")
                    return ("error")
                }
            } else{
                print ("error")
                return ("error")
            }
        } else if op == "/"{
            if(operand1 == NUM){
                if(operand2 == DECIMAL){
                    return DECIMAL
                }else if (operand2 == NUM){
                    return NUM
                } else{
                    print("error")
                    return ("error")
                }
            } else if (operand2 == DECIMAL){
                if(operand1 == NUM){
                    return DECIMAL
                } else if (operand1 == DECIMAL){
                    return DECIMAL
                } else{
                    print("error")
                    return ("error")
                }
            } else{
                print ("error")
                return ("error")
            }
        } else if op == "<"{
            if ((operand1 == NUM) || (operand1 == DECIMAL)){
                if((operand2 == NUM) || (operand2 == DECIMAL)){
                    return BOOLEAN
                } else{
                    print ("error")
                    return ("error")
                }
            } else if ((operand2 == NUM) || (operand2 == DECIMAL)){
                if((operand1 == NUM) || (operand1 == DECIMAL)){
                    return BOOLEAN
                } else {
                    print ("error")
                    return ("error")
                }
            } else {
                print( "error")
                return ("error")
            }
        } else if op == ">"{
            if ((operand1 == NUM) || (operand1 == DECIMAL)){
                if((operand2 == NUM) || (operand2 == DECIMAL)){
                    return BOOLEAN
                } else{
                    print ("error")
                    return ("error")
                }
            } else if ((operand2 == NUM) || (operand2 == DECIMAL)){
                if((operand1 == NUM) || (operand1 == DECIMAL)){
                    return BOOLEAN
                } else {
                    print ("error")
                    return ("error")
                }
            } else {
                print( "error")
                return ("error")
            }
        } else if op == "<="{
            if ((operand1 == NUM) || (operand1 == DECIMAL)){
                if((operand2 == NUM) || (operand2 == DECIMAL)){
                    return BOOLEAN
                } else{
                    print ("error")
                    return ("error")
                }
            } else if ((operand2 == NUM) || (operand2 == DECIMAL)){
                if((operand1 == NUM) || (operand1 == DECIMAL)){
                    return BOOLEAN
                } else {
                    print ("error")
                    return ("error")
                }
            } else {
                print( "error")
                return ("error")
            }
        } else if op == ">="{
            if ((operand1 == NUM) || (operand1 == DECIMAL)){
                if((operand2 == NUM) || (operand2 == DECIMAL)){
                    return BOOLEAN
                } else{
                    print ("error")
                    return ("error")
                }
            } else if ((operand2 == NUM) || (operand2 == DECIMAL)){
                if((operand1 == NUM) || (operand1 == DECIMAL)){
                    return BOOLEAN
                } else {
                    print ("error")
                    return ("error")
                }
            } else {
                print( "error")
                return ("error")
            }
        } else if op == "equal"{
            if ((operand1 == NUM) || (operand1 == DECIMAL)){
                if((operand2 == NUM) || (operand2 == DECIMAL)){
                    return BOOLEAN
                } else{
                    print ("error")
                    return ("error")
                }
            } else if ((operand2 == NUM) || (operand2 == DECIMAL)){
                if((operand1 == NUM) || (operand1 == DECIMAL)){
                    return BOOLEAN
                } else {
                    print ("error")
                    return ("error")
                }
            } else {
                print( "error")
                return ("error")
            }
        } else if op == "notEqual"{
            if ((operand1 == NUM) || (operand1 == DECIMAL)){
                if((operand2 == NUM) || (operand2 == DECIMAL)){
                    return BOOLEAN
                } else{
                    print ("error")
                    return ("error")
                }
            } else if ((operand2 == NUM) || (operand2 == DECIMAL)){
                if((operand1 == NUM) || (operand1 == DECIMAL)){
                    return BOOLEAN
                } else {
                    print ("error")
                    return ("error")
                }
            } else {
                print( "error")
                return ("error")
            }
        }
        return "error"
    }
}
