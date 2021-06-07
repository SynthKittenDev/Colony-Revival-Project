// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//trailBody

package 
{
    import flash.events.Event;

    public class trailBody extends displayBody 
    {

        public static var intensity:Array = new Array(null, 7, 3, 2, 4, 4, 3, 1, 2, 1, 1, 1, 3);
        public static var xGap:Array = new Array(null, 4, 12, 5, 5, 8, 12, 2, 12, 3, 3, 3, 12);
        public static var yGap:Array = new Array(null, 4, 2, 5, 5, 8, 5, 2, 5, 3, 3, 3, 2);
        public static var hl:Array = new Array(null, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.4, 0.4, 0.3, 0.4, 0.4, 0.4);
        public static var decay:Array = new Array(null, 25, 40, 20, 20, 17, 40, 7, 32, 7, 7, 7, 40);

        private var decayTime:uint;
        private var decayTimeMax:uint;

        public function trailBody(id:uint, h:Number, d:Number):void
        {
            createDisplay(renderMachine.trail[id], true, false);
            addEventListener(Event.ENTER_FRAME, trailAction);
            var i:Boolean = true;
            var dt:uint;
            while (i)
            {
                dt++;
                if (((Math.random() > h) || (dt > 10)))
                {
                    i = false;
                };
            };
            decayTime = (decayTimeMax = Math.round((d * dt)));
        }

        public function trailAction(event:Event):*
        {
            decayTime--;
            y = (y + 0.5);
            alpha = (decayTime / decayTimeMax);
            if (decayTime == 0)
            {
                removeEventListener(Event.ENTER_FRAME, trailAction);
                unitKon.killTrail(this);
            };
        }

        public function terminateEvents():void
        {
            end();
        }


    }
}//package 

