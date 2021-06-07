// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//aiOrder

package 
{
    public class aiOrder 
    {

        public var limit:uint;
        public var array:Array;
        public var onHold:Boolean;
        public var tech:Boolean;

        public function aiOrder(w:uint, l:uint, t:Boolean=false):void
        {
            limit = l;
            tech = t;
            onHold = false;
            array = new Array();
            array.push(w);
        }

    }
}//package 

