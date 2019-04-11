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
     public init() {
        
    }
    
	open func enterProgram(_ ctx: BasicLearnParser.ProgramContext) {
        scope = "GLOBAL"
        let programName = ctx.ID()?.getText() ?? "Error"
        let programDirFunc = DirFunc.init(nom: programName, tipo: Type.program, scop: scope, mem: 0, link: 0)
        symbolTable.append(programDirFunc)
    }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitProgram(_ ctx: BasicLearnParser.ProgramContext) {
        print(symbolTable[0].name!, symbolTable[0].type!)
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
	open func enterFunction(_ ctx: BasicLearnParser.FunctionContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitFunction(_ ctx: BasicLearnParser.FunctionContext) { }

	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func enterDeclaration(_ ctx: BasicLearnParser.DeclarationContext) { }
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
	open func enterParameters(_ ctx: BasicLearnParser.ParametersContext) { }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	open func exitParameters(_ ctx: BasicLearnParser.ParametersContext) { }

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
