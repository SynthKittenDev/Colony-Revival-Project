// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.crypto.prng.Random

package com.hurlant.crypto.prng
{
    import flash.utils.ByteArray;
    import flash.text.Font;
    import flash.system.System;
    import flash.system.Capabilities;
    import flash.utils.getTimer;
    import com.hurlant.util.Memory;

    public class Random 
    {

        private var state:IPRNG;
        private var ready:Boolean = false;
        private var pool:ByteArray;
        private var psize:int;
        private var pptr:int;
        private var seeded:Boolean = false;

        public function Random(prng:Class=null)
        {
            var t:uint;
            super();
            if (prng == null)
            {
                prng = ARC4;
            };
            state = (new (prng)() as IPRNG);
            psize = state.getPoolSize();
            pool = new ByteArray();
            pptr = 0;
            while (pptr < psize)
            {
                t = uint((0x10000 * Math.random()));
                var _local_3:* = pptr++;
                pool[_local_3] = (t >>> 8);
                var _local_4:* = pptr++;
                pool[_local_4] = (t & 0xFF);
            };
            pptr = 0;
            seed();
        }

        public function seed(x:int=0):void
        {
            if (x == 0)
            {
                x = new Date().getTime();
            };
            var _local_2:* = pptr++;
            pool[_local_2] = (pool[_local_2] ^ (x & 0xFF));
            var _local_3:* = pptr++;
            pool[_local_3] = (pool[_local_3] ^ ((x >> 8) & 0xFF));
            var _local_4:* = pptr++;
            pool[_local_4] = (pool[_local_4] ^ ((x >> 16) & 0xFF));
            var _local_5:* = pptr++;
            pool[_local_5] = (pool[_local_5] ^ ((x >> 24) & 0xFF));
            pptr = (pptr % psize);
            seeded = true;
        }

        public function autoSeed():void
        {
            var f:Font;
            var b:ByteArray = new ByteArray();
            b.writeUnsignedInt(System.totalMemory);
            b.writeUTF(Capabilities.serverString);
            b.writeUnsignedInt(getTimer());
            b.writeUnsignedInt(new Date().getTime());
            var a:Array = Font.enumerateFonts(true);
            for each (f in a)
            {
                b.writeUTF(f.fontName);
                b.writeUTF(f.fontStyle);
                b.writeUTF(f.fontType);
            };
            b.position = 0;
            while (b.bytesAvailable >= 4)
            {
                seed(b.readUnsignedInt());
            };
        }

        public function nextBytes(buffer:ByteArray, length:int):void
        {
            while (length--)
            {
                buffer.writeByte(nextByte());
            };
        }

        public function nextByte():int
        {
            if (!ready)
            {
                if (!seeded)
                {
                    autoSeed();
                };
                state.init(pool);
                pool.length = 0;
                pptr = 0;
                ready = true;
            };
            return (state.next());
        }

        public function dispose():void
        {
            var i:uint;
            while (i < pool.length)
            {
                pool[i] = (Math.random() * 0x0100);
                i++;
            };
            pool.length = 0;
            pool = null;
            state.dispose();
            state = null;
            psize = 0;
            pptr = 0;
            Memory.gc();
        }

        public function toString():String
        {
            return ("random-" + state.toString());
        }


    }
}//package com.hurlant.crypto.prng

