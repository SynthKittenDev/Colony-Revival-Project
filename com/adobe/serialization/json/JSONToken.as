// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.adobe.serialization.json.JSONToken

package com.adobe.serialization.json
{
    public class JSONToken 
    {

        private var _type:int;
        private var _value:Object;

        public function JSONToken(_arg_1:int=-1, value:Object=null)
        {
            _type = _arg_1;
            _value = value;
        }

        public function get type():int
        {
            return (_type);
        }

        public function set type(value:int):void
        {
            _type = value;
        }

        public function get value():Object
        {
            return (_value);
        }

        public function set value(v:Object):void
        {
            _value = v;
        }


    }
}//package com.adobe.serialization.json

