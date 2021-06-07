// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.adobe.serialization.json.JSONParseError

package com.adobe.serialization.json
{
    public class JSONParseError extends Error 
    {

        private var _location:int;
        private var _text:String;

        public function JSONParseError(message:String="", location:int=0, text:String="")
        {
            super(message);
            _location = location;
            _text = text;
        }

        public function get location():int
        {
            return (_location);
        }

        public function get text():String
        {
            return (_text);
        }


    }
}//package com.adobe.serialization.json

