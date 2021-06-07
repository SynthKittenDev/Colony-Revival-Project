// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.adobe.serialization.json.JSONTokenizer

package com.adobe.serialization.json
{
    public class JSONTokenizer 
    {

        private var obj:Object;
        private var jsonString:String;
        private var loc:int;
        private var ch:String;

        public function JSONTokenizer(s:String)
        {
            jsonString = s;
            loc = 0;
            nextChar();
        }

        public function getNextToken():JSONToken
        {
            var possibleTrue:String;
            var possibleFalse:String;
            var possibleNull:String;
            var token:JSONToken = new JSONToken();
            skipIgnored();
            switch (ch)
            {
                case "{":
                    token.type = JSONTokenType.LEFT_BRACE;
                    token.value = "{";
                    nextChar();
                    break;
                case "}":
                    token.type = JSONTokenType.RIGHT_BRACE;
                    token.value = "}";
                    nextChar();
                    break;
                case "[":
                    token.type = JSONTokenType.LEFT_BRACKET;
                    token.value = "[";
                    nextChar();
                    break;
                case "]":
                    token.type = JSONTokenType.RIGHT_BRACKET;
                    token.value = "]";
                    nextChar();
                    break;
                case ",":
                    token.type = JSONTokenType.COMMA;
                    token.value = ",";
                    nextChar();
                    break;
                case ":":
                    token.type = JSONTokenType.COLON;
                    token.value = ":";
                    nextChar();
                    break;
                case "t":
                    possibleTrue = ((("t" + nextChar()) + nextChar()) + nextChar());
                    if (possibleTrue == "true")
                    {
                        token.type = JSONTokenType.TRUE;
                        token.value = true;
                        nextChar();
                    }
                    else
                    {
                        parseError(("Expecting 'true' but found " + possibleTrue));
                    };
                    break;
                case "f":
                    possibleFalse = (((("f" + nextChar()) + nextChar()) + nextChar()) + nextChar());
                    if (possibleFalse == "false")
                    {
                        token.type = JSONTokenType.FALSE;
                        token.value = false;
                        nextChar();
                    }
                    else
                    {
                        parseError(("Expecting 'false' but found " + possibleFalse));
                    };
                    break;
                case "n":
                    possibleNull = ((("n" + nextChar()) + nextChar()) + nextChar());
                    if (possibleNull == "null")
                    {
                        token.type = JSONTokenType.NULL;
                        token.value = null;
                        nextChar();
                    }
                    else
                    {
                        parseError(("Expecting 'null' but found " + possibleNull));
                    };
                    break;
                case '"':
                    token = readString();
                    break;
                default:
                    if (((isDigit(ch)) || (ch == "-")))
                    {
                        token = readNumber();
                    }
                    else
                    {
                        if (ch == "")
                        {
                            return (null);
                        };
                        parseError((("Unexpected " + ch) + " encountered"));
                    };
            };
            return (token);
        }

        private function readString():JSONToken
        {
            var hexValue:String;
            var i:int;
            var token:JSONToken = new JSONToken();
            token.type = JSONTokenType.STRING;
            var string:String = "";
            nextChar();
            while (((!(ch == '"')) && (!(ch == ""))))
            {
                if (ch == "\\")
                {
                    nextChar();
                    switch (ch)
                    {
                        case '"':
                            string = (string + '"');
                            break;
                        case "/":
                            string = (string + "/");
                            break;
                        case "\\":
                            string = (string + "\\");
                            break;
                        case "b":
                            string = (string + "\b");
                            break;
                        case "f":
                            string = (string + "\f");
                            break;
                        case "n":
                            string = (string + "\n");
                            break;
                        case "r":
                            string = (string + "\r");
                            break;
                        case "t":
                            string = (string + "\t");
                            break;
                        case "u":
                            hexValue = "";
                            i = 0;
                            while (i < 4)
                            {
                                if (!isHexDigit(nextChar()))
                                {
                                    parseError((" Excepted a hex digit, but found: " + ch));
                                };
                                hexValue = (hexValue + ch);
                                i++;
                            };
                            string = (string + String.fromCharCode(parseInt(hexValue, 16)));
                            break;
                        default:
                            string = (string + ("\\" + ch));
                    };
                }
                else
                {
                    string = (string + ch);
                };
                nextChar();
            };
            if (ch == "")
            {
                parseError("Unterminated string literal");
            };
            nextChar();
            token.value = string;
            return (token);
        }

        private function readNumber():JSONToken
        {
            var token:JSONToken = new JSONToken();
            token.type = JSONTokenType.NUMBER;
            var input:String = "";
            if (ch == "-")
            {
                input = (input + "-");
                nextChar();
            };
            if (!isDigit(ch))
            {
                parseError("Expecting a digit");
            };
            if (ch == "0")
            {
                input = (input + ch);
                nextChar();
                if (isDigit(ch))
                {
                    parseError("A digit cannot immediately follow 0");
                };
            }
            else
            {
                while (isDigit(ch))
                {
                    input = (input + ch);
                    nextChar();
                };
            };
            if (ch == ".")
            {
                input = (input + ".");
                nextChar();
                if (!isDigit(ch))
                {
                    parseError("Expecting a digit");
                };
                while (isDigit(ch))
                {
                    input = (input + ch);
                    nextChar();
                };
            };
            if (((ch == "e") || (ch == "E")))
            {
                input = (input + "e");
                nextChar();
                if (((ch == "+") || (ch == "-")))
                {
                    input = (input + ch);
                    nextChar();
                };
                if (!isDigit(ch))
                {
                    parseError("Scientific notation number needs exponent value");
                };
                while (isDigit(ch))
                {
                    input = (input + ch);
                    nextChar();
                };
            };
            var num:Number = Number(input);
            if (((isFinite(num)) && (!(isNaN(num)))))
            {
                token.value = num;
                return (token);
            };
            parseError((("Number " + num) + " is not valid!"));
            return (null);
        }

        private function nextChar():String
        {
            return (ch = jsonString.charAt(loc++));
        }

        private function skipIgnored():void
        {
            skipWhite();
            skipComments();
            skipWhite();
        }

        private function skipComments():void
        {
            if (ch == "/")
            {
                nextChar();
                switch (ch)
                {
                    case "/":
                        do 
                        {
                            nextChar();
                        } while (((!(ch == "\n")) && (!(ch == ""))));
                        nextChar();
                        break;
                    case "*":
                        nextChar();
                        while (true)
                        {
                            if (ch == "*")
                            {
                                nextChar();
                                if (ch == "/")
                                {
                                    nextChar();
                                    break;
                                };
                            }
                            else
                            {
                                nextChar();
                            };
                            if (ch == "")
                            {
                                parseError("Multi-line comment not closed");
                            };
                        };
                        break;
                    default:
                        parseError((("Unexpected " + ch) + " encountered (expecting '/' or '*' )"));
                };
            };
        }

        private function skipWhite():void
        {
            while (isWhiteSpace(ch))
            {
                nextChar();
            };
        }

        private function isWhiteSpace(ch:String):Boolean
        {
            return (((ch == " ") || (ch == "\t")) || (ch == "\n"));
        }

        private function isDigit(ch:String):Boolean
        {
            return ((ch >= "0") && (ch <= "9"));
        }

        private function isHexDigit(ch:String):Boolean
        {
            var uc:String = ch.toUpperCase();
            return ((isDigit(ch)) || ((uc >= "A") && (uc <= "F")));
        }

        public function parseError(message:String):void
        {
            throw (new JSONParseError(message, loc, jsonString));
        }


    }
}//package com.adobe.serialization.json

