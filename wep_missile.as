// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wep_missile

package 
{
    import flash.events.Event;

    public class wep_missile extends displayBody 
    {

        private var tar_x:Number;
        private var tar_y:Number;
        private var angle:Number;
        private var speedX:Number;
        private var speedY:Number;
        private var xSide:Number;
        private var ySide:Number;
        private var hyp:Number;
        private var timeToGo:uint;
        private var damage:Number;
        private var target:unitBody;
        private var EX:Object;
        private var Splash:Number;
        private var WepType:uint;
        private var midTime:Number;
        private var gravity:Number = 0.8;
        private var startYVel:Number;
        private var speed:Number = 8;

        public function wep_missile(id:uint, u:unitBody, dam:Number, s:Number, ex:uint, splash:Number, wepType:uint):void
        {
            speed = s;
            EX = renderMachine.explosions[ex];
            gameKon.displayArray.push(this);
            createDisplay(renderMachine.weapons[id], true);
            target = u;
            damage = dam;
            Splash = splash;
            WepType = wepType;
            addEventListener(Event.ENTER_FRAME, doTrail);
        }

        private function doTrail(event:Event):void
        {
            unitKon.addTrail(1, x, y);
        }

        public function init():void
        {
            tar_x = (((target.x + (target.width / 2)) * 0.97) + (Math.random() * 0.05));
            tar_y = ((target.y * 0.97) + (Math.random() * 0.05));
            if (x > 800)
            {
                soundKon.playSound(0, 0, true);
            }
            else
            {
                soundKon.playSound(0, 0, false);
            };
            xSide = Math.abs((x - tar_x));
            ySide = Math.abs((y - tar_y));
            hyp = Math.sqrt((Math.pow(xSide, 2) + Math.pow(ySide, 2)));
            speedX = ((speed * xSide) / hyp);
            speedY = ((speed * ySide) / hyp);
            if (tar_x < x)
            {
                speedX = (speedX * -1);
            };
            if (tar_y < y)
            {
                speedY = (speedY * -1);
            };
            timeToGo = Math.round((hyp / speed));
            if (target.airUnit)
            {
                speedY = (speedY * 2);
                gravity = (-(speedY) / timeToGo);
            }
            else
            {
                speedY = (speedY - (gravity * (timeToGo / 2)));
            };
            angle = Math.atan((speedX / speedY));
            rotation = ((angle * 180) / Math.PI);
            if (tar_x < x)
            {
                rotation = (180 - rotation);
            };
            if (tar_y < y)
            {
                rotation = (rotation * -1);
            };
            addEventListener(Event.ENTER_FRAME, go);
        }

        public function killEvents():void
        {
            unitKon.killMissile(this);
        }

        public function terminateEvents():void
        {
            stopBullet();
            end();
        }

        public function stopBullet():void
        {
            removeEventListener(Event.ENTER_FRAME, go);
            removeEventListener(Event.ENTER_FRAME, doTrail);
        }

        private function killMain(event:Event):void
        {
            timeToGo = (timeToGo - 1);
            if (timeToGo <= 0)
            {
                removeEventListener(Event.ENTER_FRAME, killMain);
                unitKon.killMissile(this);
            };
        }

        private function hit():void
        {
            var m:* = undefined;
            var tempTar:* = undefined;
            if (x > 800)
            {
                soundKon.playSound(2, 1, true);
            }
            else
            {
                soundKon.playSound(2, 1, false);
            };
            gameKon.shakeScreen(2);
            try
            {
                target.takeHit(damage, WepType);
            }
            catch(e:Error)
            {
            };
            if (Splash > 0)
            {
                for (m in target.team.all)
                {
                    tempTar = target.team.all[m];
                    if (calcHyp(tempTar.x, tempTar.y) <= Splash)
                    {
                        tempTar.takeHit(damage, WepType);
                    };
                };
            };
            stopBullet();
            modeChange(5, EX);
            unitKon.addEx(3, x, y);
            timeToGo = EX.normal.length;
            rotation = 0;
            addEventListener(Event.ENTER_FRAME, killMain);
        }

        private function calcHyp(dX:*, dY:*):*
        {
            xSide = Math.abs((x - dX));
            ySide = Math.abs((y - dY));
            hyp = Math.sqrt((Math.pow(xSide, 2) + Math.pow(ySide, 2)));
            return (hyp);
        }

        private function go(event:Event):void
        {
            x = (x + speedX);
            speedY = (speedY + gravity);
            y = (y + speedY);
            timeToGo = (timeToGo - 1);
            if (timeToGo == 0)
            {
                hit();
            }
            else
            {
                angle = Math.atan((speedY / speedX));
                rotation = ((angle * 180) / Math.PI);
                if (tar_x < x)
                {
                    rotation = (rotation - 180);
                };
            };
        }


    }
}//package 

