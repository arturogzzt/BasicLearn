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
                 T__22 = 23, T__23 = 24, ID = 25, CTE_I = 26, CTE_F = 27, 
                 BOOL = 28, LESSTHAN = 29, MORETHAN = 30, LESSOREQUAL = 31, 
                 MOREOREQUAL = 32, EQUALS = 33, NOTEQUALS = 34, ASSIGN = 35, 
                 ADD = 36, SUBS = 37, MULT = 38, DIV = 39, LEFTPAREN = 40, 
                 RIGHTPAREN = 41, LEFTBRACKET = 42, RIGHTBRACKET = 43, LEFTCURL = 44, 
                 RIGHTCURL = 45, NUMBER = 46, DECIMAL = 47, SENTENCE = 48, 
                 AND = 49, OR = 50
	}

	public
	static let RULE_program = 0, RULE_body = 1, RULE_statement = 2, RULE_expression = 3, 
            RULE_exp = 4, RULE_term = 5, RULE_factor = 6, RULE_assignment = 7, 
            RULE_block = 8, RULE_declaration = 9, RULE_type = 10, RULE_function = 11, 
            RULE_function_call = 12, RULE_parameters = 13, RULE_if_statement = 14, 
            RULE_repeat_statement = 15, RULE_while_statement = 16, RULE_logical = 17

	public
	static let ruleNames: [String] = [
		"program", "body", "statement", "expression", "exp", "term", "factor", 
		"assignment", "block", "declaration", "type", "function", "function_call", 
		"parameters", "if_statement", "repeat_statement", "while_statement", "logical"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'program'", "';'", "'declaration'", "'function'", "'body'", "'start'", 
		"'block'", "'expression'", "'function_call'", "'assignment'", "'if'", 
		"'repeat'", "'while'", "'exp'", "'term'", "'factor'", "'expressiom'", 
		"'statement'", "'type'", "','", "'void'", "'parameters'", "'logical'", 
		"'else'", nil, nil, nil, nil, "'<'", "'>'", "'<='", "'>='", "'equal'", 
		"'notEqual'", "'='", "'+'", "'-'", "'*'", "'/'", "'('", "')'", "'['", 
		"']'", "'{'", "'}'", "'number'", "'decimal'", "'sentence'", "'and'", "'or'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
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
		 	setState(36)
		 	try match(BasicLearnParser.Tokens.T__0.rawValue)
		 	setState(37)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(38)
		 	try match(BasicLearnParser.Tokens.T__1.rawValue)
		 	setState(42)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__2.rawValue || _la == BasicLearnParser.Tokens.T__3.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(39)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BasicLearnParser.Tokens.T__2.rawValue || _la == BasicLearnParser.Tokens.T__3.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}


		 		setState(44)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(45)
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
		 	setState(47)
		 	try match(BasicLearnParser.Tokens.T__5.rawValue)
		 	setState(48)
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
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(59) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(59)
		 		try _errHandler.sync(self)
		 		switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .T__7:
		 			setState(50)
		 			try match(BasicLearnParser.Tokens.T__7.rawValue)
		 			setState(51)
		 			try match(BasicLearnParser.Tokens.T__1.rawValue)

		 			break

		 		case .T__8:
		 			setState(52)
		 			try match(BasicLearnParser.Tokens.T__8.rawValue)
		 			setState(53)
		 			try match(BasicLearnParser.Tokens.T__1.rawValue)

		 			break

		 		case .T__9:
		 			setState(54)
		 			try match(BasicLearnParser.Tokens.T__9.rawValue)
		 			setState(55)
		 			try match(BasicLearnParser.Tokens.T__1.rawValue)

		 			break

		 		case .T__10:
		 			setState(56)
		 			try match(BasicLearnParser.Tokens.T__10.rawValue)

		 			break

		 		case .T__11:
		 			setState(57)
		 			try match(BasicLearnParser.Tokens.T__11.rawValue)

		 			break

		 		case .T__12:
		 			setState(58)
		 			try match(BasicLearnParser.Tokens.T__12.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}

		 		setState(61); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BasicLearnParser.Tokens.T__7.rawValue,BasicLearnParser.Tokens.T__8.rawValue,BasicLearnParser.Tokens.T__9.rawValue,BasicLearnParser.Tokens.T__10.rawValue,BasicLearnParser.Tokens.T__11.rawValue,BasicLearnParser.Tokens.T__12.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())

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
			func BOOL() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.BOOL.rawValue, 0)
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
		 	setState(67)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .BOOL:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(63)
		 		try match(BasicLearnParser.Tokens.BOOL.rawValue)

		 		break

		 	case .T__13:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(64)
		 		try match(BasicLearnParser.Tokens.T__13.rawValue)
		 		setState(65)
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
		 		setState(66)
		 		try match(BasicLearnParser.Tokens.T__13.rawValue)

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
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(69)
		 	try match(BasicLearnParser.Tokens.T__14.rawValue)
		 	setState(71)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.ADD.rawValue || _la == BasicLearnParser.Tokens.SUBS.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(70)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BasicLearnParser.Tokens.ADD.rawValue || _la == BasicLearnParser.Tokens.SUBS.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
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
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(73)
		 	try match(BasicLearnParser.Tokens.T__15.rawValue)
		 	setState(75)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.MULT.rawValue || _la == BasicLearnParser.Tokens.DIV.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(74)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BasicLearnParser.Tokens.MULT.rawValue || _la == BasicLearnParser.Tokens.DIV.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
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
		 	setState(86)
		 	try _errHandler.sync(self)
		 	switch (BasicLearnParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LEFTPAREN:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(77)
		 		try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 		setState(78)
		 		try match(BasicLearnParser.Tokens.T__7.rawValue)
		 		setState(79)
		 		try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)

		 		break

		 	case .ID:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(80)
		 		try match(BasicLearnParser.Tokens.ID.rawValue)
		 		setState(81)
		 		try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 		setState(82)
		 		try match(BasicLearnParser.Tokens.T__13.rawValue)
		 		setState(83)
		 		try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 		break

		 	case .CTE_I:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(84)
		 		try match(BasicLearnParser.Tokens.CTE_I.rawValue)

		 		break

		 	case .CTE_F:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(85)
		 		try match(BasicLearnParser.Tokens.CTE_F.rawValue)

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
		 	setState(88)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(92)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.LEFTBRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(89)
		 		try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 		setState(90)
		 		try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 		setState(91)
		 		try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 	}

		 	setState(94)
		 	try match(BasicLearnParser.Tokens.ASSIGN.rawValue)
		 	setState(95)
		 	try match(BasicLearnParser.Tokens.T__16.rawValue)
		 	setState(96)
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
		 	setState(98)
		 	try match(BasicLearnParser.Tokens.LEFTCURL.rawValue)
		 	setState(100) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(99)
		 		try match(BasicLearnParser.Tokens.T__17.rawValue)


		 		setState(102); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__17.rawValue
		 	      return testSet
		 	 }())
		 	setState(104)
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
		 	setState(106)
		 	try match(BasicLearnParser.Tokens.T__18.rawValue)
		 	setState(107)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(111)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.LEFTBRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(108)
		 		try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 		setState(109)
		 		try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 		setState(110)
		 		try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 	}

		 	setState(122)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__19.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(113)
		 		try match(BasicLearnParser.Tokens.T__19.rawValue)
		 		setState(114)
		 		try match(BasicLearnParser.Tokens.ID.rawValue)
		 		setState(118)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BasicLearnParser.Tokens.LEFTBRACKET.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(115)
		 			try match(BasicLearnParser.Tokens.LEFTBRACKET.rawValue)
		 			setState(116)
		 			try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 			setState(117)
		 			try match(BasicLearnParser.Tokens.RIGHTBRACKET.rawValue)

		 		}



		 		setState(124)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(125)
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
		 	setState(127)
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
		 	setState(129)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__18.rawValue || _la == BasicLearnParser.Tokens.T__20.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(130)
		 	try match(BasicLearnParser.Tokens.T__3.rawValue)
		 	setState(131)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(132)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(133)
		 	try match(BasicLearnParser.Tokens.T__21.rawValue)
		 	setState(134)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(138)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__2.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(135)
		 		try match(BasicLearnParser.Tokens.T__2.rawValue)


		 		setState(140)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(141)
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
		 	setState(143)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(144)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(145)
		 	try match(BasicLearnParser.Tokens.T__7.rawValue)
		 	setState(150)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__19.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(146)
		 		try match(BasicLearnParser.Tokens.T__19.rawValue)
		 		setState(147)
		 		try match(BasicLearnParser.Tokens.T__7.rawValue)


		 		setState(152)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(153)
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
		 	setState(155)
		 	try match(BasicLearnParser.Tokens.T__18.rawValue)
		 	setState(156)
		 	try match(BasicLearnParser.Tokens.ID.rawValue)
		 	setState(162)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__19.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(157)
		 		try match(BasicLearnParser.Tokens.T__19.rawValue)
		 		setState(158)
		 		try match(BasicLearnParser.Tokens.T__18.rawValue)
		 		setState(159)
		 		try match(BasicLearnParser.Tokens.ID.rawValue)


		 		setState(164)
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
		 	setState(165)
		 	try match(BasicLearnParser.Tokens.T__10.rawValue)
		 	setState(166)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(167)
		 	try match(BasicLearnParser.Tokens.T__7.rawValue)
		 	setState(172)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__22.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(168)
		 		try match(BasicLearnParser.Tokens.T__22.rawValue)
		 		setState(169)
		 		try match(BasicLearnParser.Tokens.T__7.rawValue)


		 		setState(174)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(175)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(176)
		 	try match(BasicLearnParser.Tokens.T__6.rawValue)
		 	setState(179)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__23.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(177)
		 		try match(BasicLearnParser.Tokens.T__23.rawValue)
		 		setState(178)
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
			func CTE_I() -> TerminalNode? {
				return getToken(BasicLearnParser.Tokens.CTE_I.rawValue, 0)
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
		 	setState(181)
		 	try match(BasicLearnParser.Tokens.T__11.rawValue)
		 	setState(182)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(183)
		 	try match(BasicLearnParser.Tokens.CTE_I.rawValue)
		 	setState(184)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(185)
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
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(187)
		 	try match(BasicLearnParser.Tokens.T__12.rawValue)
		 	setState(188)
		 	try match(BasicLearnParser.Tokens.LEFTPAREN.rawValue)
		 	setState(189)
		 	try match(BasicLearnParser.Tokens.T__7.rawValue)
		 	setState(194)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BasicLearnParser.Tokens.T__22.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(190)
		 		try match(BasicLearnParser.Tokens.T__22.rawValue)
		 		setState(191)
		 		try match(BasicLearnParser.Tokens.T__7.rawValue)


		 		setState(196)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(197)
		 	try match(BasicLearnParser.Tokens.RIGHTPAREN.rawValue)
		 	setState(198)
		 	try match(BasicLearnParser.Tokens.T__6.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LogicalContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return BasicLearnParser.RULE_logical
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.enterLogical(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BasicLearnListener {
				listener.exitLogical(self)
			}
		}
	}
	@discardableResult
	 open func logical() throws -> LogicalContext {
		var _localctx: LogicalContext = LogicalContext(_ctx, getState())
		try enterRule(_localctx, 34, BasicLearnParser.RULE_logical)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(200)
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