// Generated from BasicLearn.g4 by ANTLR 4.7.1
import Antlr4

open class BasicLearnParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = BasicLearnParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(BasicLearnParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, T__0 = 1, T__1 = 2, T__2 = 3, T__3 = 4, T__4 = 5, T__5 = 6, 
                 T__6 = 7, T__7 = 8, T__8 = 9, T__9 = 10, T__10 = 11, T__11 = 12, 
                 T__12 = 13, T__13 = 14, T__14 = 15, T__15 = 16, T__16 = 17, 
                 T__17 = 18, T__18 = 19, T__19 = 20, T__20 = 21, T__21 = 22, 
                 T__22 = 23, T__23 = 24, T__24 = 25, T__25 = 26, T__26 = 27, 
                 T__27 = 28, T__28 = 29, T__29 = 30, T__30 = 31, BOOL = 32, 
                 LESSTHAN = 33, MORETHAN = 34, LESSOREQUAL = 35, MOREOREQUAL = 36, 
                 EQUALS = 37, NOTEQUALS = 38, ASSIGN = 39, ADD = 40, SUBS = 41, 
                 MULT = 42, DIV = 43, LEFTPAREN = 44, RIGHTPAREN = 45, LEFTBRACKET = 46, 
                 RIGHTBRACKET = 47, LEFTCURL = 48, RIGHTCURL = 49, NUMBER = 50, 
                 DECIMAL = 51, ID = 52, CTE_I = 53, CTE_F = 54, SENTENCE = 55, 
                 AND = 56, OR = 57, BSPACE = 58
	}

	public
	static let RULE_program = 0, RULE_body = 1, RULE_expression = 2, RULE_exp = 3, 
            RULE_term = 4, RULE_factor = 5, RULE_assignment = 6, RULE_block = 7, 
            RULE_type = 8, RULE_statement = 9, RULE_function = 10, RULE_declaration = 11, 
            RULE_function_call = 12, RULE_parameters = 13, RULE_if_statement = 14, 
            RULE_repeat_statement = 15, RULE_while_statement = 16, RULE_special_function = 17, 
            RULE_show = 18, RULE_pythagoras = 19, RULE_list_select = 20, 
            RULE_list_functions = 21, RULE_perimeter_tri = 22, RULE_square_root_absolute = 23, 
            RULE_area_tri = 24, RULE_square = 25

	public
	static let ruleNames: [String] = [
		"program", "body", "expression", "exp", "term", "factor", "assignment", 
		"block", "type", "statement", "function", "declaration", "function_call", 
		"parameters", "if_statement", "repeat_statement", "while_statement", "special_function", 
		"show", "pythagoras", "list_select", "list_functions", "perimeter_tri", 
		"square_root_absolute", "area_tri", "square"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'program'", "';'", "'start'", "','", "'true'", "'false'", "'return'", 
		"'void'", "'function'", "'if'", "'else'", "'repeat'", "'while'", "'show'", 
		"'pythagorasHyp'", "'pythagorasSide'", "'select'", "'first_l'", "'last_l'", 
		"'order_l'", "'orderDesc_l'", "'size_l'", "'perimeterTri'", "'square_root'", 
		"'absolute'", "'exp'", "'areaTri'", "'perimeterRec'", "'perimeterSq'", 
		"'areaSq'", "'areaRec'", "'bool'", "'<'", "'>'", "'<='", "'>='", "'equal'", 
		"'notEqual'", "'='", "'+'", "'-'", "'*'", "'/'", "'('", "')'", "'['", 
		"']'", "'{'", "'}'", "'number'", "'decimal'", nil, nil, nil, nil, "'and'", 
		"'or'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, "BOOL", "LESSTHAN", "MORETHAN", "LESSOREQUAL", "MOREOREQUAL", 
		"EQUALS", "NOTEQUALS", "ASSIGN", "ADD", "SUBS", "MULT", "DIV", "LEFTPAREN", 
		"RIGHTPAREN", "LEFTBRACKET", "RIGHTBRACKET", "LEFTCURL", "RIGHTCURL", 
		"NUMBER", "DECIMAL", "ID", "CTE_I", "CTE_F", "SENTENCE", "AND", "OR", 
		"BSPACE"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "BasicLearn.g4" }

	override open
	func getRuleNames() -> [String] { return BasicLearnParser.ruleNames }

	override open
	func getSerializedATN() -> String { return BasicLearnParser._serializedATN }

	override open
	func getATN() -> ATN { return BasicLearnParser._ATN }

	override open
	func getVocabulary() -> Vocabulary {
	    return BasicLearnParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,BasicLearnParser._ATN,BasicLearnParser._decisionToDFA, BasicLearnParser._sharedContextCache)
	}

	public class ProgramContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, 0)
			}
			open
			func body() -> BodyContext? {
				return getRuleContext(BodyContext.self, 0)
			}
			open
			func declaration() -> [DeclarationContext] {
				return getRuleContexts(DeclarationContext.self)
			}
			open
			func declaration(_ i: Int) -> DeclarationContext? {
				return getRuleContext(DeclarationContext.self, i)
			}
			open
			func function() -> [FunctionContext] {
				return getRuleContexts(FunctionContext.self)
			}
			open
			func function(_ i: Int) -> FunctionContext? {
				return getRuleContext(FunctionContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_program
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterProgram(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitProgram(self)
			}
		}
	}
	@discardableResult
	 open func program() throws -> ProgramContext {
		var _localctx: ProgramContext = ProgramContext(_ctx, getState())
		try enterRule(_localctx, 0, BasicLearnParser.RULE_program)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(52)
		 	try match(BasicLearnParser.Tokens.T__0.rawValue)
		 	setState(53)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(54)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)
		 	setState(58)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,0,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(55)
		 			try declaration()

		 	 
		 		}
		 		setState(60)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,0,_ctx)
		 	}
		 	setState(64)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__7.rawValue,BasicLearnParser.Tokens.BOOL.rawValue,BasicLearnParser.Tokens.NUMBER.rawValue,BasicLearnParser.Tokens.DECIMAL.rawValue,BasicLearnParser.Tokens.SENTENCE.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(61)
		 		try function()


		 		setState(66)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(67)
		 	try body()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BodyContext: ParserRuleContext {
			open
			func block() -> BlockContext? {
				return getRuleContext(BlockContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_body
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterBody(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitBody(self)
			}
		}
	}
	@discardableResult
	 open func body() throws -> BodyContext {
		var _localctx: BodyContext = BodyContext(_ctx, getState())
		try enterRule(_localctx, 2, BasicLearnParser.RULE_body)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(69)
		 	try match(BasicLearnParser.Tokens.T__2.rawValue)
		 	setState(70)
		 	try block()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionContext: ParserRuleContext {
			open
			func exp() -> [ExpContext] {
				return getRuleContexts(ExpContext.self)
			}
			open
			func exp(_ i: Int) -> ExpContext? {
				return getRuleContext(ExpContext.self, i)
			}
			open
			func LESSTHAN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LESSTHAN.rawValue, 0)
			}
			open
			func MORETHAN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.MORETHAN.rawValue, 0)
			}
			open
			func LESSOREQUAL() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LESSOREQUAL.rawValue, 0)
			}
			open
			func MOREOREQUAL() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.MOREOREQUAL.rawValue, 0)
			}
			open
			func EQUALS() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.EQUALS.rawValue, 0)
			}
			open
			func NOTEQUALS() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.NOTEQUALS.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_expression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitExpression(self)
			}
		}
	}
	@discardableResult
	 open func expression() throws -> ExpressionContext {
		var _localctx: ExpressionContext = ExpressionContext(_ctx, getState())
		try enterRule(_localctx, 4, BasicLearnParser.RULE_expression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(72)
		 	try exp()
		 	setState(79)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.LESSTHAN.rawValue,BasicLearnParser.Tokens.MORETHAN.rawValue,BasicLearnParser.Tokens.LESSOREQUAL.rawValue,BasicLearnParser.Tokens.MOREOREQUAL.rawValue,BasicLearnParser.Tokens.EQUALS.rawValue,BasicLearnParser.Tokens.NOTEQUALS.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(73)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, BasicLearnParser.Tokens.LESSTHAN.rawValue,BasicLearnParser.Tokens.MORETHAN.rawValue,BasicLearnParser.Tokens.LESSOREQUAL.rawValue,BasicLearnParser.Tokens.MOREOREQUAL.rawValue,BasicLearnParser.Tokens.EQUALS.rawValue,BasicLearnParser.Tokens.NOTEQUALS.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(74)
		 		try exp()
		 		setState(77)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BasicLearnParser.Tokens.AND.rawValue || _la == BasicLearnParser.Tokens.OR.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(75)
		 			_la = try _input.LA(1)
		 			if (!(//closure
		 			 { () -> Bool in
		 			      let testSet: Bool = _la == BasicLearnParser.Tokens.AND.rawValue || _la == BasicLearnParser.Tokens.OR.rawValue
		 			      return testSet
		 			 }())) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}
		 			setState(76)
		 			try expression()

		 		}


		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpContext: ParserRuleContext {
			open
			func term() -> TermContext? {
				return getRuleContext(TermContext.self, 0)
			}
			open
			func ADD() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ADD.rawValue, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func SUBS() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.SUBS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_exp
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterExp(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitExp(self)
			}
		}
	}
	@discardableResult
	 open func exp() throws -> ExpContext {
		var _localctx: ExpContext = ExpContext(_ctx, getState())
		try enterRule(_localctx, 6, BasicLearnParser.RULE_exp)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(81)
		 	try term()
		 	setState(86)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ADD:
		 	 	setState(82)
		 	 	try match(BasicLearnParser.Tokens.ADD.rawValue)
		 	 	setState(83)
		 	 	try exp()

		 		break

		 	case .SUBS:
		 	 	setState(84)
		 	 	try match(BasicLearnParser.Tokens.SUBS.rawValue)
		 	 	setState(85)
		 	 	try exp()

		 		break
		 	case .T__1:fallthrough
		 	case .T__3:fallthrough
		 	case .LESSTHAN:fallthrough
		 	case .MORETHAN:fallthrough
		 	case .LESSOREQUAL:fallthrough
		 	case .MOREOREQUAL:fallthrough
		 	case .EQUALS:fallthrough
		 	case .NOTEQUALS:fallthrough
		 	case .RIGHTPAREN:fallthrough
		 	case .RIGHTBRACKET:fallthrough
		 	case .AND:fallthrough
		 	case .OR:
		 		break
		 	default:
		 		break
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TermContext: ParserRuleContext {
			open
			func factor() -> FactorContext? {
				return getRuleContext(FactorContext.self, 0)
			}
			open
			func MULT() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.MULT.rawValue, 0)
			}
			open
			func term() -> TermContext? {
				return getRuleContext(TermContext.self, 0)
			}
			open
			func DIV() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.DIV.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_term
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterTerm(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitTerm(self)
			}
		}
	}
	@discardableResult
	 open func term() throws -> TermContext {
		var _localctx: TermContext = TermContext(_ctx, getState())
		try enterRule(_localctx, 8, BasicLearnParser.RULE_term)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(88)
		 	try factor()
		 	setState(93)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .MULT:
		 	 	setState(89)
		 	 	try match(BasicLearnParser.Tokens.MULT.rawValue)
		 	 	setState(90)
		 	 	try term()

		 		break

		 	case .DIV:
		 	 	setState(91)
		 	 	try match(BasicLearnParser.Tokens.DIV.rawValue)
		 	 	setState(92)
		 	 	try term()

		 		break
		 	case .T__1:fallthrough
		 	case .T__3:fallthrough
		 	case .LESSTHAN:fallthrough
		 	case .MORETHAN:fallthrough
		 	case .LESSOREQUAL:fallthrough
		 	case .MOREOREQUAL:fallthrough
		 	case .EQUALS:fallthrough
		 	case .NOTEQUALS:fallthrough
		 	case .ADD:fallthrough
		 	case .SUBS:fallthrough
		 	case .RIGHTPAREN:fallthrough
		 	case .RIGHTBRACKET:fallthrough
		 	case .AND:fallthrough
		 	case .OR:
		 		break
		 	default:
		 		break
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FactorContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, 0)
			}
			open
			func LEFTBRACKET() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTBRACKET.rawValue, 0)
			}
			open
			func exp() -> [ExpContext] {
				return getRuleContexts(ExpContext.self)
			}
			open
			func exp(_ i: Int) -> ExpContext? {
				return getRuleContext(ExpContext.self, i)
			}
			open
			func RIGHTBRACKET() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue, 0)
			}
			open
			func CTE_I() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.CTE_I.rawValue, 0)
			}
			open
			func CTE_F() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.CTE_F.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_factor
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterFactor(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitFactor(self)
			}
		}
	}
	@discardableResult
	 open func factor() throws -> FactorContext {
		var _localctx: FactorContext = FactorContext(_ctx, getState())
		try enterRule(_localctx, 10, BasicLearnParser.RULE_factor)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(121)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LEFTPAREN:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(95)
		 		try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 		setState(96)
		 		try expression()
		 		setState(97)
		 		try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		 		break

		 	case .ID:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(99)
		 		try match(BasicLearnParser.Tokens.ID.rawValue)
		 		setState(115)
		 		try _errHandler.sync(self)
		 		switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .LEFTBRACKET:
		 		 	setState(100)
		 		 	try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 		 	setState(101)
		 		 	try exp()
		 		 	setState(102)
		 		 	try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 			break

		 		case .LEFTPAREN:
		 		 	setState(104)
		 		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 		 	setState(105)
		 		 	try exp()
		 		 	setState(110)
		 		 	try _errHandler.sync(self)
		 		 	_la = try _input.LA(1)
		 		 	while (//closure
		 		 	 { () -> Bool in
		 		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__3.rawValue
		 		 	      return testSet
		 		 	 }()) {
		 		 		setState(106)
		 		 		try match(BasicLearnParser.Tokens.T__3.rawValue)
		 		 		setState(107)
		 		 		try exp()


		 		 		setState(112)
		 		 		try _errHandler.sync(self)
		 		 		_la = try _input.LA(1)
		 		 	}
		 		 	setState(113)
		 		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		 			break
		 		case .T__1:fallthrough
		 		case .T__3:fallthrough
		 		case .LESSTHAN:fallthrough
		 		case .MORETHAN:fallthrough
		 		case .LESSOREQUAL:fallthrough
		 		case .MOREOREQUAL:fallthrough
		 		case .EQUALS:fallthrough
		 		case .NOTEQUALS:fallthrough
		 		case .ADD:fallthrough
		 		case .SUBS:fallthrough
		 		case .MULT:fallthrough
		 		case .DIV:fallthrough
		 		case .RIGHTPAREN:fallthrough
		 		case .RIGHTBRACKET:fallthrough
		 		case .AND:fallthrough
		 		case .OR:
		 			break
		 		default:
		 			break
		 		}

		 		break

		 	case .CTE_I:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(117)
		 		try match(BasicLearnParser.Tokens.CTE_I.rawValue)

		 		break

		 	case .CTE_F:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(118)
		 		try match(BasicLearnParser.Tokens.CTE_F.rawValue)

		 		break

		 	case .T__4:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(119)
		 		try match(BasicLearnParser.Tokens.T__4.rawValue)

		 		break

		 	case .T__5:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(120)
		 		try match(BasicLearnParser.Tokens.T__5.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AssignmentContext: ParserRuleContext {
			open
			func ID() -> [TerminalNode] {
				return getTokens(BasicLearnParser.Tokens.ID.rawValue)
			}
			open
			func ID(_ i:Int) -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, i)
			}
			open
			func ASSIGN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ASSIGN.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func LEFTBRACKET() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTBRACKET.rawValue, 0)
			}
			open
			func RIGHTBRACKET() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue, 0)
			}
			open
			func CTE_I() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.CTE_I.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_assignment
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterAssignment(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitAssignment(self)
			}
		}
	}
	@discardableResult
	 open func assignment() throws -> AssignmentContext {
		var _localctx: AssignmentContext = AssignmentContext(_ctx, getState())
		try enterRule(_localctx, 12, BasicLearnParser.RULE_assignment)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(123)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(127)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.LEFTBRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(124)
		 		try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 		setState(125)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BasicLearnParser.Tokens.ID.rawValue || _la == BasicLearnParser.Tokens.CTE_I.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(126)
		 		try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 	}

		 	setState(129)
		 	try match(BasicLearnParser.Tokens.ASSIGN.rawValue)
		 	setState(130)
		 	try expression()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BlockContext: ParserRuleContext {
			open
			func LEFTCURL() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTCURL.rawValue, 0)
			}
			open
			func RIGHTCURL() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTCURL.rawValue, 0)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_block
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterBlock(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitBlock(self)
			}
		}
	}
	@discardableResult
	 open func block() throws -> BlockContext {
		var _localctx: BlockContext = BlockContext(_ctx, getState())
		try enterRule(_localctx, 14, BasicLearnParser.RULE_block)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(132)
		 	try match(BasicLearnParser.Tokens.LEFTCURL.rawValue)
		 	setState(134) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(133)
		 		try statement()


		 		setState(136); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__6.rawValue,BasicLearnParser.Tokens.T__9.rawValue,BasicLearnParser.Tokens.T__11.rawValue,BasicLearnParser.Tokens.T__12.rawValue,BasicLearnParser.Tokens.T__13.rawValue,BasicLearnParser.Tokens.T__14.rawValue,BasicLearnParser.Tokens.T__15.rawValue,BasicLearnParser.Tokens.T__16.rawValue,BasicLearnParser.Tokens.T__17.rawValue,BasicLearnParser.Tokens.T__18.rawValue,BasicLearnParser.Tokens.T__19.rawValue,BasicLearnParser.Tokens.T__20.rawValue,BasicLearnParser.Tokens.T__21.rawValue,BasicLearnParser.Tokens.T__22.rawValue,BasicLearnParser.Tokens.T__23.rawValue,BasicLearnParser.Tokens.T__24.rawValue,BasicLearnParser.Tokens.T__26.rawValue,BasicLearnParser.Tokens.T__27.rawValue,BasicLearnParser.Tokens.T__28.rawValue,BasicLearnParser.Tokens.T__29.rawValue,BasicLearnParser.Tokens.T__30.rawValue,BasicLearnParser.Tokens.ID.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())
		 	setState(138)
		 	try match(BasicLearnParser.Tokens.RIGHTCURL.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeContext: ParserRuleContext {
			open
			func NUMBER() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.NUMBER.rawValue, 0)
			}
			open
			func DECIMAL() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.DECIMAL.rawValue, 0)
			}
			open
			func BOOL() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.BOOL.rawValue, 0)
			}
			open
			func SENTENCE() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.SENTENCE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_type
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitType(self)
			}
		}
	}
	@discardableResult
	 open func type() throws -> TypeContext {
		var _localctx: TypeContext = TypeContext(_ctx, getState())
		try enterRule(_localctx, 16, BasicLearnParser.RULE_type)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(140)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.BOOL.rawValue,BasicLearnParser.Tokens.NUMBER.rawValue,BasicLearnParser.Tokens.DECIMAL.rawValue,BasicLearnParser.Tokens.SENTENCE.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementContext: ParserRuleContext {
			open
			func function_call() -> Function_callContext? {
				return getRuleContext(Function_callContext.self, 0)
			}
			open
			func assignment() -> AssignmentContext? {
				return getRuleContext(AssignmentContext.self, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func if_statement() -> If_statementContext? {
				return getRuleContext(If_statementContext.self, 0)
			}
			open
			func repeat_statement() -> Repeat_statementContext? {
				return getRuleContext(Repeat_statementContext.self, 0)
			}
			open
			func while_statement() -> While_statementContext? {
				return getRuleContext(While_statementContext.self, 0)
			}
			open
			func special_function() -> Special_functionContext? {
				return getRuleContext(Special_functionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_statement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitStatement(self)
			}
		}
	}
	@discardableResult
	 open func statement() throws -> StatementContext {
		var _localctx: StatementContext = StatementContext(_ctx, getState())
		try enterRule(_localctx, 18, BasicLearnParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(158)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,11, _ctx)) {
		 	case 1:
		 		setState(142)
		 		try function_call()
		 		setState(143)
		 		try match(BasicLearnParser.Tokens.T__1.rawValue)

		 		break
		 	case 2:
		 		setState(145)
		 		try assignment()
		 		setState(146)
		 		try match(BasicLearnParser.Tokens.T__1.rawValue)

		 		break
		 	case 3:
		 		setState(148)
		 		try match(BasicLearnParser.Tokens.T__6.rawValue)
		 		setState(149)
		 		try exp()
		 		setState(150)
		 		try match(BasicLearnParser.Tokens.T__1.rawValue)

		 		break
		 	case 4:
		 		setState(152)
		 		try if_statement()

		 		break
		 	case 5:
		 		setState(153)
		 		try repeat_statement()

		 		break
		 	case 6:
		 		setState(154)
		 		try while_statement()

		 		break
		 	case 7:
		 		setState(155)
		 		try special_function()
		 		setState(156)
		 		try match(BasicLearnParser.Tokens.T__1.rawValue)

		 		break
		 	default: break
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, 0)
			}
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
			open
			func LEFTCURL() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTCURL.rawValue, 0)
			}
			open
			func RIGHTCURL() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTCURL.rawValue, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
			open
			func parameters() -> ParametersContext? {
				return getRuleContext(ParametersContext.self, 0)
			}
			open
			func declaration() -> [DeclarationContext] {
				return getRuleContexts(DeclarationContext.self)
			}
			open
			func declaration(_ i: Int) -> DeclarationContext? {
				return getRuleContext(DeclarationContext.self, i)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_function
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterFunction(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitFunction(self)
			}
		}
	}
	@discardableResult
	 open func function() throws -> FunctionContext {
		var _localctx: FunctionContext = FunctionContext(_ctx, getState())
		try enterRule(_localctx, 20, BasicLearnParser.RULE_function)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(162)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .BOOL:fallthrough
		 	case .NUMBER:fallthrough
		 	case .DECIMAL:fallthrough
		 	case .SENTENCE:
		 		setState(160)
		 		try type()

		 		break

		 	case .T__7:
		 		setState(161)
		 		try match(BasicLearnParser.Tokens.T__7.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(164)
		 	try match(BasicLearnParser.Tokens.T__8.rawValue)
		 	setState(165)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(166)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(168)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.BOOL.rawValue,BasicLearnParser.Tokens.NUMBER.rawValue,BasicLearnParser.Tokens.DECIMAL.rawValue,BasicLearnParser.Tokens.SENTENCE.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(167)
		 		try parameters()

		 	}

		 	setState(170)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(171)
		 	try match(BasicLearnParser.Tokens.LEFTCURL.rawValue)
		 	setState(175)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.BOOL.rawValue,BasicLearnParser.Tokens.NUMBER.rawValue,BasicLearnParser.Tokens.DECIMAL.rawValue,BasicLearnParser.Tokens.SENTENCE.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(172)
		 		try declaration()


		 		setState(177)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(179) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(178)
		 		try statement()


		 		setState(181); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__6.rawValue,BasicLearnParser.Tokens.T__9.rawValue,BasicLearnParser.Tokens.T__11.rawValue,BasicLearnParser.Tokens.T__12.rawValue,BasicLearnParser.Tokens.T__13.rawValue,BasicLearnParser.Tokens.T__14.rawValue,BasicLearnParser.Tokens.T__15.rawValue,BasicLearnParser.Tokens.T__16.rawValue,BasicLearnParser.Tokens.T__17.rawValue,BasicLearnParser.Tokens.T__18.rawValue,BasicLearnParser.Tokens.T__19.rawValue,BasicLearnParser.Tokens.T__20.rawValue,BasicLearnParser.Tokens.T__21.rawValue,BasicLearnParser.Tokens.T__22.rawValue,BasicLearnParser.Tokens.T__23.rawValue,BasicLearnParser.Tokens.T__24.rawValue,BasicLearnParser.Tokens.T__26.rawValue,BasicLearnParser.Tokens.T__27.rawValue,BasicLearnParser.Tokens.T__28.rawValue,BasicLearnParser.Tokens.T__29.rawValue,BasicLearnParser.Tokens.T__30.rawValue,BasicLearnParser.Tokens.ID.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())
		 	setState(183)
		 	try match(BasicLearnParser.Tokens.RIGHTCURL.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DeclarationContext: ParserRuleContext {
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
			open
			func ID() -> [TerminalNode] {
				return getTokens(BasicLearnParser.Tokens.ID.rawValue)
			}
			open
			func ID(_ i:Int) -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, i)
			}
			open
			func LEFTBRACKET() -> [TerminalNode] {
				return getTokens(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
			}
			open
			func LEFTBRACKET(_ i:Int) -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTBRACKET.rawValue, i)
			}
			open
			func CTE_I() -> [TerminalNode] {
				return getTokens(BasicLearnParser.Tokens.CTE_I.rawValue)
			}
			open
			func CTE_I(_ i:Int) -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.CTE_I.rawValue, i)
			}
			open
			func RIGHTBRACKET() -> [TerminalNode] {
				return getTokens(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)
			}
			open
			func RIGHTBRACKET(_ i:Int) -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_declaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func declaration() throws -> DeclarationContext {
		var _localctx: DeclarationContext = DeclarationContext(_ctx, getState())
		try enterRule(_localctx, 22, BasicLearnParser.RULE_declaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(185)
		 	try type()
		 	setState(186)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(190)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.LEFTBRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(187)
		 		try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 		setState(188)
		 		try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 		setState(189)
		 		try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 	}

		 	setState(201)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__3.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(192)
		 		try match(BasicLearnParser.Tokens.T__3.rawValue)
		 		setState(193)
		 		try match(BasicLearnParser.Tokens.ID.rawValue)
		 		setState(197)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BasicLearnParser.Tokens.LEFTBRACKET.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(194)
		 			try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 			setState(195)
		 			try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 			setState(196)
		 			try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 		}



		 		setState(203)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(204)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class Function_callContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, 0)
			}
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_function_call
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterFunction_call(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitFunction_call(self)
			}
		}
	}
	@discardableResult
	 open func function_call() throws -> Function_callContext {
		var _localctx: Function_callContext = Function_callContext(_ctx, getState())
		try enterRule(_localctx, 24, BasicLearnParser.RULE_function_call)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(206)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(207)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(216)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__4.rawValue,BasicLearnParser.Tokens.T__5.rawValue,BasicLearnParser.Tokens.LEFTPAREN.rawValue,BasicLearnParser.Tokens.ID.rawValue,BasicLearnParser.Tokens.CTE_I.rawValue,BasicLearnParser.Tokens.CTE_F.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(208)
		 		try expression()
		 		setState(213)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BasicLearnParser.Tokens.T__3.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(209)
		 			try match(BasicLearnParser.Tokens.T__3.rawValue)
		 			setState(210)
		 			try expression()


		 			setState(215)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(218)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParametersContext: ParserRuleContext {
			open
			func type() -> [TypeContext] {
				return getRuleContexts(TypeContext.self)
			}
			open
			func type(_ i: Int) -> TypeContext? {
				return getRuleContext(TypeContext.self, i)
			}
			open
			func ID() -> [TerminalNode] {
				return getTokens(BasicLearnParser.Tokens.ID.rawValue)
			}
			open
			func ID(_ i:Int) -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_parameters
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterParameters(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitParameters(self)
			}
		}
	}
	@discardableResult
	 open func parameters() throws -> ParametersContext {
		var _localctx: ParametersContext = ParametersContext(_ctx, getState())
		try enterRule(_localctx, 26, BasicLearnParser.RULE_parameters)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(220)
		 	try type()
		 	setState(221)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(228)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__3.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(222)
		 		try match(BasicLearnParser.Tokens.T__3.rawValue)
		 		setState(223)
		 		try type()
		 		setState(224)
		 		try match(BasicLearnParser.Tokens.ID.rawValue)


		 		setState(230)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class If_statementContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
			open
			func block() -> [BlockContext] {
				return getRuleContexts(BlockContext.self)
			}
			open
			func block(_ i: Int) -> BlockContext? {
				return getRuleContext(BlockContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_if_statement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterIf_statement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitIf_statement(self)
			}
		}
	}
	@discardableResult
	 open func if_statement() throws -> If_statementContext {
		var _localctx: If_statementContext = If_statementContext(_ctx, getState())
		try enterRule(_localctx, 28, BasicLearnParser.RULE_if_statement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(231)
		 	try match(BasicLearnParser.Tokens.T__9.rawValue)
		 	setState(232)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(233)
		 	try expression()
		 	setState(234)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(235)
		 	try block()
		 	setState(238)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__10.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(236)
		 		try match(BasicLearnParser.Tokens.T__10.rawValue)
		 		setState(237)
		 		try block()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class Repeat_statementContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
			open
			func block() -> BlockContext? {
				return getRuleContext(BlockContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_repeat_statement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterRepeat_statement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitRepeat_statement(self)
			}
		}
	}
	@discardableResult
	 open func repeat_statement() throws -> Repeat_statementContext {
		var _localctx: Repeat_statementContext = Repeat_statementContext(_ctx, getState())
		try enterRule(_localctx, 30, BasicLearnParser.RULE_repeat_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(240)
		 	try match(BasicLearnParser.Tokens.T__11.rawValue)
		 	setState(241)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(242)
		 	try exp()
		 	setState(243)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(244)
		 	try block()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class While_statementContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
			open
			func block() -> BlockContext? {
				return getRuleContext(BlockContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_while_statement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterWhile_statement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitWhile_statement(self)
			}
		}
	}
	@discardableResult
	 open func while_statement() throws -> While_statementContext {
		var _localctx: While_statementContext = While_statementContext(_ctx, getState())
		try enterRule(_localctx, 32, BasicLearnParser.RULE_while_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(246)
		 	try match(BasicLearnParser.Tokens.T__12.rawValue)
		 	setState(247)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(248)
		 	try expression()
		 	setState(249)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(250)
		 	try block()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class Special_functionContext: ParserRuleContext {
			open
			func area_tri() -> Area_triContext? {
				return getRuleContext(Area_triContext.self, 0)
			}
			open
			func perimeter_tri() -> Perimeter_triContext? {
				return getRuleContext(Perimeter_triContext.self, 0)
			}
			open
			func list_select() -> List_selectContext? {
				return getRuleContext(List_selectContext.self, 0)
			}
			open
			func show() -> ShowContext? {
				return getRuleContext(ShowContext.self, 0)
			}
			open
			func pythagoras() -> PythagorasContext? {
				return getRuleContext(PythagorasContext.self, 0)
			}
			open
			func list_functions() -> List_functionsContext? {
				return getRuleContext(List_functionsContext.self, 0)
			}
			open
			func square_root_absolute() -> Square_root_absoluteContext? {
				return getRuleContext(Square_root_absoluteContext.self, 0)
			}
			open
			func square() -> SquareContext? {
				return getRuleContext(SquareContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_special_function
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterSpecial_function(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitSpecial_function(self)
			}
		}
	}
	@discardableResult
	 open func special_function() throws -> Special_functionContext {
		var _localctx: Special_functionContext = Special_functionContext(_ctx, getState())
		try enterRule(_localctx, 34, BasicLearnParser.RULE_special_function)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(260)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__26:
		 		setState(252)
		 		try area_tri()

		 		break

		 	case .T__22:
		 		setState(253)
		 		try perimeter_tri()

		 		break

		 	case .T__16:
		 		setState(254)
		 		try list_select()

		 		break

		 	case .T__13:
		 		setState(255)
		 		try show()

		 		break
		 	case .T__14:fallthrough
		 	case .T__15:
		 		setState(256)
		 		try pythagoras()

		 		break
		 	case .T__17:fallthrough
		 	case .T__18:fallthrough
		 	case .T__19:fallthrough
		 	case .T__20:fallthrough
		 	case .T__21:
		 		setState(257)
		 		try list_functions()

		 		break
		 	case .T__23:fallthrough
		 	case .T__24:
		 		setState(258)
		 		try square_root_absolute()

		 		break
		 	case .T__27:fallthrough
		 	case .T__28:fallthrough
		 	case .T__29:fallthrough
		 	case .T__30:
		 		setState(259)
		 		try square()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ShowContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func SENTENCE() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.SENTENCE.rawValue, 0)
			}
			open
			func special_function() -> Special_functionContext? {
				return getRuleContext(Special_functionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_show
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterShow(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitShow(self)
			}
		}
	}
	@discardableResult
	 open func show() throws -> ShowContext {
		var _localctx: ShowContext = ShowContext(_ctx, getState())
		try enterRule(_localctx, 36, BasicLearnParser.RULE_show)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(262)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(263)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(267)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__4:fallthrough
		 	case .T__5:fallthrough
		 	case .LEFTPAREN:fallthrough
		 	case .ID:fallthrough
		 	case .CTE_I:fallthrough
		 	case .CTE_F:
		 		setState(264)
		 		try expression()

		 		break

		 	case .SENTENCE:
		 		setState(265)
		 		try match(BasicLearnParser.Tokens.SENTENCE.rawValue)

		 		break
		 	case .T__13:fallthrough
		 	case .T__14:fallthrough
		 	case .T__15:fallthrough
		 	case .T__16:fallthrough
		 	case .T__17:fallthrough
		 	case .T__18:fallthrough
		 	case .T__19:fallthrough
		 	case .T__20:fallthrough
		 	case .T__21:fallthrough
		 	case .T__22:fallthrough
		 	case .T__23:fallthrough
		 	case .T__24:fallthrough
		 	case .T__26:fallthrough
		 	case .T__27:fallthrough
		 	case .T__28:fallthrough
		 	case .T__29:fallthrough
		 	case .T__30:
		 		setState(266)
		 		try special_function()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(269)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PythagorasContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func exp() -> [ExpContext] {
				return getRuleContexts(ExpContext.self)
			}
			open
			func exp(_ i: Int) -> ExpContext? {
				return getRuleContext(ExpContext.self, i)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_pythagoras
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterPythagoras(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitPythagoras(self)
			}
		}
	}
	@discardableResult
	 open func pythagoras() throws -> PythagorasContext {
		var _localctx: PythagorasContext = PythagorasContext(_ctx, getState())
		try enterRule(_localctx, 38, BasicLearnParser.RULE_pythagoras)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(271)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__14.rawValue || _la == BasicLearnParser.Tokens.T__15.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(272)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(273)
		 	try exp()
		 	setState(274)
		 	try match(BasicLearnParser.Tokens.T__3.rawValue)
		 	setState(275)
		 	try exp()
		 	setState(276)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class List_selectContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_list_select
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterList_select(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitList_select(self)
			}
		}
	}
	@discardableResult
	 open func list_select() throws -> List_selectContext {
		var _localctx: List_selectContext = List_selectContext(_ctx, getState())
		try enterRule(_localctx, 40, BasicLearnParser.RULE_list_select)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(278)
		 	try match(BasicLearnParser.Tokens.T__16.rawValue)
		 	setState(279)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(280)
		 	try exp()
		 	setState(281)
		 	try match(BasicLearnParser.Tokens.T__3.rawValue)
		 	setState(282)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(283)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class List_functionsContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_list_functions
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterList_functions(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitList_functions(self)
			}
		}
	}
	@discardableResult
	 open func list_functions() throws -> List_functionsContext {
		var _localctx: List_functionsContext = List_functionsContext(_ctx, getState())
		try enterRule(_localctx, 42, BasicLearnParser.RULE_list_functions)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(285)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__17.rawValue,BasicLearnParser.Tokens.T__18.rawValue,BasicLearnParser.Tokens.T__19.rawValue,BasicLearnParser.Tokens.T__20.rawValue,BasicLearnParser.Tokens.T__21.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(286)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(287)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(288)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class Perimeter_triContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func exp() -> [ExpContext] {
				return getRuleContexts(ExpContext.self)
			}
			open
			func exp(_ i: Int) -> ExpContext? {
				return getRuleContext(ExpContext.self, i)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_perimeter_tri
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterPerimeter_tri(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitPerimeter_tri(self)
			}
		}
	}
	@discardableResult
	 open func perimeter_tri() throws -> Perimeter_triContext {
		var _localctx: Perimeter_triContext = Perimeter_triContext(_ctx, getState())
		try enterRule(_localctx, 44, BasicLearnParser.RULE_perimeter_tri)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(290)
		 	try match(BasicLearnParser.Tokens.T__22.rawValue)
		 	setState(291)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(292)
		 	try exp()
		 	setState(293)
		 	try match(BasicLearnParser.Tokens.T__3.rawValue)
		 	setState(294)
		 	try exp()
		 	setState(295)
		 	try match(BasicLearnParser.Tokens.T__3.rawValue)
		 	setState(296)
		 	try exp()
		 	setState(297)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class Square_root_absoluteContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_square_root_absolute
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterSquare_root_absolute(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitSquare_root_absolute(self)
			}
		}
	}
	@discardableResult
	 open func square_root_absolute() throws -> Square_root_absoluteContext {
		var _localctx: Square_root_absoluteContext = Square_root_absoluteContext(_ctx, getState())
		try enterRule(_localctx, 46, BasicLearnParser.RULE_square_root_absolute)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(299)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__23.rawValue || _la == BasicLearnParser.Tokens.T__24.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(300)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(301)
		 	try match(BasicLearnParser.Tokens.T__25.rawValue)
		 	setState(302)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class Area_triContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_area_tri
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterArea_tri(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitArea_tri(self)
			}
		}
	}
	@discardableResult
	 open func area_tri() throws -> Area_triContext {
		var _localctx: Area_triContext = Area_triContext(_ctx, getState())
		try enterRule(_localctx, 48, BasicLearnParser.RULE_area_tri)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(304)
		 	try match(BasicLearnParser.Tokens.T__26.rawValue)
		 	setState(305)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(306)
		 	try match(BasicLearnParser.Tokens.T__25.rawValue)
		 	setState(307)
		 	try match(BasicLearnParser.Tokens.T__3.rawValue)
		 	setState(308)
		 	try match(BasicLearnParser.Tokens.T__25.rawValue)
		 	setState(309)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SquareContext: ParserRuleContext {
			open
			func LEFTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTPAREN.rawValue, 0)
			}
			open
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_square
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterSquare(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitSquare(self)
			}
		}
	}
	@discardableResult
	 open func square() throws -> SquareContext {
		var _localctx: SquareContext = SquareContext(_ctx, getState())
		try enterRule(_localctx, 50, BasicLearnParser.RULE_square)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(311)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__27.rawValue,BasicLearnParser.Tokens.T__28.rawValue,BasicLearnParser.Tokens.T__29.rawValue,BasicLearnParser.Tokens.T__30.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(312)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(313)
		 	try match(BasicLearnParser.Tokens.T__25.rawValue)
		 	setState(314)
		 	try match(BasicLearnParser.Tokens.T__3.rawValue)
		 	setState(315)
		 	try match(BasicLearnParser.Tokens.T__25.rawValue)
		 	setState(316)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public
	static let _serializedATN = BasicLearnParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}