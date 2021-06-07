// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//it.gotoandplay.smartfoxserver.util.Entities

package it.gotoandplay.smartfoxserver.util
{
    public class Entities 
    {

        private static var ascTab:Array = [];
        private static var ascTabRev:Array = [];
        private static var hexTable:Array = new Array();

        {
            ascTab[">"] = "&gt;";
            ascTab["<"] = "&lt;";
            ascTab["&"] = "&amp;";
            ascTab["'"] = "&apos;";
            ascTab['"'] = "&quot;";
            ascTabRev["&gt;"] = ">";
            ascTabRev["&lt;"] = "<";
            ascTabRev["&amp;"] = "&";
            ascTabRev["&apos;"] = "'";
            ascTabRev["&quot;"] = '"';
            hexTable["0"] = 0;
            hexTable["1"] = 1;
            hexTable["2"] = 2;
            hexTable["3"] = 3;
            hexTable["4"] = 4;
            hexTable["5"] = 5;
            hexTable["6"] = 6;
            hexTable["7"] = 7;
            hexTable["8"] = 8;
            hexTable["9"] = 9;
            hexTable["A"] = 10;
            hexTable["B"] = 11;
            hexTable["C"] = 12;
            hexTable["D"] = 13;
            hexTable["E"] = 14;
            hexTable["F"] = 15;
        }


        public static function encodeEntities(st:String):String
        {
            var ch:String;
            var cod:int;
            var strbuff:String = "";
            var i:int;
            while (i < st.length)
            {
                ch = st.charAt(i);
                cod = st.charCodeAt(i);
                if ((((cod == 9) || (cod == 10)) || (cod == 13)))
                {
                    strbuff = (strbuff + ch);
                }
                else
                {
                    if (((cod >= 32) && (cod <= 126)))
                    {
                        if (ascTab[ch] != null)
                        {
                            strbuff = (strbuff + ascTab[ch]);
                        }
                        else
                        {
                            strbuff = (strbuff + ch);
                        };
                    }
                    else
                    {
                        strbuff = (strbuff + ch);
                    };
                };
                i++;
            };
            return (strbuff);
        }

        public static function decodeEntities(st:String):String
        {
            var strbuff:String;
            var ch:String;
            var ent:String;
            var chi:String;
            var item:String;
            var i:int;
            strbuff = "";
            while (i < st.length)
            {
                ch = st.charAt(i);
                if (ch == "&")
                {
                    ent = ch;
                    do 
                    {
                        i++;
                        chi = st.charAt(i);
                        ent = (ent + chi);
                    } while (((!(chi == ";")) && (i < st.length)));
                    item = ascTabRev[ent];
                    if (item != null)
                    {
                        strbuff = (strbuff + item);
                    }
                    else
                    {
                        strbuff = (strbuff + String.fromCharCode(getCharCode(ent)));
                    };
                }
                else
                {
                    strbuff = (strbuff + ch);
                };
                i++;
            };
            return (strbuff);
        }

        public static function getCharCode(ent:String):Number
        {
            var hex:String = ent.substr(3, ent.length);
            hex = hex.substr(0, (hex.length - 1));
            return (Number(("0x" + hex)));
        }


    }
}//package it.gotoandplay.smartfoxserver.util

