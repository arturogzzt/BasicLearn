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
	 * Enter a parse tree produced by {@link BasicLearnParser#logical}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLogical(_ ctx: BasicLearnParser.LogicalContext)
	/**
	 * Exit a parse tree produced by {@link BasicLearnParser#logical}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLogical(_ ctx: BasicLearnParser.LogicalContext)
}