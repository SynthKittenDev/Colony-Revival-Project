// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//exBody

package 
{
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.events.Event;
    import flash.display.BitmapData;

    public class exBody extends Sprite 
    {

        public var bitmap:Bitmap;
        private var main:Object;
        private var loopMax:uint;
        private var loopNow:uint;
        private var loopStart:uint;
        private var reCenter:Boolean = false;
        private var velX:Array = new Array();
        private var velY:Array = new Array();
        private var pX:Array = new Array();
        private var pY:Array = new Array();
        private var timeSpread:uint = 9;
        private var spreadMax:uint = timeSpread;

        public function exBody(id:uint, realType:Boolean=true):void
        {
            var a:* = renderMachine.explosions[id];
            if (realType)
            {
                gameKon.shakeScreen(1);
            }
            else
            {
                // trace("MONEY ADD");
                timeSpread = 0;
            };
            addEventListener(Event.ENTER_FRAME, animate);
            bitmap = new Bitmap(a.normal[0]);
            addChild(bitmap);
            main = a;
            loopStart = (loopNow = 0);
            loopMax = main.normal.length;
            bitmap.width = (bitmap.width * renderMachine.poly);
            bitmap.height = (bitmap.height * renderMachine.poly);
            bitmap.x = (-(bitmap.width) / 2);
            bitmap.y = (-(bitmap.height) / 2);
            var f:* = 0;
            while (f < 5)
            {
                velX.push((2 + (Math.random() * 7)));
                velY.push((2 + (Math.random() * 7)));
                f++;
            };
            velX[0] = (velX[0] * -1);
            velX[1] = (velX[1] * -1);
            velY[1] = (velY[1] * -1);
            velY[2] = (velY[2] * -1);
            velY[3] = (velY[3] * -1);
            for (f in velX)
            {
                pX[f] = (velX[f] * 0.7);
                pY[f] = (velY[f] * 0.7);
            };
        }

        private function animate(event:Event):void
        {
            var f:*;
            doDraw(main.normal[loopNow]);
            loopNow++;
            if (timeSpread > 0)
            {
                timeSpread--;
                for (f in velX)
                {
                    pX[f] = (pX[f] + velX[f]);
                    pY[f] = (pY[f] + velY[f]);
                    velY[f] = (velY[f] + 0.8);
                    unitKon.addTrail(8, (x + pX[f]), (y + pY[f]));
                };
            };
            if (loopNow == loopMax)
            {
                end();
                unitKon.killEx(this);
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

