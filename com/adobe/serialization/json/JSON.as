// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.adobe.serialization.json.JSON

package com.adobe.serialization.json
{
    public class JSON 
    {


        public static function encode(o:Object):String
        {
            var encoder:JSONEncoder = new JSONEncoder(o);
            return (encoder.getString());
        }

        public static function decode(s:String):*
        {
            var decoder:JSONDecoder = new JSONDecoder(s);
            return (decoder.getValue());
        }


    }
}//package com.adobe.serialization.json

