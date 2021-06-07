// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.jiggmin.data.Data

package com.jiggmin.data
{
    import flash.display.Stage;
    import flash.utils.getDefinitionByName;

    public class Data 
    {

        private static var stage:Stage;


        public static function stringToObject(string:String):*
        {
            var ClassReference:Class = (getDefinitionByName(string) as Class);
            var ret:* = new (ClassReference)();
            return (ret);
        }

        public static function getMS():int
        {
            var date:Date = new Date();
            var ms:int = date.time;
            return (ms);
        }

        public static function filterSwearing(str:String):String
        {
            var fuckArray:Array = new Array("flower");
            var niggerArray:Array = new Array("cool cat", "ladies magnet");
            var shitArray:Array = new Array("...");
            var randArray:Array = new Array(":)");
            if (str != null)
            {
                str = str.replace(/fuck|fuk|fu+ ?c+ ?k+ ?/gi, Data.randIndex(fuckArray));
                str = str.replace(/nigg(a|er)|ni+ ?g+ ?e+ ?r+ ?/gi, Data.randIndex(niggerArray));
                str = str.replace(/shit|s+ ?h+ ?i+ ?t+ ?/gi, Data.randIndex(shitArray));
                str = str.replace(/fag|cunt|asshole|dick/gi, Data.randIndex(randArray));
                str = str.replace(/&#013;/gi, "");
            };
            return (str);
        }

        public static function randIndex(array:Array):*
        {
            var val:* = array[Math.floor((Math.random() * array.length))];
            return (val);
        }

        public static function formatNumber(num:Number):String
        {
            var a:* = [];
            while (num > 0)
            {
                a.push((num % 1000));
                num = Math.floor((num / 1000));
            };
            return (a.reverse().join(","));
        }


    }
}//package com.jiggmin.data

