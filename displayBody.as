// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//displayBody

package 
{
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.events.Event;
    import flash.display.BitmapData;

    public class displayBody extends Sprite 
    {

        public var bitmap:Bitmap;
        private var main:Object;
        private var loopMax:uint;
        private var loopNow:uint;
        private var loopStart:uint;
        private var currentMode:uint;
        private var reCenter:Boolean = false;


        public function createDisplay(a:Object, c:Boolean=false, doAnim:Boolean=true):void
        {
            if (doAnim)
            {
                addEventListener(Event.ENTER_FRAME, animate);
            };
            bitmap = new Bitmap(a.normal[0]);
            addChild(bitmap);
            main = a;
            loopStart = (loopNow = 0);
            loopMax = main.normal.length;
            bitmap.width = (bitmap.width * renderMachine.poly);
            bitmap.height = (bitmap.height * renderMachine.poly);
            reCenter = c;
            currentMode = 0;
            bitmap.x = (-(bitmap.width) / 2);
            bitmap.y = (-(bitmap.height) / 2);
        }

        private function animate(event:Event):void
        {
            catchAnimate();
        }

        private function catchAnimate():void
        {
            doDraw(main.normal[loopNow]);
            loopNow++;
            if (loopNow == loopMax)
            {
                if (currentMode == 2)
                {
                    currentMode = 1;
                    modeChange(0);
                }
                else
                {
                    loopNow = loopStart;
                };
            };
        }

        public function modeChange(a:uint, a2:Object=null):void
        {
            if (!((currentMode == 2) && (!(a == 3))))
            {
                if (a != currentMode)
                {
                    currentMode = a;
                    if (a == 0)
                    {
                        loopStart = (loopNow = 0);
                        loopMax = main.run;
                    };
                    if (a == 1)
                    {
                        loopStart = (loopNow = main.run);
                        loopMax = (main.fire - main.prefire);
                    };
                    if (a == 2)
                    {
                        loopStart = (loopNow = main.fire);
                        loopMax = main.death;
                    };
                    if (a == 3)
                    {
                        loopStart = (loopNow = main.death);
                        loopMax = main.normal.length;
                    };
                    if (a == 4)
                    {
                        loopStart = (loopNow = (main.fire - main.prefire));
                        loopMax = main.death;
                    };
                    if (a == 5)
                    {
                        main = a2;
                        loopStart = (loopNow = 0);
                        loopMax = main.normal.length;
                        catchAnimate();
                    };
                };
            };
        }

        private function doDraw(a:BitmapData):void
        {
            bitmap.bitmapData = a;
            if (reCenter)
            {
                bitmap.x = (-(bitmap.width) / 2);
                bitmap.y = (-(bitmap.height) / 2);
            };
        }

        public function end():void
        {
            removeEventListener(Event.ENTER_FRAME, animate);
            try
            {
                removeChild(bitmap);
                bitmap = null;
            }
            catch(e:Error)
            {
            };
        }


    }
}//package 

