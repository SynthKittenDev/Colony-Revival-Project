// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.crypto.symmetric.IVMode

package com.hurlant.crypto.symmetric
{
    import com.hurlant.crypto.prng.Random;
    import flash.utils.ByteArray;
    import com.hurlant.util.Memory;

    public class IVMode 
    {

        protected var key:ISymmetricKey;
        protected var padding:IPad;
        protected var prng:Random;
        protected var iv:ByteArray;
        protected var lastIV:ByteArray;
        protected var blockSize:uint;

        public function IVMode(key:ISymmetricKey, padding:IPad=null)
        {
            this.key = key;
            blockSize = key.getBlockSize();
            if (padding == null)
            {
                padding = new PKCS5(blockSize);
            }
            else
            {
                padding.setBlockSize(blockSize);
            };
            this.padding = padding;
            prng = new Random();
            iv = null;
            lastIV = new ByteArray();
        }

        public function getBlockSize():uint
        {
            return (key.getBlockSize());
        }

        public function dispose():void
        {
            var i:uint;
            if (iv != null)
            {
                i = 0;
                while (i < iv.length)
                {
                    iv[i] = prng.nextByte();
                    i++;
                };
                iv.length = 0;
                iv = null;
            };
            if (lastIV != null)
            {
                i = 0;
                while (i < iv.length)
                {
                    lastIV[i] = prng.nextByte();
                    i++;
                };
                lastIV.length = 0;
                lastIV = null;
            };
            key.dispose();
            key = null;
            padding = null;
            prng.dispose();
            prng = null;
            Memory.gc();
        }

        public function set IV(value:ByteArray):void
        {
            iv = value;
            lastIV.length = 0;
            lastIV.writeBytes(iv);
        }

        public function get IV():ByteArray
        {
            return (lastIV);
        }

        protected function getIV4e():ByteArray
        {
            var vec:ByteArray = new ByteArray();
            if (iv)
            {
                vec.writeBytes(iv);
            }
            else
            {
                prng.nextBytes(vec, blockSize);
            };
            lastIV.length = 0;
            lastIV.writeBytes(vec);
            return (vec);
        }

        protected function getIV4d():ByteArray
        {
            var vec:ByteArray = new ByteArray();
            if (iv)
            {
                vec.writeBytes(iv);
            }
            else
            {
                throw (new Error("an IV must be set before calling decrypt()"));
            };
            return (vec);
        }


    }
}//package com.hurlant.crypto.symmetric

