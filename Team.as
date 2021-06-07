// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//Team

package 
{
    public class Team 
    {

        public var ground:Array;
        public var air:Array;
        public var all:Array;
        public var baseAlive:Boolean;
        public var gainFactor:Number = 0;
        public var startX:Number;
        public var startY:Number;
        public var rallyPoint:Number;
        public var midPoint:Number;
        public var baseStartX:Number;
        public var baseStartY:Number;

        public function Team():void
        {
            baseAlive = true;
            ground = new Array();
            air = new Array();
            all = new Array();
        }

        public function setGain():void
        {
            var scan_b:*;
            var controlPercent:Number;
            var copyArray:Array = new Array();
            for (scan_b in all)
            {
                copyArray.push({"xPOS":all[scan_b].x});
            };
            if (this == unitKon.Team2)
            {
                copyArray.sortOn("xPOS", Array.NUMERIC);
                controlPercent = (100 * ((startX - copyArray[0].xPOS) / 800));
            }
            else
            {
                copyArray.sortOn("xPOS", (Array.DESCENDING | Array.NUMERIC));
                controlPercent = (100 * ((copyArray[0].xPOS - startX) / 800));
            };
            gainFactor = 0;
            if (controlPercent > 0)
            {
                gainFactor = 1;
            };
            if (controlPercent > 25)
            {
                gainFactor = 2;
            };
            if (controlPercent > 50)
            {
                gainFactor = 3;
            };
        }


    }
}//package 

