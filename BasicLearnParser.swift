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
                 T__27 = 28, T__28 = 29, T__29 = 30, T__30 = 31, T__31 = 32, 
                 T__32 = 33, T__33 = 34, T__34 = 35, T__35 = 36, T__36 = 37, 
                 T__37 = 38, T__38 = 39, T__39 = 40, T__40 = 41, T__41 = 42, 
                 T__42 = 43, T__43 = 44, T__44 = 45, T__45 = 46, T__46 = 47, 
                 T__47 = 48, T__48 = 49, T__49 = 50, T__50 = 51, T__51 = 52, 
                 ID = 53, CTE_I = 54, CTE_F = 55, BOOL = 56, LESSTHAN = 57, 
                 MORETHAN = 58, LESSOREQUAL = 59, MOREOREQUAL = 60, EQUALS = 61, 
                 NOTEQUALS = 62, ASSIGN = 63, ADD = 64, SUBS = 65, MULT = 66, 
                 DIV = 67, LEFTPAREN = 68, RIGHTPAREN = 69, LEFTBRACKET = 70, 
                 RIGHTBRACKET = 71, LEFTCURL = 72, RIGHTCURL = 73, NUMBER = 74, 
                 DECIMAL = 75, SENTENCE = 76, AND = 77, OR = 78
	}

	public
	static let RULE_program = 0, RULE_body = 1, RULE_statement = 2, RULE_expression = 3, 
            RULE_exp = 4, RULE_term = 5, RULE_factor = 6, RULE_assignment = 7, 
            RULE_block = 8, RULE_declaration = 9, RULE_type = 10, RULE_function = 11, 
            RULE_function_call = 12, RULE_parameters = 13, RULE_if_statement = 14, 
            RULE_repeat_statement = 15, RULE_while_statement = 16, RULE_special_function = 17, 
            RULE_show = 18, RULE_pythagoras = 19, RULE_list_select = 20, 
            RULE_list_functions = 21, RULE_perimeter_tri = 22, RULE_square_root_absolute = 23, 
            RULE_area_tri = 24, RULE_square = 25

	public
	static let ruleNames: [String] = [
		"program", "body", "statement", "expression", "exp", "term", "factor", 
		"assignment", "block", "declaration", "type", "function", "function_call", 
		"parameters", "if_statement", "repeat_statement", "while_statement", "special_function", 
		"show", "pythagoras", "list_select", "list_functions", "perimeter_tri", 
		"square_root_absolute", "area_tri", "square"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'program'", "';'", "'declaration'", "'function'", "'body'", "'start'", 
		"'block'", "'function_call'", "'assignment'", "'if'", "'repeat'", "'while'", 
		"'special_functions'", "'exp'", "'expression'", "'term'", "'factor'", 
		"'true'", "'false'", "'expressiom'", "'statement'", "'type'", "','", "'void'", 
		"'parameters'", "'logical'", "'else'", "'area_tri'", "'perimeter_tri'", 
		"'list_select'", "'show'", "'pythagoras'", "'listfunctions'", "'square_root_absolute'", 
		"'square'", "'cte_string'", "'pythagorasHyp'", "'pythagorasSide'", "'select'", 
		"'first'", "'last'", "'order'", "'orderDesc'", "'size'", "'perimeterTri'", 
		"'square_root'", "'absolute'", "'areaTri'", "'perimeterRec'", "'perimeterSq'", 
		"'areaSq'", "'areaRec'", nil, nil, nil, nil, "'<'", "'>'", "'<='", "'>='", 
		"'equal'", "'notEqual'", "'='", "'+'", "'-'", "'*'", "'/'", "'('", "')'", 
		"'['", "']'", "'{'", "'}'", "'number'", "'decimal'", "'sentence'", "'and'", 
		"'or'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "ID", "CTE_I", 
		"CTE_F", "BOOL", "LESSTHAN", "MORETHAN", "LESSOREQUAL", "MOREOREQUAL", 
		"EQUALS", "NOTEQUALS", "ASSIGN", "ADD", "SUBS", "MULT", "DIV", "LEFTPAREN", 
		"RIGHTPAREN", "LEFTBRACKET", "RIGHTBRACKET", "LEFTCURL", "RIGHTCURL", 
		"NUMBER", "DECIMAL", "SENTENCE", "AND", "OR"
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
		 	try enterOuterAlt(_localctx, 1)
		 	setState(52)
		 	try match(BasicLearnParser.Tokens.T__0.rawValue)
		 	setState(53)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(54)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)
		 	setState(58)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__2.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(55)
		 		try match(BasicLearnParser.Tokens.T__2.rawValue)


		 		setState(60)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(64)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__3.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(61)
		 		try match(BasicLearnParser.Tokens.T__3.rawValue)


		 		setState(66)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(67)
		 	try match(BasicLearnParser.Tokens.T__4.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BodyContext: ParserRuleContext {
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
		 	try match(BasicLearnParser.Tokens.T__5.rawValue)
		 	setState(70)
		 	try match(BasicLearnParser.Tokens.T__6.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementContext: ParserRuleContext {
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
		try enterRule(_localctx, 4, BasicLearnParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(80)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__7:
		 		setState(72)
		 		try match(BasicLearnParser.Tokens.T__7.rawValue)
		 		setState(73)
		 		try match(BasicLearnParser.Tokens.T__1.rawValue)

		 		break

		 	case .T__8:
		 		setState(74)
		 		try match(BasicLearnParser.Tokens.T__8.rawValue)
		 		setState(75)
		 		try match(BasicLearnParser.Tokens.T__1.rawValue)

		 		break

		 	case .T__9:
		 		setState(76)
		 		try match(BasicLearnParser.Tokens.T__9.rawValue)

		 		break

		 	case .T__10:
		 		setState(77)
		 		try match(BasicLearnParser.Tokens.T__10.rawValue)

		 		break

		 	case .T__11:
		 		setState(78)
		 		try match(BasicLearnParser.Tokens.T__11.rawValue)

		 		break

		 	case .T__12:
		 		setState(79)
		 		try match(BasicLearnParser.Tokens.T__12.rawValue)

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

	public class ExpressionContext: ParserRuleContext {
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
			func ASSIGN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ASSIGN.rawValue, 0)
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
		try enterRule(_localctx, 6, BasicLearnParser.RULE_expression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(82)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(83)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.LESSTHAN.rawValue,BasicLearnParser.Tokens.MORETHAN.rawValue,BasicLearnParser.Tokens.LESSOREQUAL.rawValue,BasicLearnParser.Tokens.MOREOREQUAL.rawValue,BasicLearnParser.Tokens.EQUALS.rawValue,BasicLearnParser.Tokens.NOTEQUALS.rawValue,BasicLearnParser.Tokens.ASSIGN.rawValue]
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
		 	setState(84)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(87)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.AND.rawValue || _la == BasicLearnParser.Tokens.OR.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(85)
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
		 		setState(86)
		 		try match(BasicLearnParser.Tokens.T__14.rawValue)

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
			func ADD() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ADD.rawValue, 0)
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
		try enterRule(_localctx, 8, BasicLearnParser.RULE_exp)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(89)
		 	try match(BasicLearnParser.Tokens.T__15.rawValue)
		 	setState(93)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ADD:
		 	 	setState(90)
		 	 	try match(BasicLearnParser.Tokens.ADD.rawValue)

		 		break

		 	case .SUBS:
		 	 	setState(91)
		 	 	try match(BasicLearnParser.Tokens.SUBS.rawValue)
		 	 	setState(92)
		 	 	try match(BasicLearnParser.Tokens.T__13.rawValue)

		 		break

		 	case .EOF:
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
			func MULT() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.MULT.rawValue, 0)
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
		try enterRule(_localctx, 10, BasicLearnParser.RULE_term)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(95)
		 	try match(BasicLearnParser.Tokens.T__16.rawValue)
		 	setState(99)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .MULT:
		 	 	setState(96)
		 	 	try match(BasicLearnParser.Tokens.MULT.rawValue)

		 		break

		 	case .DIV:
		 	 	setState(97)
		 	 	try match(BasicLearnParser.Tokens.DIV.rawValue)
		 	 	setState(98)
		 	 	try match(BasicLearnParser.Tokens.T__15.rawValue)

		 		break

		 	case .EOF:
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
		try enterRule(_localctx, 12, BasicLearnParser.RULE_factor)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(117)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LEFTPAREN:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(101)
		 		try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 		setState(102)
		 		try match(BasicLearnParser.Tokens.T__14.rawValue)
		 		setState(103)
		 		try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		 		break

		 	case .ID:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(104)
		 		try match(BasicLearnParser.Tokens.ID.rawValue)
		 		setState(111)
		 		try _errHandler.sync(self)
		 		switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .LEFTBRACKET:
		 			setState(105)
		 			try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 			setState(106)
		 			try match(BasicLearnParser.Tokens.T__13.rawValue)
		 			setState(107)
		 			try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 			break

		 		case .LEFTPAREN:
		 			setState(108)
		 			try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 			setState(109)
		 			try match(BasicLearnParser.Tokens.T__13.rawValue)
		 			setState(110)
		 			try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}

		 		break

		 	case .CTE_I:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(113)
		 		try match(BasicLearnParser.Tokens.CTE_I.rawValue)

		 		break

		 	case .CTE_F:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(114)
		 		try match(BasicLearnParser.Tokens.CTE_F.rawValue)

		 		break

		 	case .T__17:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(115)
		 		try match(BasicLearnParser.Tokens.T__17.rawValue)

		 		break

		 	case .T__18:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(116)
		 		try match(BasicLearnParser.Tokens.T__18.rawValue)

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
			func ID() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ID.rawValue, 0)
			}
			open
			func ASSIGN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.ASSIGN.rawValue, 0)
			}
			open
			func LEFTBRACKET() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.LEFTBRACKET.rawValue, 0)
			}
			open
			func CTE_I() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.CTE_I.rawValue, 0)
			}
			open
			func RIGHTBRACKET() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue, 0)
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
		try enterRule(_localctx, 14, BasicLearnParser.RULE_assignment)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(119)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(123)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.LEFTBRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(120)
		 		try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 		setState(121)
		 		try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 		setState(122)
		 		try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 	}

		 	setState(125)
		 	try match(BasicLearnParser.Tokens.ASSIGN.rawValue)
		 	setState(126)
		 	try match(BasicLearnParser.Tokens.T__19.rawValue)
		 	setState(127)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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
		try enterRule(_localctx, 16, BasicLearnParser.RULE_block)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(129)
		 	try match(BasicLearnParser.Tokens.LEFTCURL.rawValue)
		 	setState(131) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(130)
		 		try match(BasicLearnParser.Tokens.T__20.rawValue)


		 		setState(133); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__20.rawValue
		 	      return testSet
		 	 }())
		 	setState(135)
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
		try enterRule(_localctx, 18, BasicLearnParser.RULE_declaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(137)
		 	try match(BasicLearnParser.Tokens.T__21.rawValue)
		 	setState(138)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(142)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.LEFTBRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(139)
		 		try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 		setState(140)
		 		try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 		setState(141)
		 		try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 	}

		 	setState(153)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__22.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(144)
		 		try match(BasicLearnParser.Tokens.T__22.rawValue)
		 		setState(145)
		 		try match(BasicLearnParser.Tokens.ID.rawValue)
		 		setState(149)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BasicLearnParser.Tokens.LEFTBRACKET.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(146)
		 			try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 			setState(147)
		 			try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 			setState(148)
		 			try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 		}



		 		setState(155)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(156)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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
		try enterRule(_localctx, 20, BasicLearnParser.RULE_type)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(158)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.BOOL.rawValue,BasicLearnParser.Tokens.NUMBER.rawValue,BasicLearnParser.Tokens.DECIMAL.rawValue,BasicLearnParser.Tokens.SENTENCE.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 56)
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
		try enterRule(_localctx, 22, BasicLearnParser.RULE_function)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(160)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__21.rawValue || _la == BasicLearnParser.Tokens.T__23.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(161)
		 	try match(BasicLearnParser.Tokens.T__3.rawValue)
		 	setState(162)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(163)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(164)
		 	try match(BasicLearnParser.Tokens.T__24.rawValue)
		 	setState(165)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(169)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__2.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(166)
		 		try match(BasicLearnParser.Tokens.T__2.rawValue)


		 		setState(171)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(172)
		 	try match(BasicLearnParser.Tokens.T__6.rawValue)

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
		 	setState(174)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(175)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(176)
		 	try match(BasicLearnParser.Tokens.T__14.rawValue)
		 	setState(181)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__22.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(177)
		 		try match(BasicLearnParser.Tokens.T__22.rawValue)
		 		setState(178)
		 		try match(BasicLearnParser.Tokens.T__14.rawValue)


		 		setState(183)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(184)
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
		 	setState(186)
		 	try match(BasicLearnParser.Tokens.T__21.rawValue)
		 	setState(187)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(193)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__22.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(188)
		 		try match(BasicLearnParser.Tokens.T__22.rawValue)
		 		setState(189)
		 		try match(BasicLearnParser.Tokens.T__21.rawValue)
		 		setState(190)
		 		try match(BasicLearnParser.Tokens.ID.rawValue)


		 		setState(195)
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
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
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
		 	setState(196)
		 	try match(BasicLearnParser.Tokens.T__9.rawValue)
		 	setState(197)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(198)
		 	try match(BasicLearnParser.Tokens.T__14.rawValue)
		 	setState(203)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__25.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(199)
		 		try match(BasicLearnParser.Tokens.T__25.rawValue)
		 		setState(200)
		 		try match(BasicLearnParser.Tokens.T__14.rawValue)


		 		setState(205)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(206)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(207)
		 	try match(BasicLearnParser.Tokens.T__6.rawValue)
		 	setState(210)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__26.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(208)
		 		try match(BasicLearnParser.Tokens.T__26.rawValue)
		 		setState(209)
		 		try match(BasicLearnParser.Tokens.T__6.rawValue)

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
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
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
		 	setState(212)
		 	try match(BasicLearnParser.Tokens.T__10.rawValue)
		 	setState(213)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(214)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(215)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(216)
		 	try match(BasicLearnParser.Tokens.T__6.rawValue)

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
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
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
		 	setState(218)
		 	try match(BasicLearnParser.Tokens.T__11.rawValue)
		 	setState(219)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(220)
		 	try match(BasicLearnParser.Tokens.T__14.rawValue)
		 	setState(221)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(222)
		 	try match(BasicLearnParser.Tokens.T__6.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class Special_functionContext: ParserRuleContext {
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
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(224)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__27.rawValue,BasicLearnParser.Tokens.T__28.rawValue,BasicLearnParser.Tokens.T__29.rawValue,BasicLearnParser.Tokens.T__30.rawValue,BasicLearnParser.Tokens.T__31.rawValue,BasicLearnParser.Tokens.T__32.rawValue,BasicLearnParser.Tokens.T__33.rawValue,BasicLearnParser.Tokens.T__34.rawValue]
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

	public class ShowContext: ParserRuleContext {
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
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(226)
		 	try match(BasicLearnParser.Tokens.T__30.rawValue)
		 	setState(227)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(228)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__14.rawValue || _la == BasicLearnParser.Tokens.T__35.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(229)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(230)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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
		 	setState(232)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__36.rawValue || _la == BasicLearnParser.Tokens.T__37.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(233)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(234)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(235)
		 	try match(BasicLearnParser.Tokens.T__22.rawValue)
		 	setState(236)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(237)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(238)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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
			func CTE_I() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.CTE_I.rawValue, 0)
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
		 	setState(240)
		 	try match(BasicLearnParser.Tokens.T__38.rawValue)
		 	setState(241)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(242)
		 	try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 	setState(243)
		 	try match(BasicLearnParser.Tokens.T__22.rawValue)
		 	setState(244)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(245)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(246)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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
		 	setState(248)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__39.rawValue,BasicLearnParser.Tokens.T__40.rawValue,BasicLearnParser.Tokens.T__41.rawValue,BasicLearnParser.Tokens.T__42.rawValue,BasicLearnParser.Tokens.T__43.rawValue]
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
		 	setState(249)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(250)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(251)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(252)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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
			func RIGHTPAREN() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.RIGHTPAREN.rawValue, 0)
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
			func CTE_I() -> [TerminalNode] {
				return getTokens(BasicLearnParser.Tokens.CTE_I.rawValue)
			}
			open
			func CTE_I(_ i:Int) -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.CTE_I.rawValue, i)
			}
			open
			func CTE_F() -> [TerminalNode] {
				return getTokens(BasicLearnParser.Tokens.CTE_F.rawValue)
			}
			open
			func CTE_F(_ i:Int) -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.CTE_F.rawValue, i)
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
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(254)
		 	try match(BasicLearnParser.Tokens.T__44.rawValue)
		 	setState(255)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(256)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.ID.rawValue,BasicLearnParser.Tokens.CTE_I.rawValue,BasicLearnParser.Tokens.CTE_F.rawValue]
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
		 	setState(257)
		 	try match(BasicLearnParser.Tokens.T__22.rawValue)
		 	setState(258)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.ID.rawValue,BasicLearnParser.Tokens.CTE_I.rawValue,BasicLearnParser.Tokens.CTE_F.rawValue]
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
		 	setState(259)
		 	try match(BasicLearnParser.Tokens.T__22.rawValue)
		 	setState(260)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.ID.rawValue,BasicLearnParser.Tokens.CTE_I.rawValue,BasicLearnParser.Tokens.CTE_F.rawValue]
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
		 	setState(261)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(262)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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
		 	setState(264)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__45.rawValue || _la == BasicLearnParser.Tokens.T__46.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(265)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(266)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(267)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(268)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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
		 	setState(270)
		 	try match(BasicLearnParser.Tokens.T__47.rawValue)
		 	setState(271)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(272)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(273)
		 	try match(BasicLearnParser.Tokens.T__22.rawValue)
		 	setState(274)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(275)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(276)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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
		 	setState(278)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__48.rawValue,BasicLearnParser.Tokens.T__49.rawValue,BasicLearnParser.Tokens.T__50.rawValue,BasicLearnParser.Tokens.T__51.rawValue]
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
		 	setState(279)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(280)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(281)
		 	try match(BasicLearnParser.Tokens.T__22.rawValue)
		 	setState(282)
		 	try match(BasicLearnParser.Tokens.T__13.rawValue)
		 	setState(283)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(284)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)

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