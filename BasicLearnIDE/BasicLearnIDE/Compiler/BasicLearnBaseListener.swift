// Generated from BasicLearn.g4 by ANTLR 4.7.1

import Antlr4


/**
 * This class provides an empty implementation of {@link BasicLearnListener},
 * which can be extended to create a listener which only needs to handle a subset
 * of the available methods.
 */
open class BasicLearnBaseListener: BasicLearnListener {
    var scope = "ERROR"
    
    var semanticTypeCheck = semanticCube()
    
    var dirFunc = [Function]()
    
    
    var symbolTable = [DirFunc]()
    var variableTable = [Int : [varTable]]()
    // Tiene que empezar en 1 porque si pones nil en la creacion de dirfunc no te deja porq es int
    // 0 representaria que no tiene vartable asignado...
    var variableTableCount = 1
    var parameterVerification = [String]()
    
    //Lista para saltos pendientes en los cuadruplos
    var saltos = [Operator]()
    
    //Pila de operadores pendientes
    var POper = [Operator]()
    //Pila de operadondos
    var PilaO = [String]()
    //Pila de Tipos
    var pTypes = [Type]()
    //Fila para output de cuadruplos
    var qCuad = [Quadruple]()
    
    // Memory
    var globalMemory = Memory.init(baseAddress: 0)
    var localMemory = Memory.init(baseAddress: 6000)
    var constantMemory = Memory.init(baseAddress: 12000)
    
     public init() {
        
    }
    
	open func enterProgram(_ ctx: BasicLearnParser.ProgramContext) {
        scope = "GLOBAL"
        let programName = ctx.ID()?.getText() ?? "Error"
        let programFunction = Function.init(name: programName, type: Type.program, address: 0, quadrupleNumber: 0)
        
        dirFunc.append(programFunction)
    }

	open func exitProgram(_ ctx: BasicLearnParser.ProgramContext) {
//        variableTable.removeValue(forKey: 1)
//        variableTableCount = 1
//        symbolTable.removeAll()
//
        dirFunc.removeAll()
    
//        print(symbolTable[0].name!, symbolTable[0].type!)
//
//        for(function, variable) in variableTable {
//            print("FUNCTION: \(symbolTable[function-1].name!) LINK: \(symbolTable[function-1].link!)")
//            for variab in variable {
//                print("TYPE: \(variab.type!) NAME: \(variab.name!) SCOPE: \(variab.scope!)")
//            }
//        }

    }


	open func enterBody(_ ctx: BasicLearnParser.BodyContext) { }

	open func exitBody(_ ctx: BasicLearnParser.BodyContext) { }


	open func enterExpression(_ ctx: BasicLearnParser.ExpressionContext) { }

	open func exitExpression(_ ctx: BasicLearnParser.ExpressionContext) { }


	open func enterExp(_ ctx: BasicLearnParser.ExpContext) { }

	open func exitExp(_ ctx: BasicLearnParser.ExpContext) { }


	open func enterTerm(_ ctx: BasicLearnParser.TermContext) { }

	open func exitTerm(_ ctx: BasicLearnParser.TermContext) { }


	open func enterFactor(_ ctx: BasicLearnParser.FactorContext) { }

	open func exitFactor(_ ctx: BasicLearnParser.FactorContext) {
        //Checar que si exista la variable en la tabla de variables
        
        
    }


	open func enterAssignment(_ ctx: BasicLearnParser.AssignmentContext) { }

	open func exitAssignment(_ ctx: BasicLearnParser.AssignmentContext) {
        
        //let assign = semanticTypeCheck...
    }


	open func enterBlock(_ ctx: BasicLearnParser.BlockContext) { }

	open func exitBlock(_ ctx: BasicLearnParser.BlockContext) { }


	open func enterType(_ ctx: BasicLearnParser.TypeContext) { }

	open func exitType(_ ctx: BasicLearnParser.TypeContext) { }


	open func enterStatement(_ ctx: BasicLearnParser.StatementContext) { }

	open func exitStatement(_ ctx: BasicLearnParser.StatementContext) { }


	open func enterFunction(_ ctx: BasicLearnParser.FunctionContext) {
        scope = "LOCAL"
        
        let functionType = ctx.type()?.getText() ?? "Error"
        let functionName = ctx.ID()?.getText() ?? "Error"
        
        for function in dirFunc {
            if functionName == function.name {
                // TODO: handle error appropriately STOP COMPILATION && POP UP notif
                print("Error, multiple declaration")
                return
            }
        }

        let function = Function.init(name: functionName, type: Type(type: functionType), address: 0, quadrupleNumber: 0)
        dirFunc.append(function)

	}

