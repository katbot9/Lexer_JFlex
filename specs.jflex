%{
// import necessary classes
%}

// define regular expressions for each token
%class XmC
%unicode
%type java
%public

%{
    // import necessary classes
%}

// Regular expression for each token
%state INITIAL

%{
    // Code executed at the beginning of each match
%}

// Whitespace and newline characters
WhiteSpace = [\t\f\r\n]+

// Tokens
Var = "var"
Int = "int"
Float = "float"
Bool = "bool"
True = "true"
False = "false"
If = "if"
Then = "then"
Else = "else"
Endif = "end"[" "]?"if"
While = "while"
Do = "do"
Endwhile = "end"[" "]?"while"
For = "for"
To = "to"
Endfor = "end"[" "]?"for"

Identifier = [a-zA-Z][a-zA-Z0-9_]*
Number = [0-9]+[.]?[0-9]*
Plus = "+"
Minus = "-"
Multiply = "*"
Divide = "/"
Equal = "=="
NotEqual = "!="
GreaterThan = ">"
LessThan = "<"
GreaterThanOrEqual = ">="
LessThanOrEqual = "<="
OpenBracket = "("
CloseBracket = ")"
Colon = ":"
Semicolon = ";"
Assign = "="

// Ignore whitespace and newline characters
%{
    // Code executed at the end of each match
%}

// Rules for each token
%%

{WhiteSpace} { /* ignore */ }

{Var} { return new Token(Token.VAR, yyline, yytext()); }

{Int} { return new Token(Token.INT, yyline, yytext()); }

{Float} { return new Token(Token.FLOAT, yyline, yytext()); }

{Bool} { return new Token(Token.BOOL, yyline, yytext()); }

{True} { return new Token(Token.BOOL_LITERAL, yyline, yytext(), true); }

{False} { return new Token(Token.BOOL_LITERAL, yyline, yytext(), false); }

{If} { return new Token(Token.IF, yyline, yytext()); }

{Then} { return new Token(Token.THEN, yyline, yytext()); }

{Else} { return new Token(Token.ELSE, yyline, yytext()); }

{Endif} { return new Token(Token.END_IF, yyline, yytext()); }

{While} { return new Token(Token.WHILE, yyline, yytext()); }

{Do} { return new Token(Token.DO, yyline, yytext()); }

{Endwhile} { return new Token(Token.END_WHILE, yyline, yytext()); }

{For} { return new Token(Token.FOR, yyline, yytext()); }

{To} { return new Token(Token.TO, yyline, yytext()); }

{Endfor} { return new Token(Token.END_FOR, yyline, yytext()); }

{Identifier} { return new Token(Token.IDENTIFIER, yyline, yytext()); }

{Number} { return new Token(Token.NUMBER, yyline, yytext()); }

{Plus} { return new Token(Token.PLUS, yyline, yytext()); }

{Minus} { return new Token(Token.MINUS, yyline, yytext()); }

{Multiply} { return new Token(Token.MULTIPLY, yyline, yytext()); }

{Divide} { return new Token(Token.DIVIDE, yyline, yytext());
