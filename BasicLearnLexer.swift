// Generated from BasicLearn.g4 by ANTLR 4.7.1
import Antlr4

open class BasicLearnLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = BasicLearnLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(BasicLearnLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, 
            T__8=9, T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, 
            T__15=16, T__16=17, T__17=18, T__18=19, T__19=20, T__20=21, 
            T__21=22, T__22=23, T__23=24, ID=25, CTE_I=26, CTE_F=27, BOOL=28, 
            LESSTHAN=29, MORETHAN=30, LESSOREQUAL=31, MOREOREQUAL=32, EQUALS=33, 
            NOTEQUALS=34, ASSIGN=35, ADD=36, SUBS=37, MULT=38, DIV=39, LEFTPAREN=40, 
            RIGHTPAREN=41, LEFTBRACKET=42, RIGHTBRACKET=43, LEFTCURL=44, 
            RIGHTCURL=45, NUMBER=46, DECIMAL=47, SENTENCE=48, AND=49, OR=50

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
		"T__9", "T__10", "T__11", "T__12", "T__13", "T__14", "T__15", "T__16", 
		"T__17", "T__18", "T__19", "T__20", "T__21", "T__22", "T__23", "ID", "CTE_I", 
		"CTE_F", "BOOL", "LESSTHAN", "MORETHAN", "LESSOREQUAL", "MOREOREQUAL", 
		"EQUALS", "NOTEQUALS", "ASSIGN", "ADD", "SUBS", "MULT", "DIV", "LEFTPAREN", 
		"RIGHTPAREN", "LEFTBRACKET", "RIGHTBRACKET", "LEFTCURL", "RIGHTCURL", 
		"NUMBER", "DECIMAL", "SENTENCE", "AND", "OR"
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
	func getVocabulary() -> Vocabulary {
		return BasicLearnLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, BasicLearnLexer._ATN, BasicLearnLexer._decisionToDFA, BasicLearnLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "BasicLearn.g4" }

	override open
	func getRuleNames() -> [String] { return BasicLearnLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return BasicLearnLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return BasicLearnLexer.channelNames }

	override open
	func getModeNames() -> [String] { return BasicLearnLexer.modeNames }

	override open
	func getATN() -> ATN { return BasicLearnLexer._ATN }


	public
	static let _serializedATN: String = BasicLearnLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}