// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//dataTracer

package 
{
    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class dataTracer extends Sprite 
    {

        public static var writeLim:uint = 9;
        public static var tracer:Tracer = new Tracer();
        private static var msgArray:Array = new Array();
        private static var theRoot:Object;
        private static var sup:Boolean = false;
        public static var progressing:Boolean = false;
        public static var theStage:Stage;
        public static var T:Timer;
        private static var ticked:uint;
        private static var clockRunning:Boolean = false;

        public function dataTracer(r:Object, s:Stage)
        {
            theRoot = r;
            theStage = s;
            addChild(tracer);
        }

        public static function hideTracer():void
        {
            clearTracer();
            try
            {
                theRoot.removeChild(theRoot.DataTracer);
                return;
            }
            catch(e:Error)
            {
                return;
            };
        }

        public static function noMoreProgress():void
        {
            progressing = false;
        }

        public static function throwError(t:String):void
        {
            progressing = false;
            clearTracer();
            showTracer();
            update(t);
        }

        public static function DC(a:String="You have been disconnected from the server! :("):void
        {
            if ((!(sup)))
            {
                theRoot.disconnectedHandler2();
                theRoot.DCTRUE = true;
                theRoot.DCLINE = a;
                progressing = false;
                clearTracer();
                dataTracer.endAfkClock();
                sup = false;
                theRoot.gotoAndStop("OutOf", "SCENE");
            }
            else
            {
                sup = false;
            };
        }

        public static function DCAFK():void
        {
            DC("You have been disconnected for not having played a game for over an hour.");
        }

        public static function initAfkClock():void
        {
            T = new Timer(60000);
            clockRunning = true;
            T.start();
            ticked = uint(0);
            // trace("Start Clock");
            T.addEventListener(TimerEvent.TIMER, runAfkCheck, false, 0, true);
        }

        private static function runAfkCheck(te:TimerEvent):*
        {
            ticked++;
            // trace(("Timer Tick: " + ticked));
            if (ticked == 45)
            {
                throwError("You must play a game within 15 minutes or you will be auto-kicked from the server.");
            };
            if (ticked >= 60)
            {
                DCAFK();
            };
        }

        public static function endAfkClock():void
        {
            if (clockRunning)
            {
                T.stop();
                T.removeEventListener(TimerEvent.TIMER, runAfkCheck);
                T = null;
                // trace("Stopping the Clock");
                clockRunning = false;
            };
        }

        public static function resetAfkClock():void
        {
            T.reset();
            T.start();
            clockRunning = true;
            ticked = uint(0);
        }

        public static function suppress():void
        {
            sup = true;
        }

        public static function showTracer():void
        {
            theRoot.addChild(theRoot.DataTracer);
        }

        public static function clearTracer():void
        {
            msgArray = new Array();
            tracer.tr.htmlText = "";
        }

        public static function update(t:String):void
        {
            // trace(("Updating " + t));
            msgArray.push(t);
            if (msgArray.length > writeLim)
            {
                msgArray.shift();
            };
            var str:String = msgArray.join("<br/>");
            tracer.tr.htmlText = str;
        }


    }
}//package 

