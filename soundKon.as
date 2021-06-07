// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//soundKon

package 
{
    import flash.utils.Timer;
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.events.TimerEvent;

    public class soundKon 
    {

        private static var T:Timer = new Timer(10);
        private static var sfxArray:Array = new Array();
        private static var playCheck:Array = new Array();
        public static var soundOn:Boolean = true;
        private static var sChanL:SoundChannel = new SoundChannel();
        private static var sChanR:SoundChannel = new SoundChannel();
        private static var RightMixer:SoundTransform = new SoundTransform();
        private static var LeftMixer:SoundTransform = new SoundTransform();


        public static function init():void
        {
            T.start();
            T.addEventListener(TimerEvent.TIMER, clearPlayed);
            sfxArray[0] = new Array();
            sfxArray[0].push({
                "played":false,
                "s":null
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot1()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot2()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot3()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot4()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot5()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot6()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot7()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot8()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot9()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot10()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot11()
            });
            sfxArray[0].push({
                "played":false,
                "s":new sfx_shot12()
            });
            sfxArray[1] = new Array();
            sfxArray[1].push({
                "played":false,
                "s":null
            });
            sfxArray[1].push({
                "played":false,
                "s":new sfx_death1()
            });
            sfxArray[1].push({
                "played":false,
                "s":new sfx_death2()
            });
            sfxArray[1].push({
                "played":false,
                "s":new sfx_death3()
            });
            sfxArray[1].push({
                "played":false,
                "s":new sfx_death4()
            });
            sfxArray[1].push({
                "played":false,
                "s":new sfx_death5()
            });
            sfxArray[1].push({
                "played":false,
                "s":new sfx_death6()
            });
            sfxArray[1].push({
                "played":false,
                "s":new sfx_death7()
            });
            sfxArray[2] = new Array();
            sfxArray[2].push({
                "played":false,
                "s":null
            });
            sfxArray[2].push({
                "played":false,
                "s":new sfx_ex1()
            });
            sfxArray[2].push({
                "played":false,
                "s":new sfx_ex2()
            });
            sfxArray[2].push({
                "played":false,
                "s":new sfx_ex3()
            });
            sfxArray[2].push({
                "played":false,
                "s":new sfx_ex4()
            });
            sfxArray[2].push({
                "played":false,
                "s":new sfx_ex5()
            });
            sfxArray[3] = new Array();
            sfxArray[3].push({
                "played":false,
                "s":null
            });
            sfxArray[3].push({
                "played":false,
                "s":new sfx_inter1()
            });
            sfxArray[3].push({
                "played":false,
                "s":new sfx_inter2()
            });
            sfxArray[3].push({
                "played":false,
                "s":new sfx_inter3()
            });
        }

        public static function surround(a:Number):void
        {
            var leftVol:Number;
            var rightVol:Number;
            var leftPan:Number = (((a * -1) * 0.35) - 0.35);
            var rightPan:Number = ((a * -0.35) + 0.35);
            if (a < -1)
            {
                a = -1;
            };
            if (a > 1)
            {
                a = 1;
            };
            if (a > 0)
            {
                leftVol = (1 - (a * 0.5));
            }
            else
            {
                leftVol = 1;
            };
            if (a < 0)
            {
                rightVol = (1 + (a * 0.5));
            }
            else
            {
                rightVol = 1;
            };
            RightMixer.volume = rightVol;
            LeftMixer.volume = leftVol;
            RightMixer.pan = rightPan;
            LeftMixer.pan = leftPan;
            sChanL.soundTransform = LeftMixer;
            sChanR.soundTransform = RightMixer;
        }

        public static function playSound(pool:uint=0, sound:uint=0, chan:Boolean=false):void
        {
            if (soundOn)
            {
                if (sound != 0)
                {
                    if (!sfxArray[pool][sound].played)
                    {
                        if (chan)
                        {
                            sChanR = sfxArray[pool][sound].s.play();
                        }
                        else
                        {
                            sChanL = sfxArray[pool][sound].s.play();
                        };
                        if (((!(pool == 3)) && (!(sound == 3))))
                        {
                            sfxArray[pool][sound].played = true;
                        };
                    };
                };
            };
        }

        private static function clearPlayed(te:TimerEvent):void
        {
            var i:*;
            var j:*;
            for (i in sfxArray)
            {
                for (j in sfxArray[i])
                {
                    sfxArray[i][j].played = false;
                };
            };
        }


    }
}//package 

