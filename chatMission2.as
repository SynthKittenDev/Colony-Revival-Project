// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//chatMission2

package 
{
    public class chatMission2 
    {


        public static function runAiChat(a:uint):*
        {
            switch (a)
            {
                case 0:
                    chatOrder.SET(false, 0, 0);
                    break;
                case 1:
                    chatBody.sayWhat("Good evening, Jetzul.");
                    chatBody.resetAll();
                    chatBody.addEar(chatEvent.SAY_HI, res1);
                    chatOrder.SET(true, 30, 2, 2);
                    break;
                case 2:
                    chatBody.sayWhat("They're going to have heavy security around the Sakata technology.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 15, 3, 2);
                    break;
                case 3:
                    chatBody.sayWhat("Raise a Forge and upgrade it to a Manufactory, so then we can tear them up with our Phantoms.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 160, 4, 2);
                    break;
                case 4:
                    chatBody.sayWhat("Jetzul, I want to see you control those units of yours more! A good captain gives orders!");
                    chatBody.resetAll();
                    chatBody.addEar(chatEvent.SAY_HOW, res4);
                    chatOrder.SET(true, 300, 5, 2);
                    break;
                case 5:
                    chatBody.sayWhat("Crush them! The USC are going to have thier communication satellite back up any time now!");
                    chatBody.resetAll();
                    chatOrder.SET(false, 0, 0);
                    break;
            };
        }

        private static function res1(ce:chatEvent):void
        {
            chatBody.delaySay("Enjoying the breeze?", 6);
            chatBody.resetAll();
            chatBody.addEar(chatEvent.SAY_YES, res2);
            chatBody.addEar(chatEvent.SAY_NO, res3);
            chatOrder.SET(true, 18, 2, 2);
        }

        private static function res2(ce:chatEvent):void
        {
            chatBody.delaySay("Spendid! Well that's enough small talk, let's get down to business.", 6);
            chatBody.resetAll();
            chatOrder.SET(true, 18, 2, 2);
        }

        private static function res3(ce:chatEvent):void
        {
            chatBody.delaySay("Odd... I guess you belong in prison.", 6);
            chatBody.resetAll();
            chatOrder.SET(true, 18, 2, 2);
        }

        private static function res4(ce:chatEvent):void
        {
            chatBody.delaySay("Select troops and pull them back when they are weak, and send them out in groups.", 6);
            chatBody.resetAll();
            chatOrder.SET(true, 300, 5, 2);
        }


    }
}//package 

