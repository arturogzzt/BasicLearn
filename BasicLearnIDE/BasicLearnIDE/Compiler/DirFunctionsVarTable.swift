//
//  DirFunctionsVarTable.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 4/10/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import Foundation

class SymbolTable {
    var name: String!
    var type: Type!
    var scope: String!
    var memory: Int!
    
    init(nom: String, tipo: Type, scop: String, mem: Int) {
        self.name = nom
        self.type = tipo
        self.scope = scop
        self.memory = mem
    }
}

class DirFunc : SymbolTable{
    var link: Int!
    
    init(nom: String, tipo: Type, scop: String, mem: Int, link: Int) {
        self.link = link
        super.init(nom: nom, tipo: tipo, scop: scop, mem: mem)
    }
}

class varTable : SymbolTable{
    var tableIdentifier: Int!
    
     init(nom: String, tipo: Type, scop: String, mem: Int, ident: Int) {
        self.tableIdentifier = ident
        super.init(nom: nom, tipo: tipo, scop: scop, mem: mem)
    }
}
