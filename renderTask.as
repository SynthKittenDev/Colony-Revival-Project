// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//renderTask

package 
{
    public class renderTask 
    {

        public var a:*;
        public var b:Number;
        public var c:Number;
        public var d:Array;
        public var e:*;
        public var anim:Boolean = false;
        public var animated:Boolean = false;
        public var ob:Object = null;
        public var col:* = null;

        public function renderTask(a:*, b:Number, c:Number, d:Array, e:*, anim:Boolean=false, animated:Boolean=false, ob:Object=null, col:*=null)
        {
            this.a = a;
            this.b = b;
            this.c = c;
            this.d = d;
            this.e = e;
            this.anim = anim;
            this.animated = animated;
            this.ob = ob;
            this.col = col;
        }

    }
}//package 

