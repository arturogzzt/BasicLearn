//
//  MainCompiler.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 4/10/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation
import Antlr4

class MainCompiler{
    
    func execute(code: String) {
        do {
            let lexer = BasicLearnLexer(ANTLRInputStream(code))
            let tokens = CommonTokenStream(lexer)
            let parser = try BasicLearnParser(tokens)
            let tree = try parser.program()
            let walker = ParseTreeWalker()
            let basicLearn = BasicLearnBaseListener.init()
            try walker.walk(basicLearn, tree)
        } catch {
            print("Parse error: \(error.localizedDescription)")
        }
        
    }
}
