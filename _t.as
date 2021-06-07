// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_t

package 
{
    import flash.utils.getTimer;
    import flash.display.Stage;
    import flash.events.Event;

    public class _t 
    {

        private static var last:uint = getTimer();
        private static var s:Stage;
        private static const C:Number = (100 / 3);//33.3333333333333
        public static var theFactor:Number = 1;


        public static function init(ST:Stage):void
        {
            s = ST;
        }

        public static function startTicker():void
        {
            last = getTimer();
            s.addEventListener(Event.ENTER_FRAME, tick);
        }

        public static function stopTicker():void
        {
            s.removeEventListener(Event.ENTER_FRAME, tick);
        }

        public static function tick(evt:Event):void
        {
            var now:uint = getTimer();
            var factor:Number = ((now - last) / C);
            theFactor = factor;
            if (theFactor > 2)
            {
                theFactor = 2;
            };
            last = now;
        }


    }
}//package 

