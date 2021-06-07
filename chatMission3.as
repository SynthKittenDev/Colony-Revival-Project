// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//chatMission3

package 
{
    public class chatMission3 
    {


        public static function runAiChat(a:uint):*
        {
            switch (a)
            {
                case 0:
                    chatOrder.SET(false, 0, 0);
                    break;
                case 1:
                    chatBody.sayWhat("Hang in there, Baylet! We're on our way!");
                    chatBody.resetAll();
                    chatOrder.SET(true, 10, 2, 3);
                    break;
                case 2:
                    chatBody.sayWhat("We've just arrived... Man the battle stations!");
                    chatBody.resetAll();
                    chatOrder.SET(true, 25, 3, 3);
                    missionStartAi();
                    break;
                case 3:
                    chatBody.sayWhat("Alright, you've made it this far... Now destroy them!");
                    chatBody.resetAll();
                    chatOrder.SET(false, 0, 0, 3);
                    break;
            };
        }

        private static function missionStartAi():void
        {
            gameKon.theRoot.GameKon.player2.startAi(0, 2, 0);
            gameKon.theRoot.GameKon.player2.setRes(0, 80);
            gameKon.theRoot.GameKon.player2.setRes(1, 80);
        }


    }
}//package 

