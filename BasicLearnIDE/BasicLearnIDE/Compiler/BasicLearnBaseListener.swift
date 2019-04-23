// Generated from BasicLearn.g4 by ANTLR 4.7.1

import Antlr4


/**
 * This class provides an empty implementation of {@link BasicLearnListener},
 * which can be extended to create a listener which only needs to handle a subset
 * of the available methods.
 */
open class BasicLearnBaseListener: BasicLearnListener {
    var scope = "ERROR"
    var symbolTable = [DirFunc]()
    var variableTable = [Int : [varTable]]()
    // Tiene que empezar en 1 porque si pones nil en la creacion de dirfunc no te deja porq es int
    // 0 representaria que no tiene vartable asignado...
    var variableTableCount = 1
    var parameterVerification = [String]()
     public init() {
        
    }
    
	open func enterProgram(_ ctx: BasicLearnParser.ProgramContext) {
        scope = "GLOBAL"
        let programName = ctx.ID()?.getText() ?? "Error"
        let programDirFunc = DirFunc.init(nom: programName, tipo: Type.program, scop: scope, mem: 0, link: 1)
        symbolTable.append(programDirFunc)
    }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitProgram(_ ctx: BasicLearnParser.ProgramContext) {
        variableTable.removeValue(forKey: 1)
        variableTableCount = 1
        symbolTable.removeAll()
    
//        print(symbolTable[0].name!, symbolTable[0].type!)
//
//        for(function, variable) in variableTable {
//            print("FUNCTION: \(symbolTable[function-1].name!) LINK: \(symbolTable[function-1].link!)")
//            for variab in variable {
//                print("TYPE: \(variab.type!) NAME: \(variab.name!) SCOPE: \(variab.scope!)")
//            }
//        }

    }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterBody(_ ctx: BasicLearnParser.BodyContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitBody(_ ctx: BasicLearnParser.BodyContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterExpression(_ ctx: BasicLearnParser.ExpressionContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitExpression(_ ctx: BasicLearnParser.ExpressionContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterExp(_ ctx: BasicLearnParser.ExpContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitExp(_ ctx: BasicLearnParser.ExpContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterTerm(_ ctx: BasicLearnParser.TermContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitTerm(_ ctx: BasicLearnParser.TermContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterFactor(_ ctx: BasicLearnParser.FactorContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitFactor(_ ctx: BasicLearnParser.FactorContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterAssignment(_ ctx: BasicLearnParser.AssignmentContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitAssignment(_ ctx: BasicLearnParser.AssignmentContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterBlock(_ ctx: BasicLearnParser.BlockContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitBlock(_ ctx: BasicLearnParser.BlockContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterType(_ ctx: BasicLearnParser.TypeContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitType(_ ctx: BasicLearnParser.TypeContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterStatement(_ ctx: BasicLearnParser.StatementContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitStatement(_ ctx: BasicLearnParser.StatementContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterFunction(_ ctx: BasicLearnParser.FunctionContext) {
        scope = "LOCAL"
        let functionType = ctx.type()?.getText() ?? "Error"
        let functionName = ctx.ID()?.getText() ?? "Error"
        
        for function in symbolTable {
            if functionName == function.name {
                // TODO: handle error appropriately STOP COMPILATION && POP UP notif
                print("Error, multiple declaration")
            }
        }

        let function = DirFunc.init(nom: functionName, tipo: Type(type: functionType), scop: scope, mem: 0, link: 0)
        symbolTable.append(function)
        
        symbolTable.last?.link = variableTableCount
//        variableTable[variableTableCount] = []
        
        variableTableCount += 1

	}
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitFunction(_ ctx: BasicLearnParser.FunctionContext) {
//        for(function, variable) in variableTable {
//            print("FUNCTION: \(symbolTable[function-1].name!) LINK: \(symbolTable[function-1].link!)")
//            for variab in variable {
//                print("TYPE: \(variab.type!) NAME: \(variab.name!) SCOPE: \(variab.scope!)")
//            }
//        }
        
        variableTable.removeValue(forKey: variableTableCount)
        parameterVerification.removeAll()
    }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterDeclaration(_ ctx: BasicLearnParser.DeclarationContext) {
        if !variableTable.keys.contains(variableTableCount) {
            variableTable[variableTableCount] = []
            symbolTable.last?.link = variableTableCount
//            variableTableCount += 1
        }
        
        for newVariable in ctx.ID() {
            let newVariableType = ctx.type()?.getText()
            
            for param in parameterVerification {
                if newVariable.description == param {
                    print("Error, multiple declaration")
                    // Handle error appropriately STOP COMPILATION && POP UP notif
                }
            }
            
            for variable in variableTable[variableTableCount]! {
                if variable.name == newVariable.description {
                    print("Error, multiple declaration")
                    // Handle error appropriately STOP COMPILATION && POP UP notif
                }
            }
            
            
            variableTable[variableTableCount]?.append(varTable.init(nom: newVariable.description, tipo: Type(type: newVariableType!), scop: scope, mem: 0, ident: variableTableCount))
        }
    }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
    open func exitDeclaration(_ ctx: BasicLearnParser.DeclarationContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterFunction_call(_ ctx: BasicLearnParser.Function_callContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitFunction_call(_ ctx: BasicLearnParser.Function_callContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterParameters(_ ctx: BasicLearnParser.ParametersContext) {
        for parameter in ctx.ID() {
            for param in parameterVerification {
                if parameter.getText() == param {
                    print("Error, multiple declaration")
                }
            }
            parameterVerification.append(parameter.getText())
        }
        
    }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitParameters(_ ctx: BasicLearnParser.ParametersContext) {
//        print(parameterVerification)
    }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterIf_statement(_ ctx: BasicLearnParser.If_statementContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitIf_statement(_ ctx: BasicLearnParser.If_statementContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterWhile_statement(_ ctx: BasicLearnParser.While_statementContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitWhile_statement(_ ctx: BasicLearnParser.While_statementContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterSpecial_function(_ ctx: BasicLearnParser.Special_functionContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitSpecial_function(_ ctx: BasicLearnParser.Special_functionContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterShow(_ ctx: BasicLearnParser.ShowContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitShow(_ ctx: BasicLearnParser.ShowContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterPythagoras(_ ctx: BasicLearnParser.PythagorasContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitPythagoras(_ ctx: BasicLearnParser.PythagorasContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterList_select(_ ctx: BasicLearnParser.List_selectContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitList_select(_ ctx: BasicLearnParser.List_selectContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterList_functions(_ ctx: BasicLearnParser.List_functionsContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitList_functions(_ ctx: BasicLearnParser.List_functionsContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterArea_tri(_ ctx: BasicLearnParser.Area_triContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitArea_tri(_ ctx: BasicLearnParser.Area_triContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterSquare(_ ctx: BasicLearnParser.SquareContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitSquare(_ ctx: BasicLearnParser.SquareContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterEveryRule(_ ctx: ParserRuleContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitEveryRule(_ ctx: ParserRuleContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func visitTerminal(_ node: TerminalNode) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func visitErrorNode(_ node: ErrorNode) { }
}
