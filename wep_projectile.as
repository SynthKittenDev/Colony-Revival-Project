// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wep_projectile

package 
{
    import flash.events.Event;

    public class wep_projectile extends displayBody 
    {

        private var tar_x:Number;
        private var tar_y:Number;
        private var angle:Number;
        private var speedX:Number;
        private var speedY:Number;
        private var xSide:Number;
        private var ySide:Number;
        private var hyp:Number;
        private var timeToGo:Number;
        private var damage:Number;
        private var target:unitBody;
        private var EX:Object;
        private var Shock:Boolean;
        private var Splash:Number;
        private var WepType:uint;
        private var wepTrail:uint;
        private var shooter:unitBody;
        private var p:playerKon = null;
        private var sound:uint;
        private var speed:Number = 8;

        public function wep_projectile(id:uint, u:unitBody, dam:Number, s:Number, ex:Object, shock:Boolean, splash:Number, heal:Boolean, wepType:uint, trail:uint=0, sound:uint=0):void
        {
            speed = s;
            EX = ex;
            shooter = u;
            this.sound = sound;
            if (u.assocBase == null)
            {
                p = u.player;
            };
            gameKon.displayArray.push(this);
            createDisplay(renderMachine.weapons[id], true);
            target = u.mainTarget;
            Shock = shock;
            Splash = splash;
            WepType = wepType;
            if (heal)
            {
                damage = -(dam);
            }
            else
            {
                damage = dam;
            };
            if (trail > 0)
            {
                wepTrail = trail;
                addEventListener(Event.ENTER_FRAME, doTrail);
            };
        }

        private function doTrail(event:Event):void
        {
            unitKon.addTrail(wepTrail, x, y);
        }

        private function getRand():*
        {
            return (5 - (Math.random() * 10));
        }

        public function init(u:unitBody):void
        {
            tar_x = ((u.mainTarget.x + (u.mainTarget.width / 2)) + getRand());
            tar_y = (u.mainTarget.y + getRand());
            if (Shock)
            {
                x = (tar_x + getRand());
                y = (tar_y + getRand());
                hit();
            }
            else
            {
                xSide = Math.abs((x - tar_x));
                ySide = Math.abs((y - tar_y));
                hyp = Math.sqrt((Math.pow(xSide, 2) + Math.pow(ySide, 2)));
                angle = Math.atan((ySide / xSide));
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
                timeToGo = (hyp / speed);
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
            };
        }

        public function killEvents():void
        {
            unitKon.killBullet(this);
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
                unitKon.killBullet(this);
            };
        }

        private function hit():void
        {
            var m:* = undefined;
            var tempTar:* = undefined;
            if (x > 800)
            {
                soundKon.playSound(2, sound, true);
            }
            else
            {
                soundKon.playSound(2, sound, false);
            };
            try
            {
                target.takeHit(damage, WepType, shooter, p);
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
            timeToGo = EX.normal.length;
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
            x = (x + (speedX * _t.theFactor));
            y = (y + (speedY * _t.theFactor));
            timeToGo = (timeToGo - _t.theFactor);
            if (timeToGo <= 0)
            {
                hit();
            };
        }


    }
}//package 

