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
            T__21=22, T__22=23, T__23=24, T__24=25, T__25=26, T__26=27, 
            T__27=28, T__28=29, T__29=30, T__30=31, BOOL=32, LESSTHAN=33, 
            MORETHAN=34, LESSOREQUAL=35, MOREOREQUAL=36, EQUALS=37, NOTEQUALS=38, 
            ASSIGN=39, ADD=40, SUBS=41, MULT=42, DIV=43, LEFTPAREN=44, RIGHTPAREN=45, 
            LEFTBRACKET=46, RIGHTBRACKET=47, LEFTCURL=48, RIGHTCURL=49, 
            NUMBER=50, DECIMAL=51, ID=52, CTE_I=53, CTE_F=54, SENTENCE=55, 
            AND=56, OR=57, BSPACE=58

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
		"T__17", "T__18", "T__19", "T__20", "T__21", "T__22", "T__23", "T__24", 
		"T__25", "T__26", "T__27", "T__28", "T__29", "T__30", "BOOL", "LESSTHAN", 
		"MORETHAN", "LESSOREQUAL", "MOREOREQUAL", "EQUALS", "NOTEQUALS", "ASSIGN", 
		"ADD", "SUBS", "MULT", "DIV", "LEFTPAREN", "RIGHTPAREN", "LEFTBRACKET", 
		"RIGHTBRACKET", "LEFTCURL", "RIGHTCURL", "NUMBER", "DECIMAL", "ID", "CTE_I", 
		"CTE_F", "SENTENCE", "AND", "OR", "BSPACE", "ESC"
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