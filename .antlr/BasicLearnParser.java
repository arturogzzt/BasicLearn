// Generated from /Users/arturogonzalez/Workspace/BasicLearn/BasicLearn.g4 by ANTLR 4.7.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class BasicLearnParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, T__32=33, T__33=34, T__34=35, T__35=36, T__36=37, T__37=38, 
		T__38=39, T__39=40, T__40=41, T__41=42, T__42=43, T__43=44, T__44=45, 
		T__45=46, T__46=47, T__47=48, T__48=49, T__49=50, T__50=51, T__51=52, 
		ID=53, CTE_I=54, CTE_F=55, BOOL=56, LESSTHAN=57, MORETHAN=58, LESSOREQUAL=59, 
		MOREOREQUAL=60, EQUALS=61, NOTEQUALS=62, ASSIGN=63, ADD=64, SUBS=65, MULT=66, 
		DIV=67, LEFTPAREN=68, RIGHTPAREN=69, LEFTBRACKET=70, RIGHTBRACKET=71, 
		LEFTCURL=72, RIGHTCURL=73, NUMBER=74, DECIMAL=75, SENTENCE=76, AND=77, 
		OR=78;
	public static final int
		RULE_program = 0, RULE_body = 1, RULE_statement = 2, RULE_expression = 3, 
		RULE_exp = 4, RULE_term = 5, RULE_factor = 6, RULE_assignment = 7, RULE_block = 8, 
		RULE_declaration = 9, RULE_type = 10, RULE_function = 11, RULE_function_call = 12, 
		RULE_parameters = 13, RULE_if_statement = 14, RULE_repeat_statement = 15, 
		RULE_while_statement = 16, RULE_special_function = 17, RULE_show = 18, 
		RULE_pythagoras = 19, RULE_list_select = 20, RULE_list_functions = 21, 
		RULE_perimeter_tri = 22, RULE_square_root_absolute = 23, RULE_area_tri = 24, 
		RULE_square = 25;
	public static final String[] ruleNames = {
		"program", "body", "statement", "expression", "exp", "term", "factor", 
		"assignment", "block", "declaration", "type", "function", "function_call", 
		"parameters", "if_statement", "repeat_statement", "while_statement", "special_function", 
		"show", "pythagoras", "list_select", "list_functions", "perimeter_tri", 
		"square_root_absolute", "area_tri", "square"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'program'", "';'", "'declaration'", "'function'", "'body'", "'start'", 
		"'block'", "'function_call'", "'assignment'", "'if'", "'repeat'", "'while'", 
		"'special_functions'", "'exp'", "'expression'", "'term'", "'factor'", 
		"'true'", "'false'", "'expressiom'", "'statement'", "'type'", "','", "'void'", 
		"'parameters'", "'logical'", "'else'", "'area_tri'", "'perimeter_tri'", 
		"'list_select'", "'show'", "'pythagoras'", "'listfunctions'", "'square_root_absolute'", 
		"'square'", "'cte_string'", "'pythagorasHyp'", "'pythagorasSide'", "'select'", 
		"'first'", "'last'", "'order'", "'orderDesc'", "'size'", "'perimeterTri'", 
		"'square_root'", "'absolute'", "'areaTri'", "'perimeterRec'", "'perimeterSq'", 
		"'areaSq'", "'areaRec'", null, null, null, null, "'<'", "'>'", "'<='", 
		"'>='", "'equal'", "'notEqual'", "'='", "'+'", "'-'", "'*'", "'/'", "'('", 
		"')'", "'['", "']'", "'{'", "'}'", "'number'", "'decimal'", "'sentence'", 
		"'and'", "'or'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, "ID", "CTE_I", "CTE_F", "BOOL", "LESSTHAN", 
		"MORETHAN", "LESSOREQUAL", "MOREOREQUAL", "EQUALS", "NOTEQUALS", "ASSIGN", 
		"ADD", "SUBS", "MULT", "DIV", "LEFTPAREN", "RIGHTPAREN", "LEFTBRACKET", 
		"RIGHTBRACKET", "LEFTCURL", "RIGHTCURL", "NUMBER", "DECIMAL", "SENTENCE", 
		"AND", "OR"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "BasicLearn.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public BasicLearnParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(BasicLearnParser.ID, 0); }
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(52);
			match(T__0);
			setState(53);
			match(ID);
			setState(54);
			match(T__1);
			setState(58);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__2) {
				{
				{
				setState(55);
				match(T__2);
				}
				}
				setState(60);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(64);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__3) {
				{
				{
				setState(61);
				match(T__3);
				}
				}
				setState(66);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(67);
			match(T__4);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BodyContext extends ParserRuleContext {
		public BodyContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_body; }
	}

	public final BodyContext body() throws RecognitionException {
		BodyContext _localctx = new BodyContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_body);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(69);
			match(T__5);
			setState(70);
			match(T__6);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StatementContext extends ParserRuleContext {
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_statement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(80);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__7:
				{
				setState(72);
				match(T__7);
				setState(73);
				match(T__1);
				}
				break;
			case T__8:
				{
				setState(74);
				match(T__8);
				setState(75);
				match(T__1);
				}
				break;
			case T__9:
				{
				setState(76);
				match(T__9);
				}
				break;
			case T__10:
				{
				setState(77);
				match(T__10);
				}
				break;
			case T__11:
				{
				setState(78);
				match(T__11);
				}
				break;
			case T__12:
				{
				setState(79);
				match(T__12);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpressionContext extends ParserRuleContext {
		public TerminalNode LESSTHAN() { return getToken(BasicLearnParser.LESSTHAN, 0); }
		public TerminalNode MORETHAN() { return getToken(BasicLearnParser.MORETHAN, 0); }
		public TerminalNode LESSOREQUAL() { return getToken(BasicLearnParser.LESSOREQUAL, 0); }
		public TerminalNode MOREOREQUAL() { return getToken(BasicLearnParser.MOREOREQUAL, 0); }
		public TerminalNode EQUALS() { return getToken(BasicLearnParser.EQUALS, 0); }
		public TerminalNode NOTEQUALS() { return getToken(BasicLearnParser.NOTEQUALS, 0); }
		public TerminalNode ASSIGN() { return getToken(BasicLearnParser.ASSIGN, 0); }
		public ExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression; }
	}

	public final ExpressionContext expression() throws RecognitionException {
		ExpressionContext _localctx = new ExpressionContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_expression);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(82);
			match(T__13);
			setState(83);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << LESSTHAN) | (1L << MORETHAN) | (1L << LESSOREQUAL) | (1L << MOREOREQUAL) | (1L << EQUALS) | (1L << NOTEQUALS) | (1L << ASSIGN))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(84);
			match(T__13);
			setState(87);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==AND || _la==OR) {
				{
				setState(85);
				_la = _input.LA(1);
				if ( !(_la==AND || _la==OR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(86);
				match(T__14);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpContext extends ParserRuleContext {
		public TerminalNode ADD() { return getToken(BasicLearnParser.ADD, 0); }
		public TerminalNode SUBS() { return getToken(BasicLearnParser.SUBS, 0); }
		public ExpContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_exp; }
	}

	public final ExpContext exp() throws RecognitionException {
		ExpContext _localctx = new ExpContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_exp);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(89);
			match(T__15);
			setState(93);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case ADD:
				{
				setState(90);
				match(ADD);
				}
				break;
			case SUBS:
				{
				setState(91);
				match(SUBS);
				setState(92);
				match(T__13);
				}
				break;
			case EOF:
				break;
			default:
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TermContext extends ParserRuleContext {
		public TerminalNode MULT() { return getToken(BasicLearnParser.MULT, 0); }
		public TerminalNode DIV() { return getToken(BasicLearnParser.DIV, 0); }
		public TermContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_term; }
	}

	public final TermContext term() throws RecognitionException {
		TermContext _localctx = new TermContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_term);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(95);
			match(T__16);
			setState(99);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case MULT:
				{
				setState(96);
				match(MULT);
				}
				break;
			case DIV:
				{
				setState(97);
				match(DIV);
				setState(98);
				match(T__15);
				}
				break;
			case EOF:
				break;
			default:
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FactorContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public TerminalNode ID() { return getToken(BasicLearnParser.ID, 0); }
		public TerminalNode LEFTBRACKET() { return getToken(BasicLearnParser.LEFTBRACKET, 0); }
		public TerminalNode RIGHTBRACKET() { return getToken(BasicLearnParser.RIGHTBRACKET, 0); }
		public TerminalNode CTE_I() { return getToken(BasicLearnParser.CTE_I, 0); }
		public TerminalNode CTE_F() { return getToken(BasicLearnParser.CTE_F, 0); }
		public FactorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_factor; }
	}

	public final FactorContext factor() throws RecognitionException {
		FactorContext _localctx = new FactorContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_factor);
		try {
			setState(117);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LEFTPAREN:
				enterOuterAlt(_localctx, 1);
				{
				setState(101);
				match(LEFTPAREN);
				setState(102);
				match(T__14);
				setState(103);
				match(RIGHTPAREN);
				}
				break;
			case ID:
				enterOuterAlt(_localctx, 2);
				{
				setState(104);
				match(ID);
				setState(111);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case LEFTBRACKET:
					{
					setState(105);
					match(LEFTBRACKET);
					setState(106);
					match(T__13);
					setState(107);
					match(RIGHTBRACKET);
					}
					break;
				case LEFTPAREN:
					{
					setState(108);
					match(LEFTPAREN);
					setState(109);
					match(T__13);
					setState(110);
					match(RIGHTPAREN);
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				}
				break;
			case CTE_I:
				enterOuterAlt(_localctx, 3);
				{
				setState(113);
				match(CTE_I);
				}
				break;
			case CTE_F:
				enterOuterAlt(_localctx, 4);
				{
				setState(114);
				match(CTE_F);
				}
				break;
			case T__17:
				enterOuterAlt(_localctx, 5);
				{
				setState(115);
				match(T__17);
				}
				break;
			case T__18:
				enterOuterAlt(_localctx, 6);
				{
				setState(116);
				match(T__18);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class AssignmentContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(BasicLearnParser.ID, 0); }
		public TerminalNode ASSIGN() { return getToken(BasicLearnParser.ASSIGN, 0); }
		public TerminalNode LEFTBRACKET() { return getToken(BasicLearnParser.LEFTBRACKET, 0); }
		public TerminalNode CTE_I() { return getToken(BasicLearnParser.CTE_I, 0); }
		public TerminalNode RIGHTBRACKET() { return getToken(BasicLearnParser.RIGHTBRACKET, 0); }
		public AssignmentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_assignment; }
	}

	public final AssignmentContext assignment() throws RecognitionException {
		AssignmentContext _localctx = new AssignmentContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_assignment);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(119);
			match(ID);
			setState(123);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==LEFTBRACKET) {
				{
				setState(120);
				match(LEFTBRACKET);
				setState(121);
				match(CTE_I);
				setState(122);
				match(RIGHTBRACKET);
				}
			}

			setState(125);
			match(ASSIGN);
			setState(126);
			match(T__19);
			setState(127);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlockContext extends ParserRuleContext {
		public TerminalNode LEFTCURL() { return getToken(BasicLearnParser.LEFTCURL, 0); }
		public TerminalNode RIGHTCURL() { return getToken(BasicLearnParser.RIGHTCURL, 0); }
		public BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block; }
	}

	public final BlockContext block() throws RecognitionException {
		BlockContext _localctx = new BlockContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_block);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(129);
			match(LEFTCURL);
			setState(131); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(130);
				match(T__20);
				}
				}
				setState(133); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==T__20 );
			setState(135);
			match(RIGHTCURL);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DeclarationContext extends ParserRuleContext {
		public List<TerminalNode> ID() { return getTokens(BasicLearnParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(BasicLearnParser.ID, i);
		}
		public List<TerminalNode> LEFTBRACKET() { return getTokens(BasicLearnParser.LEFTBRACKET); }
		public TerminalNode LEFTBRACKET(int i) {
			return getToken(BasicLearnParser.LEFTBRACKET, i);
		}
		public List<TerminalNode> CTE_I() { return getTokens(BasicLearnParser.CTE_I); }
		public TerminalNode CTE_I(int i) {
			return getToken(BasicLearnParser.CTE_I, i);
		}
		public List<TerminalNode> RIGHTBRACKET() { return getTokens(BasicLearnParser.RIGHTBRACKET); }
		public TerminalNode RIGHTBRACKET(int i) {
			return getToken(BasicLearnParser.RIGHTBRACKET, i);
		}
		public DeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_declaration; }
	}

	public final DeclarationContext declaration() throws RecognitionException {
		DeclarationContext _localctx = new DeclarationContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_declaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(137);
			match(T__21);
			setState(138);
			match(ID);
			setState(142);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==LEFTBRACKET) {
				{
				setState(139);
				match(LEFTBRACKET);
				setState(140);
				match(CTE_I);
				setState(141);
				match(RIGHTBRACKET);
				}
			}

			setState(153);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__22) {
				{
				{
				setState(144);
				match(T__22);
				setState(145);
				match(ID);
				setState(149);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==LEFTBRACKET) {
					{
					setState(146);
					match(LEFTBRACKET);
					setState(147);
					match(CTE_I);
					setState(148);
					match(RIGHTBRACKET);
					}
				}

				}
				}
				setState(155);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(156);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TypeContext extends ParserRuleContext {
		public TerminalNode NUMBER() { return getToken(BasicLearnParser.NUMBER, 0); }
		public TerminalNode DECIMAL() { return getToken(BasicLearnParser.DECIMAL, 0); }
		public TerminalNode BOOL() { return getToken(BasicLearnParser.BOOL, 0); }
		public TerminalNode SENTENCE() { return getToken(BasicLearnParser.SENTENCE, 0); }
		public TypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_type; }
	}

	public final TypeContext type() throws RecognitionException {
		TypeContext _localctx = new TypeContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_type);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(158);
			_la = _input.LA(1);
			if ( !(((((_la - 56)) & ~0x3f) == 0 && ((1L << (_la - 56)) & ((1L << (BOOL - 56)) | (1L << (NUMBER - 56)) | (1L << (DECIMAL - 56)) | (1L << (SENTENCE - 56)))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FunctionContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(BasicLearnParser.ID, 0); }
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public FunctionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_function; }
	}

	public final FunctionContext function() throws RecognitionException {
		FunctionContext _localctx = new FunctionContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_function);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(160);
			_la = _input.LA(1);
			if ( !(_la==T__21 || _la==T__23) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(161);
			match(T__3);
			setState(162);
			match(ID);
			setState(163);
			match(LEFTPAREN);
			setState(164);
			match(T__24);
			setState(165);
			match(RIGHTPAREN);
			setState(169);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__2) {
				{
				{
				setState(166);
				match(T__2);
				}
				}
				setState(171);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(172);
			match(T__6);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Function_callContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(BasicLearnParser.ID, 0); }
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public Function_callContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_function_call; }
	}

	public final Function_callContext function_call() throws RecognitionException {
		Function_callContext _localctx = new Function_callContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_function_call);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(174);
			match(ID);
			setState(175);
			match(LEFTPAREN);
			setState(176);
			match(T__14);
			setState(181);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__22) {
				{
				{
				setState(177);
				match(T__22);
				setState(178);
				match(T__14);
				}
				}
				setState(183);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(184);
			match(RIGHTPAREN);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParametersContext extends ParserRuleContext {
		public List<TerminalNode> ID() { return getTokens(BasicLearnParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(BasicLearnParser.ID, i);
		}
		public ParametersContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_parameters; }
	}

	public final ParametersContext parameters() throws RecognitionException {
		ParametersContext _localctx = new ParametersContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_parameters);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(186);
			match(T__21);
			setState(187);
			match(ID);
			setState(193);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__22) {
				{
				{
				setState(188);
				match(T__22);
				setState(189);
				match(T__21);
				setState(190);
				match(ID);
				}
				}
				setState(195);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class If_statementContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public If_statementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_if_statement; }
	}

	public final If_statementContext if_statement() throws RecognitionException {
		If_statementContext _localctx = new If_statementContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_if_statement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(196);
			match(T__9);
			setState(197);
			match(LEFTPAREN);
			setState(198);
			match(T__14);
			setState(203);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__25) {
				{
				{
				setState(199);
				match(T__25);
				setState(200);
				match(T__14);
				}
				}
				setState(205);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(206);
			match(RIGHTPAREN);
			setState(207);
			match(T__6);
			setState(210);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__26) {
				{
				setState(208);
				match(T__26);
				setState(209);
				match(T__6);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Repeat_statementContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public Repeat_statementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_repeat_statement; }
	}

	public final Repeat_statementContext repeat_statement() throws RecognitionException {
		Repeat_statementContext _localctx = new Repeat_statementContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_repeat_statement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(212);
			match(T__10);
			setState(213);
			match(LEFTPAREN);
			setState(214);
			match(T__13);
			setState(215);
			match(RIGHTPAREN);
			setState(216);
			match(T__6);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class While_statementContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public While_statementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_while_statement; }
	}

	public final While_statementContext while_statement() throws RecognitionException {
		While_statementContext _localctx = new While_statementContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_while_statement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(218);
			match(T__11);
			setState(219);
			match(LEFTPAREN);
			setState(220);
			match(T__14);
			setState(221);
			match(RIGHTPAREN);
			setState(222);
			match(T__6);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Special_functionContext extends ParserRuleContext {
		public Special_functionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_special_function; }
	}

	public final Special_functionContext special_function() throws RecognitionException {
		Special_functionContext _localctx = new Special_functionContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_special_function);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(224);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__30) | (1L << T__31) | (1L << T__32) | (1L << T__33) | (1L << T__34))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ShowContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public ShowContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_show; }
	}

	public final ShowContext show() throws RecognitionException {
		ShowContext _localctx = new ShowContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_show);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(226);
			match(T__30);
			setState(227);
			match(LEFTPAREN);
			setState(228);
			_la = _input.LA(1);
			if ( !(_la==T__14 || _la==T__35) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(229);
			match(RIGHTPAREN);
			setState(230);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class PythagorasContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public PythagorasContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_pythagoras; }
	}

	public final PythagorasContext pythagoras() throws RecognitionException {
		PythagorasContext _localctx = new PythagorasContext(_ctx, getState());
		enterRule(_localctx, 38, RULE_pythagoras);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(232);
			_la = _input.LA(1);
			if ( !(_la==T__36 || _la==T__37) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(233);
			match(LEFTPAREN);
			setState(234);
			match(T__13);
			setState(235);
			match(T__22);
			setState(236);
			match(T__13);
			setState(237);
			match(RIGHTPAREN);
			setState(238);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class List_selectContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode CTE_I() { return getToken(BasicLearnParser.CTE_I, 0); }
		public TerminalNode ID() { return getToken(BasicLearnParser.ID, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public List_selectContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_list_select; }
	}

	public final List_selectContext list_select() throws RecognitionException {
		List_selectContext _localctx = new List_selectContext(_ctx, getState());
		enterRule(_localctx, 40, RULE_list_select);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(240);
			match(T__38);
			setState(241);
			match(LEFTPAREN);
			setState(242);
			match(CTE_I);
			setState(243);
			match(T__22);
			setState(244);
			match(ID);
			setState(245);
			match(RIGHTPAREN);
			setState(246);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class List_functionsContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode ID() { return getToken(BasicLearnParser.ID, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public List_functionsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_list_functions; }
	}

	public final List_functionsContext list_functions() throws RecognitionException {
		List_functionsContext _localctx = new List_functionsContext(_ctx, getState());
		enterRule(_localctx, 42, RULE_list_functions);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(248);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__39) | (1L << T__40) | (1L << T__41) | (1L << T__42) | (1L << T__43))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(249);
			match(LEFTPAREN);
			setState(250);
			match(ID);
			setState(251);
			match(RIGHTPAREN);
			setState(252);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Perimeter_triContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public List<TerminalNode> ID() { return getTokens(BasicLearnParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(BasicLearnParser.ID, i);
		}
		public List<TerminalNode> CTE_I() { return getTokens(BasicLearnParser.CTE_I); }
		public TerminalNode CTE_I(int i) {
			return getToken(BasicLearnParser.CTE_I, i);
		}
		public List<TerminalNode> CTE_F() { return getTokens(BasicLearnParser.CTE_F); }
		public TerminalNode CTE_F(int i) {
			return getToken(BasicLearnParser.CTE_F, i);
		}
		public Perimeter_triContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_perimeter_tri; }
	}

	public final Perimeter_triContext perimeter_tri() throws RecognitionException {
		Perimeter_triContext _localctx = new Perimeter_triContext(_ctx, getState());
		enterRule(_localctx, 44, RULE_perimeter_tri);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(254);
			match(T__44);
			setState(255);
			match(LEFTPAREN);
			setState(256);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ID) | (1L << CTE_I) | (1L << CTE_F))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(257);
			match(T__22);
			setState(258);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ID) | (1L << CTE_I) | (1L << CTE_F))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(259);
			match(T__22);
			setState(260);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ID) | (1L << CTE_I) | (1L << CTE_F))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(261);
			match(RIGHTPAREN);
			setState(262);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Square_root_absoluteContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public Square_root_absoluteContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_square_root_absolute; }
	}

	public final Square_root_absoluteContext square_root_absolute() throws RecognitionException {
		Square_root_absoluteContext _localctx = new Square_root_absoluteContext(_ctx, getState());
		enterRule(_localctx, 46, RULE_square_root_absolute);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(264);
			_la = _input.LA(1);
			if ( !(_la==T__45 || _la==T__46) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(265);
			match(LEFTPAREN);
			setState(266);
			match(T__13);
			setState(267);
			match(RIGHTPAREN);
			setState(268);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Area_triContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public Area_triContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_area_tri; }
	}

	public final Area_triContext area_tri() throws RecognitionException {
		Area_triContext _localctx = new Area_triContext(_ctx, getState());
		enterRule(_localctx, 48, RULE_area_tri);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(270);
			match(T__47);
			setState(271);
			match(LEFTPAREN);
			setState(272);
			match(T__13);
			setState(273);
			match(T__22);
			setState(274);
			match(T__13);
			setState(275);
			match(RIGHTPAREN);
			setState(276);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class SquareContext extends ParserRuleContext {
		public TerminalNode LEFTPAREN() { return getToken(BasicLearnParser.LEFTPAREN, 0); }
		public TerminalNode RIGHTPAREN() { return getToken(BasicLearnParser.RIGHTPAREN, 0); }
		public SquareContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_square; }
	}

	public final SquareContext square() throws RecognitionException {
		SquareContext _localctx = new SquareContext(_ctx, getState());
		enterRule(_localctx, 50, RULE_square);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(278);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(279);
			match(LEFTPAREN);
			setState(280);
			match(T__13);
			setState(281);
			match(T__22);
			setState(282);
			match(T__13);
			setState(283);
			match(RIGHTPAREN);
			setState(284);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3P\u0121\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\3\2\3\2\3\2\3\2\7\2;\n\2\f\2\16\2>\13\2\3\2\7\2A"+
		"\n\2\f\2\16\2D\13\2\3\2\3\2\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3"+
		"\4\5\4S\n\4\3\5\3\5\3\5\3\5\3\5\5\5Z\n\5\3\6\3\6\3\6\3\6\5\6`\n\6\3\7"+
		"\3\7\3\7\3\7\5\7f\n\7\3\b\3\b\3\b\3\b\3\b\3\b\3\b\3\b\3\b\3\b\5\br\n\b"+
		"\3\b\3\b\3\b\3\b\5\bx\n\b\3\t\3\t\3\t\3\t\5\t~\n\t\3\t\3\t\3\t\3\t\3\n"+
		"\3\n\6\n\u0086\n\n\r\n\16\n\u0087\3\n\3\n\3\13\3\13\3\13\3\13\3\13\5\13"+
		"\u0091\n\13\3\13\3\13\3\13\3\13\3\13\5\13\u0098\n\13\7\13\u009a\n\13\f"+
		"\13\16\13\u009d\13\13\3\13\3\13\3\f\3\f\3\r\3\r\3\r\3\r\3\r\3\r\3\r\7"+
		"\r\u00aa\n\r\f\r\16\r\u00ad\13\r\3\r\3\r\3\16\3\16\3\16\3\16\3\16\7\16"+
		"\u00b6\n\16\f\16\16\16\u00b9\13\16\3\16\3\16\3\17\3\17\3\17\3\17\3\17"+
		"\7\17\u00c2\n\17\f\17\16\17\u00c5\13\17\3\20\3\20\3\20\3\20\3\20\7\20"+
		"\u00cc\n\20\f\20\16\20\u00cf\13\20\3\20\3\20\3\20\3\20\5\20\u00d5\n\20"+
		"\3\21\3\21\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3\22\3\22\3\22\3\23\3\23"+
		"\3\24\3\24\3\24\3\24\3\24\3\24\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25"+
		"\3\26\3\26\3\26\3\26\3\26\3\26\3\26\3\26\3\27\3\27\3\27\3\27\3\27\3\27"+
		"\3\30\3\30\3\30\3\30\3\30\3\30\3\30\3\30\3\30\3\30\3\31\3\31\3\31\3\31"+
		"\3\31\3\31\3\32\3\32\3\32\3\32\3\32\3\32\3\32\3\32\3\33\3\33\3\33\3\33"+
		"\3\33\3\33\3\33\3\33\3\33\2\2\34\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36"+
		" \"$&(*,.\60\62\64\2\r\3\2;A\3\2OP\4\2::LN\4\2\30\30\32\32\3\2\36%\4\2"+
		"\21\21&&\3\2\'(\3\2*.\3\2\679\3\2\60\61\3\2\63\66\2\u0122\2\66\3\2\2\2"+
		"\4G\3\2\2\2\6R\3\2\2\2\bT\3\2\2\2\n[\3\2\2\2\fa\3\2\2\2\16w\3\2\2\2\20"+
		"y\3\2\2\2\22\u0083\3\2\2\2\24\u008b\3\2\2\2\26\u00a0\3\2\2\2\30\u00a2"+
		"\3\2\2\2\32\u00b0\3\2\2\2\34\u00bc\3\2\2\2\36\u00c6\3\2\2\2 \u00d6\3\2"+
		"\2\2\"\u00dc\3\2\2\2$\u00e2\3\2\2\2&\u00e4\3\2\2\2(\u00ea\3\2\2\2*\u00f2"+
		"\3\2\2\2,\u00fa\3\2\2\2.\u0100\3\2\2\2\60\u010a\3\2\2\2\62\u0110\3\2\2"+
		"\2\64\u0118\3\2\2\2\66\67\7\3\2\2\678\7\67\2\28<\7\4\2\29;\7\5\2\2:9\3"+
		"\2\2\2;>\3\2\2\2<:\3\2\2\2<=\3\2\2\2=B\3\2\2\2><\3\2\2\2?A\7\6\2\2@?\3"+
		"\2\2\2AD\3\2\2\2B@\3\2\2\2BC\3\2\2\2CE\3\2\2\2DB\3\2\2\2EF\7\7\2\2F\3"+
		"\3\2\2\2GH\7\b\2\2HI\7\t\2\2I\5\3\2\2\2JK\7\n\2\2KS\7\4\2\2LM\7\13\2\2"+
		"MS\7\4\2\2NS\7\f\2\2OS\7\r\2\2PS\7\16\2\2QS\7\17\2\2RJ\3\2\2\2RL\3\2\2"+
		"\2RN\3\2\2\2RO\3\2\2\2RP\3\2\2\2RQ\3\2\2\2S\7\3\2\2\2TU\7\20\2\2UV\t\2"+
		"\2\2VY\7\20\2\2WX\t\3\2\2XZ\7\21\2\2YW\3\2\2\2YZ\3\2\2\2Z\t\3\2\2\2[_"+
		"\7\22\2\2\\`\7B\2\2]^\7C\2\2^`\7\20\2\2_\\\3\2\2\2_]\3\2\2\2_`\3\2\2\2"+
		"`\13\3\2\2\2ae\7\23\2\2bf\7D\2\2cd\7E\2\2df\7\22\2\2eb\3\2\2\2ec\3\2\2"+
		"\2ef\3\2\2\2f\r\3\2\2\2gh\7F\2\2hi\7\21\2\2ix\7G\2\2jq\7\67\2\2kl\7H\2"+
		"\2lm\7\20\2\2mr\7I\2\2no\7F\2\2op\7\20\2\2pr\7G\2\2qk\3\2\2\2qn\3\2\2"+
		"\2rx\3\2\2\2sx\78\2\2tx\79\2\2ux\7\24\2\2vx\7\25\2\2wg\3\2\2\2wj\3\2\2"+
		"\2ws\3\2\2\2wt\3\2\2\2wu\3\2\2\2wv\3\2\2\2x\17\3\2\2\2y}\7\67\2\2z{\7"+
		"H\2\2{|\78\2\2|~\7I\2\2}z\3\2\2\2}~\3\2\2\2~\177\3\2\2\2\177\u0080\7A"+
		"\2\2\u0080\u0081\7\26\2\2\u0081\u0082\7\4\2\2\u0082\21\3\2\2\2\u0083\u0085"+
		"\7J\2\2\u0084\u0086\7\27\2\2\u0085\u0084\3\2\2\2\u0086\u0087\3\2\2\2\u0087"+
		"\u0085\3\2\2\2\u0087\u0088\3\2\2\2\u0088\u0089\3\2\2\2\u0089\u008a\7K"+
		"\2\2\u008a\23\3\2\2\2\u008b\u008c\7\30\2\2\u008c\u0090\7\67\2\2\u008d"+
		"\u008e\7H\2\2\u008e\u008f\78\2\2\u008f\u0091\7I\2\2\u0090\u008d\3\2\2"+
		"\2\u0090\u0091\3\2\2\2\u0091\u009b\3\2\2\2\u0092\u0093\7\31\2\2\u0093"+
		"\u0097\7\67\2\2\u0094\u0095\7H\2\2\u0095\u0096\78\2\2\u0096\u0098\7I\2"+
		"\2\u0097\u0094\3\2\2\2\u0097\u0098\3\2\2\2\u0098\u009a\3\2\2\2\u0099\u0092"+
		"\3\2\2\2\u009a\u009d\3\2\2\2\u009b\u0099\3\2\2\2\u009b\u009c\3\2\2\2\u009c"+
		"\u009e\3\2\2\2\u009d\u009b\3\2\2\2\u009e\u009f\7\4\2\2\u009f\25\3\2\2"+
		"\2\u00a0\u00a1\t\4\2\2\u00a1\27\3\2\2\2\u00a2\u00a3\t\5\2\2\u00a3\u00a4"+
		"\7\6\2\2\u00a4\u00a5\7\67\2\2\u00a5\u00a6\7F\2\2\u00a6\u00a7\7\33\2\2"+
		"\u00a7\u00ab\7G\2\2\u00a8\u00aa\7\5\2\2\u00a9\u00a8\3\2\2\2\u00aa\u00ad"+
		"\3\2\2\2\u00ab\u00a9\3\2\2\2\u00ab\u00ac\3\2\2\2\u00ac\u00ae\3\2\2\2\u00ad"+
		"\u00ab\3\2\2\2\u00ae\u00af\7\t\2\2\u00af\31\3\2\2\2\u00b0\u00b1\7\67\2"+
		"\2\u00b1\u00b2\7F\2\2\u00b2\u00b7\7\21\2\2\u00b3\u00b4\7\31\2\2\u00b4"+
		"\u00b6\7\21\2\2\u00b5\u00b3\3\2\2\2\u00b6\u00b9\3\2\2\2\u00b7\u00b5\3"+
		"\2\2\2\u00b7\u00b8\3\2\2\2\u00b8\u00ba\3\2\2\2\u00b9\u00b7\3\2\2\2\u00ba"+
		"\u00bb\7G\2\2\u00bb\33\3\2\2\2\u00bc\u00bd\7\30\2\2\u00bd\u00c3\7\67\2"+
		"\2\u00be\u00bf\7\31\2\2\u00bf\u00c0\7\30\2\2\u00c0\u00c2\7\67\2\2\u00c1"+
		"\u00be\3\2\2\2\u00c2\u00c5\3\2\2\2\u00c3\u00c1\3\2\2\2\u00c3\u00c4\3\2"+
		"\2\2\u00c4\35\3\2\2\2\u00c5\u00c3\3\2\2\2\u00c6\u00c7\7\f\2\2\u00c7\u00c8"+
		"\7F\2\2\u00c8\u00cd\7\21\2\2\u00c9\u00ca\7\34\2\2\u00ca\u00cc\7\21\2\2"+
		"\u00cb\u00c9\3\2\2\2\u00cc\u00cf\3\2\2\2\u00cd\u00cb\3\2\2\2\u00cd\u00ce"+
		"\3\2\2\2\u00ce\u00d0\3\2\2\2\u00cf\u00cd\3\2\2\2\u00d0\u00d1\7G\2\2\u00d1"+
		"\u00d4\7\t\2\2\u00d2\u00d3\7\35\2\2\u00d3\u00d5\7\t\2\2\u00d4\u00d2\3"+
		"\2\2\2\u00d4\u00d5\3\2\2\2\u00d5\37\3\2\2\2\u00d6\u00d7\7\r\2\2\u00d7"+
		"\u00d8\7F\2\2\u00d8\u00d9\7\20\2\2\u00d9\u00da\7G\2\2\u00da\u00db\7\t"+
		"\2\2\u00db!\3\2\2\2\u00dc\u00dd\7\16\2\2\u00dd\u00de\7F\2\2\u00de\u00df"+
		"\7\21\2\2\u00df\u00e0\7G\2\2\u00e0\u00e1\7\t\2\2\u00e1#\3\2\2\2\u00e2"+
		"\u00e3\t\6\2\2\u00e3%\3\2\2\2\u00e4\u00e5\7!\2\2\u00e5\u00e6\7F\2\2\u00e6"+
		"\u00e7\t\7\2\2\u00e7\u00e8\7G\2\2\u00e8\u00e9\7\4\2\2\u00e9\'\3\2\2\2"+
		"\u00ea\u00eb\t\b\2\2\u00eb\u00ec\7F\2\2\u00ec\u00ed\7\20\2\2\u00ed\u00ee"+
		"\7\31\2\2\u00ee\u00ef\7\20\2\2\u00ef\u00f0\7G\2\2\u00f0\u00f1\7\4\2\2"+
		"\u00f1)\3\2\2\2\u00f2\u00f3\7)\2\2\u00f3\u00f4\7F\2\2\u00f4\u00f5\78\2"+
		"\2\u00f5\u00f6\7\31\2\2\u00f6\u00f7\7\67\2\2\u00f7\u00f8\7G\2\2\u00f8"+
		"\u00f9\7\4\2\2\u00f9+\3\2\2\2\u00fa\u00fb\t\t\2\2\u00fb\u00fc\7F\2\2\u00fc"+
		"\u00fd\7\67\2\2\u00fd\u00fe\7G\2\2\u00fe\u00ff\7\4\2\2\u00ff-\3\2\2\2"+
		"\u0100\u0101\7/\2\2\u0101\u0102\7F\2\2\u0102\u0103\t\n\2\2\u0103\u0104"+
		"\7\31\2\2\u0104\u0105\t\n\2\2\u0105\u0106\7\31\2\2\u0106\u0107\t\n\2\2"+
		"\u0107\u0108\7G\2\2\u0108\u0109\7\4\2\2\u0109/\3\2\2\2\u010a\u010b\t\13"+
		"\2\2\u010b\u010c\7F\2\2\u010c\u010d\7\20\2\2\u010d\u010e\7G\2\2\u010e"+
		"\u010f\7\4\2\2\u010f\61\3\2\2\2\u0110\u0111\7\62\2\2\u0111\u0112\7F\2"+
		"\2\u0112\u0113\7\20\2\2\u0113\u0114\7\31\2\2\u0114\u0115\7\20\2\2\u0115"+
		"\u0116\7G\2\2\u0116\u0117\7\4\2\2\u0117\63\3\2\2\2\u0118\u0119\t\f\2\2"+
		"\u0119\u011a\7F\2\2\u011a\u011b\7\20\2\2\u011b\u011c\7\31\2\2\u011c\u011d"+
		"\7\20\2\2\u011d\u011e\7G\2\2\u011e\u011f\7\4\2\2\u011f\65\3\2\2\2\24<"+
		"BRY_eqw}\u0087\u0090\u0097\u009b\u00ab\u00b7\u00c3\u00cd\u00d4";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}