// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.jiggmin.blossomSocket.Encryptor

package com.jiggmin.blossomSocket
{
    import com.hurlant.crypto.symmetric.CBCMode;
    import flash.utils.ByteArray;
    import com.hurlant.crypto.symmetric.AESKey;
    import com.hurlant.crypto.symmetric.IVMode;
    import com.hurlant.util.Base64;

    public class Encryptor 
    {

        private var mode:CBCMode;


        public function setKey(stringKey:String):void
        {
            var binaryKey:ByteArray = stringToBinary(stringKey);
            var padding:ZeroPad = new ZeroPad();
            var key:AESKey = new AESKey(binaryKey);
            mode = new CBCMode(key, padding);
        }

        public function setIV(stringIV:String):void
        {
            var binaryIV:ByteArray = stringToBinary(stringIV);
            IVMode(mode).IV = binaryIV;
        }

        public function encrypt(string:String):String
        {
            var binary:ByteArray = new ByteArray();
            binary.writeUTFBytes(string);
            mode.encrypt(binary);
            var encrypted:String = binaryToString(binary);
            return (encrypted);
        }

        public function decrypt(string:String):String
        {
            var binary:ByteArray = stringToBinary(string);
            mode.decrypt(binary);
            binary.position = 0;
            var decrypted:String = binary.readUTFBytes(binary.bytesAvailable);
            return (decrypted);
        }

        private function binaryToString(binary:ByteArray):String
        {
            var string:String = Base64.encodeByteArray(binary);
            return (string);
        }

        private function stringToBinary(string:String):ByteArray
        {
            var binary:ByteArray = Base64.decodeToByteArray(string);
            return (binary);
        }

        public function remove():void
        {
            mode = null;
        }


    }
}//package com.jiggmin.blossomSocket

