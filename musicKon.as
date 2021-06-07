// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//musicKon

package 
{
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.display.Stage;
    import flash.events.Event;

    public class musicKon 
    {

        private static var MainChannel:SoundChannel = new SoundChannel();
        private static var TransitChannel:SoundChannel = new SoundChannel();
        private static var ThemeChannel:SoundChannel = new SoundChannel();
        private static var MoodChannel:SoundChannel = new SoundChannel();
        private static var masterVol:SoundTransform = new SoundTransform();
        private static var systemShutOff:Boolean = false;
        private static var theSong:*;
        private static var playingSong:*;
        private static var faderDir:Boolean = true;
        private static var currentVol:Number = 0;
        private static var fadeRate:Number;
        private static var initAlready:Boolean = false;
        private static var fadeRateDefault:Number = 0.01;
        private static var oldMode:uint;
        private static var changeCounter:uint;
        private static var prevSong:uint;
        private static var nextMode:Array;
        private static var chosenMode:uint;
        private static var currentMode:uint;
        private static var theStage:Stage;
        private static var playTheme:Boolean = false;
        private static var playTheme2:Boolean = false;
        public static var systemRunning:Boolean = false;
        private static var themeSong:*;
        private static var switchState:Boolean = true;
        private static var yesPlay:Boolean;
        private static var musicArray:Array = new Array();
        private static var musicFills:Array = new Array();
        private static var centi:Number = 3400;


        public static function init(st:Stage):void
        {
            var f1:Fill1;
            var f2:Fill2;
            var f3:Fill3;
            var f4:Fill4;
            var f5:Fill5;
            var f6:Fill6;
            if (!initAlready)
            {
                initAlready = true;
                theStage = st;
                f1 = new Fill1();
                f2 = new Fill2();
                f3 = new Fill3();
                f4 = new Fill4();
                f5 = new Fill5();
                f6 = new Fill6();
                musicFills[0] = new Array();
                musicFills[0].push(null);
                musicFills[0].push(new Array(f1, f2, f3, f6));
                musicFills[0].push(new Array(f3, f6));
                musicFills[1] = new Array();
                musicFills[1].push(new Array(f3, f6));
                musicFills[1].push(new Array(f1, f2, f4, f5));
                musicFills[1].push(new Array(f1, f3, f4, f6));
                musicFills[2] = new Array();
                musicFills[2].push(new Array(f3, f6));
                musicFills[2].push(new Array(f3, f6));
                musicFills[2].push(new Array(f1, f2, f4));
                musicArray[0] = new Object();
                musicArray[0].canGo = new Array(1, 2);
                musicArray[0].playTimes = 1;
                musicArray[0].array = new Array();
                musicArray[0].array.push(new Ambient1());
                musicArray[0].array.push(new Ambient2());
                musicArray[0].array.push(new Ambient3());
                musicArray[1] = new Object();
                musicArray[1].canGo = new Array(0, 2);
                musicArray[1].playTimes = 1;
                musicArray[1].array = new Array();
                musicArray[1].array.push(new Beat1());
                musicArray[1].array.push(new Beat2());
                musicArray[1].array.push(new Beat3());
                musicArray[1].array.push(new Beat4());
                musicArray[1].array.push(new Beat5());
                musicArray[2] = new Object();
                musicArray[2].canGo = new Array(0, 1);
                musicArray[2].playTimes = 0;
                musicArray[2].array = new Array();
                musicArray[2].array.push(new Slow1());
                musicArray[2].array.push(new Slow2());
                masterVol.volume = currentVol;
                MainChannel.soundTransform = masterVol;
                TransitChannel.soundTransform = masterVol;
                ThemeChannel.soundTransform = masterVol;
                MoodChannel.soundTransform = masterVol;
                resetAllMusic();
            };
        }

        public static function setTheme(a:uint):*
        {
            if (a == 0)
            {
                themeSong = new FascistTheme();
            };
            if (a == 1)
            {
                themeSong = new CommunistTheme();
            };
            if (a == 2)
            {
                themeSong = new CapitalistTheme();
            };
            if (a == 3)
            {
                themeSong = null;
            };
        }

        public static function startSystem():void
        {
            resetAllMusic();
            systemRunning = true;
            yesPlay = true;
            theStage.addEventListener(Event.ENTER_FRAME, runMusic, false, 0, true);
        }

        public static function closeSystem():void
        {
            systemRunning = false;
            MainChannel.stop();
            theStage.removeEventListener(Event.ENTER_FRAME, runMusic);
        }

        private static function runFader(event:Event):void
        {
            if (faderDir)
            {
                if (currentVol < 1)
                {
                    currentVol = (currentVol + fadeRate);
                }
                else
                {
                    currentVol = 1;
                    endFader();
                };
            }
            else
            {
                if (currentVol > 0)
                {
                    currentVol = (currentVol - fadeRate);
                }
                else
                {
                    currentVol = 0;
                    endFader();
                };
            };
            masterVol.volume = currentVol;
            MainChannel.soundTransform = masterVol;
            TransitChannel.soundTransform = masterVol;
            ThemeChannel.soundTransform = masterVol;
            MoodChannel.soundTransform = masterVol;
        }

        private static function endFader():void
        {
            if (systemShutOff)
            {
                closeSystem();
            };
            theStage.removeEventListener(Event.ENTER_FRAME, runFader);
        }

        private static function resetAllMusic():void
        {
            prevSong = 0;
            nextMode = new Array();
            chosenMode = 0;
            currentMode = 0;
            changeCounter = 1;
            playTheme = false;
            switchState = true;
            playingSong = musicArray[0].array[0];
        }

        public static function startFader(r:Number=0, fType:uint=0):void
        {
            if (r == 0)
            {
                fadeRate = fadeRateDefault;
            }
            else
            {
                fadeRate = r;
            };
            systemShutOff = false;
            if (fType == 1)
            {
                faderDir = true;
                if (!systemRunning)
                {
                    startSystem();
                };
            };
            if (fType == 2)
            {
                faderDir = false;
                systemShutOff = true;
            };
            theStage.addEventListener(Event.ENTER_FRAME, runFader, false, 0, true);
        }

        private static function runMusic(event:Event):void
        {
            if (yesPlay)
            {
                MainChannel = playingSong.play();
                yesPlay = false;
            };
            if (G(MainChannel.position) >= (centi - 265))
            {
                if (switchState)
                {
                    switchMusic();
                    switchState = false;
                };
            };
            if (G(MainChannel.position) >= 840)
            {
                if (((playTheme2) && (!(themeSong == null))))
                {
                    if (prevSong != 2)
                    {
                        ThemeChannel = themeSong.play();
                    };
                    playTheme2 = false;
                };
            };
            if (G(MainChannel.position) >= (centi - 15))
            {
                MainChannel = theSong.play();
                playingSong = theSong;
                switchState = true;
                if (playTheme)
                {
                    playTheme = false;
                    playTheme2 = true;
                };
            };
        }

        private static function switchMusic():void
        {
            var songGet:Boolean;
            var testSong:uint;
            var TS:*;
            oldMode = currentMode;
            if (changeCounter > 0)
            {
                if (((changeCounter == 1) && (currentMode == 0)))
                {
                    playTheme = true;
                };
                songGet = false;
                while ((!(songGet)))
                {
                    testSong = R(musicArray[currentMode].array);
                    if (testSong != prevSong)
                    {
                        prevSong = testSong;
                        changeCounter--;
                        songGet = true;
                    }
                    else
                    {
                        songGet = false;
                    };
                };
            }
            else
            {
                currentMode = R(musicArray[currentMode].canGo, true);
                changeCounter = musicArray[currentMode].playTimes;
                prevSong = R(musicArray[currentMode].array);
            };
            theSong = musicArray[currentMode].array[prevSong];
            if (((!(currentMode == 0)) || (!(oldMode == 0))))
            {
                TS = R(musicFills[oldMode][currentMode], true);
                TransitChannel = TS.play();
            };
        }

        private static function G(a:Number):Number
        {
            return (Math.round((a / 10)));
        }

        private static function R(a:Array, returnVal:Boolean=false):*
        {
            var rander:Number = (Math.random() * 100);
            var rtake:* = Math.round(((rander * (a.length - 1)) / 100));
            if (returnVal)
            {
                return (a[rtake]);
            };
            return (rtake);
        }


    }
}//package 

