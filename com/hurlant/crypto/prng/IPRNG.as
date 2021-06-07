// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.crypto.prng.IPRNG

package com.hurlant.crypto.prng
{
    import flash.utils.ByteArray;

    public interface IPRNG 
    {

        function getPoolSize():uint;
        function init(_arg_1:ByteArray):void;
        function next():uint;
        function dispose():void;
        function toString():String;

    }
}//package com.hurlant.crypto.prng

