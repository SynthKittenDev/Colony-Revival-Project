// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.util.Base64

package com.hurlant.util
{
    import flash.utils.ByteArray;

    public class Base64 
    {

        private static const BASE64_CHARS:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
        public static const version:String = "1.0.0";

        public function Base64()
        {
            throw (new Error("Base64 class is static container only"));
        }

        public static function encode(data:String):String
        {
            var bytes:ByteArray = new ByteArray();
            bytes.writeUTFBytes(data);
            return (encodeByteArray(bytes));
        }

        public static function encodeByteArray(data:ByteArray):String
        {
            var dataBuffer:Array;
            var i:uint;
            var j:uint;
            var k:uint;
            var output:String = "";
            var outputBuffer:Array = new Array(4);
            data.position = 0;
            while (data.bytesAvailable > 0)
            {
                dataBuffer = new Array();
                i = 0;
                while (((i < 3) && (data.bytesAvailable > 0)))
                {
                    dataBuffer[i] = data.readUnsignedByte();
                    i++;
                };
                outputBuffer[0] = ((dataBuffer[0] & 0xFC) >> 2);
                outputBuffer[1] = (((dataBuffer[0] & 0x03) << 4) | (dataBuffer[1] >> 4));
                outputBuffer[2] = (((dataBuffer[1] & 0x0F) << 2) | (dataBuffer[2] >> 6));
                outputBuffer[3] = (dataBuffer[2] & 0x3F);
                j = dataBuffer.length;
                while (j < 3)
                {
                    outputBuffer[(j + 1)] = 64;
                    j++;
                };
                k = 0;
                while (k < outputBuffer.length)
                {
                    output = (output + BASE64_CHARS.charAt(outputBuffer[k]));
                    k++;
                };
            };
            return (output);
        }

        public static function decode(data:String):String
        {
            var bytes:ByteArray = decodeToByteArray(data);
            return (bytes.readUTFBytes(bytes.length));
        }

        public static function decodeToByteArray(data:String):ByteArray
        {
            var j:uint;
            var k:uint;
            var output:ByteArray = new ByteArray();
            var dataBuffer:Array = new Array(4);
            var outputBuffer:Array = new Array(3);
            var i:uint;
            while (i < data.length)
            {
                j = 0;
                while (((j < 4) && ((i + j) < data.length)))
                {
                    dataBuffer[j] = BASE64_CHARS.indexOf(data.charAt((i + j)));
                    j++;
                };
                outputBuffer[0] = ((dataBuffer[0] << 2) + ((dataBuffer[1] & 0x30) >> 4));
                outputBuffer[1] = (((dataBuffer[1] & 0x0F) << 4) + ((dataBuffer[2] & 0x3C) >> 2));
                outputBuffer[2] = (((dataBuffer[2] & 0x03) << 6) + dataBuffer[3]);
                k = 0;
                while (k < outputBuffer.length)
                {
                    if (dataBuffer[(k + 1)] == 64) break;
                    output.writeByte(outputBuffer[k]);
                    k++;
                };
                i = (i + 4);
            };
            output.position = 0;
            return (output);
        }


    }
}//package com.hurlant.util