	open func exitFunction(_ ctx: BasicLearnParser.FunctionContext) {
        for function in dirFunc {
            print("FUNCTION \(function.name)")
            for variables in function.variables {
                print("TYPE: \(variables.type) NAME: \(variables.name)")
            }
        }
//        for(function, variable) in variableTable {
//            print("FUNCTION: \(symbolTable[function-1].name!) LINK: \(symbolTable[function-1].link!)")
//            for variab in variable {
//                print("TYPE: \(variab.type!) NAME: \(variab.name!) SCOPE: \(variab.scope!)")
//            }
//        }
        dirFunc.removeLast()
//        variableTable.removeValue(forKey: variableTableCount)
        parameterVerification.removeAll()
    }


	open func enterDeclaration(_ ctx: BasicLearnParser.DeclarationContext) {
//
//        if !variableTable.keys.contains(variableTableCount) {
//            variableTable[variableTableCount] = []
//            symbolTable.last?.link = variableTableCount
////            variableTableCount += 1
//        }
//
        for newVariable in ctx.ID() {
            let newVariableType = ctx.type()?.getText()
            
            for param in parameterVerification {
                if newVariable.description == param {
                    print("Error, multiple declaration")
                    return
                    // Handle error appropriately STOP COMPILATION && POP UP notif
                }
            }
            
            for variable in dirFunc.last!.variables {
                if variable.name == newVariable.description {
                    print("Error, multiple declaration")
                    return
                    // Handle error appropriately STOP COMPILATION && POP UP notif
                }
            }
            
//            for variable in variableTable[variableTableCount]! {
//                if variable.name == newVariable.description {
//                    print("Error, multiple declaration")
//                    return
//                    // Handle error appropriately STOP COMPILATION && POP UP notif
//                }
//            }
            
            
//            variableTable[variableTableCount]?.append(varTable.init(nom: newVariable.description, tipo: Type(type: newVariableType!), scop: scope, mem: 0, ident: variableTableCount))
            
            let auxVariable = Variable.init(name: newVariable.description, type: Type(type: newVariableType!), address: 0)
            
            dirFunc.last?.variables.append(auxVariable)
        }
    }

    open func exitDeclaration(_ ctx: BasicLearnParser.DeclarationContext) { }


	open func enterFunction_call(_ ctx: BasicLearnParser.Function_callContext) { }

	open func exitFunction_call(_ ctx: BasicLearnParser.Function_callContext) { }


	open func enterParameters(_ ctx: BasicLearnParser.ParametersContext) {
        for parameter in ctx.ID() {
            for param in parameterVerification {
                if parameter.getText() == param {
                    print("Error, multiple declaration")
                    return
                }
            }
            parameterVerification.append(parameter.getText())
        }
        
    }

	open func exitParameters(_ ctx: BasicLearnParser.ParametersContext) {
//        print(parameterVerification)
    }


	open func enterIf_statement(_ ctx: BasicLearnParser.If_statementContext) { }

	open func exitIf_statement(_ ctx: BasicLearnParser.If_statementContext) { }


	open func enterRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext) { }

	open func exitRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext) { }


	open func enterWhile_statement(_ ctx: BasicLearnParser.While_statementContext) { }

	open func exitWhile_statement(_ ctx: BasicLearnParser.While_statementContext) { }


	open func enterSpecial_function(_ ctx: BasicLearnParser.Special_functionContext) { }

	open func exitSpecial_function(_ ctx: BasicLearnParser.Special_functionContext) { }


	open func enterShow(_ ctx: BasicLearnParser.ShowContext) { }

	open func exitShow(_ ctx: BasicLearnParser.ShowContext) { }


	open func enterPythagoras(_ ctx: BasicLearnParser.PythagorasContext) { }

	open func exitPythagoras(_ ctx: BasicLearnParser.PythagorasContext) { }


	open func enterList_select(_ ctx: BasicLearnParser.List_selectContext) { }

	open func exitList_select(_ ctx: BasicLearnParser.List_selectContext) { }


	open func enterList_functions(_ ctx: BasicLearnParser.List_functionsContext) { }

	open func exitList_functions(_ ctx: BasicLearnParser.List_functionsContext) { }


	open func enterPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext) { }

	open func exitPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext) { }


	open func enterSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext) { }

	open func exitSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext) { }


	open func enterArea_tri(_ ctx: BasicLearnParser.Area_triContext) { }

	open func exitArea_tri(_ ctx: BasicLearnParser.Area_triContext) { }


	open func enterSquare(_ ctx: BasicLearnParser.SquareContext) { }

	open func exitSquare(_ ctx: BasicLearnParser.SquareContext) { }


	open func enterEveryRule(_ ctx: ParserRuleContext) { }

	open func exitEveryRule(_ ctx: ParserRuleContext) { }

	open func visitTerminal(_ node: TerminalNode) { }

	open func visitErrorNode(_ node: ErrorNode) { }
}
