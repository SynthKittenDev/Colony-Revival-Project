// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//weapon

package 
{
    import flash.display.Sprite;
    import flash.events.Event;

    public class weapon extends Sprite 
    {

        public var reloadTime:Number;
        public var reloadNow:Number = 0;
        public var weaponRange:Number;
        public var weaponType:uint = 0;
        public var weaponDamage:Number;
        public var weaponSplash:Number;
        public var weaponShock:Boolean;
        public var weaponGraphic:uint;
        public var weaponExplosion:Object;
        private var weaponSpeed:Number;
        private var weaponTrail:Number;
        public var kiting:Boolean = false;
        public var kitingTime:uint = 0;
        private var weaponShotSFX:uint;
        private var weaponExSFX:uint;
        private var healer:Boolean = false;
        private var t:unitBody;
        private var ownUnit:unitBody;

        public function weapon(o:unitBody, w:uint):void
        {
            var wepLoad:* = weaponData.LIST[w];
            reloadTime = wepLoad[0];
            weaponSpeed = wepLoad[1];
            weaponRange = wepLoad[2];
            weaponDamage = wepLoad[3];
            weaponSplash = wepLoad[4];
            weaponShock = wepLoad[5];
            weaponGraphic = wepLoad[6];
            weaponExplosion = renderMachine.explosions[wepLoad[7]];
            weaponType = wepLoad[8];
            weaponTrail = wepLoad[9];
            weaponShotSFX = wepLoad[10];
            weaponExSFX = wepLoad[11];
            ownUnit = o;
            reloadNow = reloadTime;
        }

        public function engage(h:Boolean):void
        {
            healer = h;
            addEventListener(Event.ENTER_FRAME, work);
        }

        public function disengage():void
        {
            removeEventListener(Event.ENTER_FRAME, work);
        }

        private function work(event:Event):void
        {
            if (reloadNow == 0)
            {
                addEventListener(Event.ENTER_FRAME, reload);
            }
            else
            {
                if (reloadNow == reloadTime)
                {
                    reloadNow = 0;
                    fire();
                };
            };
            if (Math.round((reloadTime - reloadNow)) == ownUnit.prefire)
            {
                ownUnit.modeChange(4);
            };
        }

        private function fire():void
        {
            if (ownUnit.x > 800)
            {
                soundKon.playSound(0, weaponShotSFX, true);
            }
            else
            {
                soundKon.playSound(0, weaponShotSFX);
            };
            ownUnit.modeChange(2);
            var bullet:wep_projectile = new wep_projectile(weaponGraphic, ownUnit, weaponDamage, weaponSpeed, weaponExplosion, weaponShock, weaponSplash, healer, weaponType, weaponTrail, weaponExSFX);
            unitKon.addBullet(bullet, ownUnit);
        }

        private function reload(event:Event):void
        {
            if (reloadNow < reloadTime)
            {
                reloadNow = (reloadNow + _t.theFactor);
            }
            else
            {
                reloadNow = reloadTime;
                removeEventListener(Event.ENTER_FRAME, reload);
            };
        }


    }
}//package 

