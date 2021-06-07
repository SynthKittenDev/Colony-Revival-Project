// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.crypto.prng.ARC4

package com.hurlant.crypto.prng
{
    import com.hurlant.crypto.symmetric.IStreamCipher;
    import flash.utils.ByteArray;
    import com.hurlant.util.Memory;

    public class ARC4 implements IPRNG, IStreamCipher 
    {

        private const psize:uint = 0x0100;

        private var i:int = 0;
        private var j:int = 0;
        private var S:ByteArray;

        public function ARC4(key:ByteArray=null)
        {
            S = new ByteArray();
            if (key)
            {
                init(key);
            };
        }

        public function getPoolSize():uint
        {
            return (psize);
        }

        public function init(key:ByteArray):void
        {
            var i:int;
            var j:int;
            var t:int;
            i = 0;
            while (i < 0x0100)
            {
                S[i] = i;
                i++;
            };
            j = 0;
            i = 0;
            while (i < 0x0100)
            {
                j = (((j + S[i]) + key[(i % key.length)]) & 0xFF);
                t = S[i];
                S[i] = S[j];
                S[j] = t;
                i++;
            };
            this.i = 0;
            this.j = 0;
        }

        public function next():uint
        {
            var t:int;
            i = ((i + 1) & 0xFF);
            j = ((j + S[i]) & 0xFF);
            t = S[i];
            S[i] = S[j];
            S[j] = t;
            return (S[((t + S[i]) & 0xFF)]);
        }

        public function getBlockSize():uint
        {
            return (1);
        }

        public function encrypt(block:ByteArray):void
        {
            var i:uint;
            while (i < block.length)
            {
                var _local_3:* = i++;
                block[_local_3] = (block[_local_3] ^ next());
            };
        }

        public function decrypt(block:ByteArray):void
        {
            encrypt(block);
        }

        public function dispose():void
        {
            var i:uint;
            if (S != null)
            {
                i = 0;
                while (i < S.length)
                {
                    S[i] = (Math.random() * 0x0100);
                    i++;
                };
                S.length = 0;
                S = null;
            };
            this.i = 0;
            this.j = 0;
            Memory.gc();
        }

        public function toString():String
        {
            return ("rc4");
        }


    }
}//package com.hurlant.crypto.prng

