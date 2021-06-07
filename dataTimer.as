// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//dataTimer

package 
{
    import flash.display.Sprite;
    import flash.utils.Timer;
    import flash.display.Stage;
    import flash.events.TimerEvent;
    import flash.utils.getTimer;
    import flash.events.Event;

    public class dataTimer extends Sprite 
    {

        private static var T:Timer = new Timer(1000);
        private static var D:Number = 0;
        private static var F:Number = 0;
        private static var G:Number = 0;
        private static var FTotal:Number = 0;
        private static var lastTimer:Number = 0;
        private static var now:Date = new Date();
        private static var lastDate:Number;
        private static var S:Stage;
        private static var RT:Timer = new Timer(20000);


        public static function init(s:Stage):void
        {
            S = s;
            lastDate = now.getUTCSeconds();
            RT.addEventListener(TimerEvent.TIMER, beginTest, false, 0, true);
            RT.start();
        }

        private static function beginTest(e:TimerEvent=null):void
        {
            RT.stop();
            startCheck();
        }

        public static function forceStart():void
        {
            endCheck();
            beginTest();
        }

        private static function startCheck():void
        {
            F = 0;
            lastTimer = getTimer();
            now = new Date();
            lastDate = now.getUTCSeconds();
            F = 0;
            D = 0;
            FTotal = 0;
            G = 0;
            T.reset();
            T.start();
            T.addEventListener(TimerEvent.TIMER, doTest);
            S.addEventListener(Event.ENTER_FRAME, upFrame);
        }

        private static function endCheck():void
        {
            T.removeEventListener(TimerEvent.TIMER, doTest);
            S.removeEventListener(Event.ENTER_FRAME, upFrame);
            T.stop();
            RT.reset();
            RT.start();
        }

        private static function upFrame(e:Event):void
        {
            FTotal++;
        }

        private static function doTest(e:TimerEvent):void
        {
            if (G > 10)
            {
                endCheck();
                verifyInfo();
            }
            else
            {
                F = (F + (FTotal / 30));
                FTotal = 0;
                G = ((getTimer() - lastTimer) / 1000);
                now = new Date();
                if (now.getUTCSeconds() < lastDate)
                {
                    D = ((59 + now.getUTCSeconds()) - lastDate);
                }
                else
                {
                    D = (now.getUTCSeconds() - lastDate);
                };
            };
        }

        private static function verifyInfo():void
        {
            if ((G - D) > 2)
            {
                // trace(("Unsafe Speed: " + (G - D)));
                dataTracer.DC("You have been disconnected for speed hacking.");
            }
            else
            {
                // trace(("Safe Speed: " + (G - D)));
            };
        }


    }
}//package 

