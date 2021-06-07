// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.crypto.symmetric.PKCS5

package com.hurlant.crypto.symmetric
{
    import flash.utils.ByteArray;

    public class PKCS5 implements IPad 
    {

        private var blockSize:uint;

        public function PKCS5(blockSize:uint=0)
        {
            this.blockSize = blockSize;
        }

        public function pad(a:ByteArray):void
        {
            var c:uint = (blockSize - (a.length % blockSize));
            var i:uint;
            while (i < c)
            {
                a[a.length] = c;
                i++;
            };
        }

        public function unpad(a:ByteArray):void
        {
            var v:uint;
            var c:uint = (a.length % blockSize);
            if (c != 0)
            {
                throw (new Error("PKCS#5::unpad: ByteArray.length isn't a multiple of the blockSize"));
            };
            c = a[(a.length - 1)];
            var i:uint = c;
            while (i > 0)
            {
                v = a[(a.length - 1)];
                a.length--;
                if (c != v)
                {
                    throw (new Error((((("PKCS#5:unpad: Invalid padding value. expected [" + c) + "], found [") + v) + "]")));
                };
                i--;
            };
        }

        public function setBlockSize(bs:uint):void
        {
            blockSize = bs;
        }


    }
}//package com.hurlant.crypto.symmetric

