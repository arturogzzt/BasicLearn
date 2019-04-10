// Generated from BasicLearn.g4 by ANTLR 4.7.1
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link BasicLearnParser}.
 */
public protocol BasicLearnListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProgram(_ ctx: BasicLearnParser.ProgramContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProgram(_ ctx: BasicLearnParser.ProgramContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#body}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBody(_ ctx: BasicLearnParser.BodyContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#body}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBody(_ ctx: BasicLearnParser.BodyContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpression(_ ctx: BasicLearnParser.ExpressionContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpression(_ ctx: BasicLearnParser.ExpressionContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#exp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExp(_ ctx: BasicLearnParser.ExpContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#exp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExp(_ ctx: BasicLearnParser.ExpContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#term}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTerm(_ ctx: BasicLearnParser.TermContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#term}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTerm(_ ctx: BasicLearnParser.TermContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#factor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFactor(_ ctx: BasicLearnParser.FactorContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#factor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFactor(_ ctx: BasicLearnParser.FactorContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#assignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAssignment(_ ctx: BasicLearnParser.AssignmentContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#assignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAssignment(_ ctx: BasicLearnParser.AssignmentContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#block}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBlock(_ ctx: BasicLearnParser.BlockContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#block}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBlock(_ ctx: BasicLearnParser.BlockContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#type}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterType(_ ctx: BasicLearnParser.TypeContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#type}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitType(_ ctx: BasicLearnParser.TypeContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatement(_ ctx: BasicLearnParser.StatementContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatement(_ ctx: BasicLearnParser.StatementContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#function}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunction(_ ctx: BasicLearnParser.FunctionContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#function}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunction(_ ctx: BasicLearnParser.FunctionContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#declaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDeclaration(_ ctx: BasicLearnParser.DeclarationContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#declaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDeclaration(_ ctx: BasicLearnParser.DeclarationContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#function_call}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunction_call(_ ctx: BasicLearnParser.Function_callContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#function_call}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunction_call(_ ctx: BasicLearnParser.Function_callContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#parameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameters(_ ctx: BasicLearnParser.ParametersContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#parameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameters(_ ctx: BasicLearnParser.ParametersContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#if_statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIf_statement(_ ctx: BasicLearnParser.If_statementContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#if_statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIf_statement(_ ctx: BasicLearnParser.If_statementContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#repeat_statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#repeat_statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#while_statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterWhile_statement(_ ctx: BasicLearnParser.While_statementContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#while_statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitWhile_statement(_ ctx: BasicLearnParser.While_statementContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#special_function}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSpecial_function(_ ctx: BasicLearnParser.Special_functionContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#special_function}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSpecial_function(_ ctx: BasicLearnParser.Special_functionContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#show}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterShow(_ ctx: BasicLearnParser.ShowContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#show}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitShow(_ ctx: BasicLearnParser.ShowContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#pythagoras}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPythagoras(_ ctx: BasicLearnParser.PythagorasContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#pythagoras}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPythagoras(_ ctx: BasicLearnParser.PythagorasContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#list_select}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterList_select(_ ctx: BasicLearnParser.List_selectContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#list_select}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitList_select(_ ctx: BasicLearnParser.List_selectContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#list_functions}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterList_functions(_ ctx: BasicLearnParser.List_functionsContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#list_functions}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitList_functions(_ ctx: BasicLearnParser.List_functionsContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#perimeter_tri}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#perimeter_tri}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#square_root_absolute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#square_root_absolute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#area_tri}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArea_tri(_ ctx: BasicLearnParser.Area_triContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#area_tri}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArea_tri(_ ctx: BasicLearnParser.Area_triContext)
	/**
	 * Enter a parse tree produced by {@link BasicLearnParser#square}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSquare(_ ctx: BasicLearnParser.SquareContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#square}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSquare(_ ctx: BasicLearnParser.SquareContext)
}