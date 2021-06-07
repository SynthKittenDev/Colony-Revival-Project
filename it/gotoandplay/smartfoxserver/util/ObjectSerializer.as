// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//it.gotoandplay.smartfoxserver.util.ObjectSerializer

package it.gotoandplay.smartfoxserver.util
{
    public class ObjectSerializer 
    {

        private static var instance:ObjectSerializer;

        private var debug:Boolean;
        private var eof:String;
        private var tabs:String;

        public function ObjectSerializer(debug:Boolean=false)
        {
            this.tabs = "\t\t\t\t\t\t\t\t\t\t\t\t\t";
            setDebug(debug);
        }

        public static function getInstance(debug:Boolean=false):ObjectSerializer
        {
            if (instance == null)
            {
                instance = new ObjectSerializer(debug);
            };
            return (instance);
        }


        private function setDebug(b:Boolean):void
        {
            this.debug = b;
            if (this.debug)
            {
                this.eof = "\n";
            }
            else
            {
                this.eof = "";
            };
        }

        public function serialize(o:Object):String
        {
            var result:Object = {};
            obj2xml(o, result);
            return (result.xmlStr);
        }

        public function deserialize(xmlString:String):Object
        {
            var xmlData:XML = new XML(xmlString);
            var resObj:Object = {};
            xml2obj(xmlData, resObj);
            return (resObj);
        }

        private function obj2xml(srcObj:Object, trgObj:Object, depth:int=0, objName:String=""):void
        {
            var i:String;
            var ot:String;
            var t:String;
            var o:*;
            if (depth == 0)
            {
                trgObj.xmlStr = ("<dataObj>" + this.eof);
            }
            else
            {
                if (this.debug)
                {
                    trgObj.xmlStr = (trgObj.xmlStr + this.tabs.substr(0, depth));
                };
                ot = ((srcObj is Array) ? "a" : "o");
                trgObj.xmlStr = (trgObj.xmlStr + ((((("<obj t='" + ot) + "' o='") + objName) + "'>") + this.eof));
            };
            for (i in srcObj)
            {
                t = typeof(srcObj[i]);
                o = srcObj[i];
                if (((((t == "boolean") || (t == "number")) || (t == "string")) || (t == "null")))
                {
                    if (t == "boolean")
                    {
                        o = Number(o);
                    }
                    else
                    {
                        if (t == "null")
                        {
                            t = "x";
                            o = "";
                        }
                        else
                        {
                            if (t == "string")
                            {
                                o = Entities.encodeEntities(o);
                            };
                        };
                    };
                    if (this.debug)
                    {
                        trgObj.xmlStr = (trgObj.xmlStr + this.tabs.substr(0, (depth + 1)));
                    };
                    trgObj.xmlStr = (trgObj.xmlStr + ((((((("<var n='" + i) + "' t='") + t.substr(0, 1)) + "'>") + o) + "</var>") + this.eof));
                }
                else
                {
                    if (t == "object")
                    {
                        obj2xml(o, trgObj, (depth + 1), i);
                        if (this.debug)
                        {
                            trgObj.xmlStr = (trgObj.xmlStr + this.tabs.substr(0, (depth + 1)));
                        };
                        trgObj.xmlStr = (trgObj.xmlStr + ("</obj>" + this.eof));
                    };
                };
            };
            if (depth == 0)
            {
                trgObj.xmlStr = (trgObj.xmlStr + ("</dataObj>" + this.eof));
            };
        }

        private function xml2obj(x:XML, o:Object):void
        {
            var nodeName:String;
            var node:XML;
            var objName:String;
            var objType:String;
            var varName:String;
            var varType:String;
            var varVal:String;
            var i:int;
            var nodes:XMLList = x.children();
            for each (node in nodes)
            {
                nodeName = node.name().toString();
                if (nodeName == "obj")
                {
                    objName = node.@o;
                    objType = node.@t;
                    if (objType == "a")
                    {
                        o[objName] = [];
                    }
                    else
                    {
                        if (objType == "o")
                        {
                            o[objName] = {};
                        };
                    };
                    xml2obj(node, o[objName]);
                }
                else
                {
                    if (nodeName == "var")
                    {
                        varName = node.@n;
                        varType = node.@t;
                        varVal = node.toString();
                        if (varType == "b")
                        {
                            o[varName] = ((varVal == "0") ? false : true);
                        }
                        else
                        {
                            if (varType == "n")
                            {
                                o[varName] = Number(varVal);
                            }
                            else
                            {
                                if (varType == "s")
                                {
                                    o[varName] = varVal;
                                }
                                else
                                {
                                    if (varType == "x")
                                    {
                                        o[varName] = null;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function encodeEntities(s:String):String
        {
            return (s);
        }


    }
}//package it.gotoandplay.smartfoxserver.util

