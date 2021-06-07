// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.crypto.symmetric.IPad

package com.hurlant.crypto.symmetric
{
    import flash.utils.ByteArray;

    public interface IPad 
    {

        function pad(_arg_1:ByteArray):void;
        function unpad(_arg_1:ByteArray):void;
        function setBlockSize(_arg_1:uint):void;

    }
}//package com.hurlant.crypto.symmetric

