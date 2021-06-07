// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//chatMission4

package 
{
    public class chatMission4 
    {


        public static function runAiChat(a:uint):*
        {
            switch (a)
            {
                case 0:
                    chatOrder.SET(false, 0, 0);
                    break;
                case 1:
                    chatBody.sayWhat("Another fine evening, Jetzul...");
                    chatBody.resetAll();
                    chatOrder.SET(true, 10, 2, 4);
                    break;
                case 2:
                    chatBody.sayWhat("Let's deal with this the old fashioned way.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 40, 3, 4);
                    break;
                case 3:
                    chatBody.sayWhat("Now that we're on a secure channel... Has a person calling himself P been contacting you as well?");
                    chatBody.resetAll();
                    chatBody.addEar(chatEvent.SAY_YES, res1);
                    chatBody.addEar(chatEvent.SAY_NO, res2);
                    chatOrder.SET(true, 100, 4, 4);
                    break;
                case 4:
                    chatBody.sayWhat("Jetzul, tell me... Do you believe in the conspiracy?");
                    chatBody.resetAll();
                    chatOrder.SET(false, 0, 0);
                    chatBody.addEar(chatEvent.SAY_WHAT, res5);
                    chatBody.addEar(chatEvent.SAY_YES, res6);
                    chatBody.addEar(chatEvent.SAY_NO, res7);
                    break;
                case 5:
                    chatBody.sayWhat("Okay, you know how the prisoner transfer operation back in 2265 was kept under wraps...");
                    chatBody.resetAll();
                    chatOrder.SET(true, 11, 6, 4);
                    break;
                case 6:
                    chatBody.sayWhat("The Athenians don't even know about us, and all the other labourers here.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 11, 7, 4);
                    break;
                case 7:
                    chatBody.sayWhat("And the rumor is, once they develop the Romans into manual labour androids, they're going to...");
                    chatBody.resetAll();
                    chatOrder.SET(true, 5, 8, 4);
                    break;
                case 8:
                    chatBody.sayWhat("'Clean up.'");
                    chatBody.resetAll();
                    chatOrder.SET(true, 8, 9, 4);
                    break;
                case 9:
                    chatBody.sayWhat("Do you think it's true?");
                    chatBody.resetAll();
                    chatBody.addEar(chatEvent.SAY_YES, res6);
                    chatBody.addEar(chatEvent.SAY_NO, res7);
                    chatOrder.SET(false, 0, 0);
                    break;
                case 10:
                    chatBody.sayWhat("I don't know what to make of it myself. But I'll keep my eyes open.");
                    chatBody.resetAll(true);
                    chatOrder.SET(false, 0, 0);
                    break;
            };
        }

        private static function res1(ce:chatEvent):void
        {
            chatBody.delaySay("I thought so. Do you know him personally?", 6);
            chatBody.resetAll();
            chatBody.addEar(chatEvent.SAY_YES, res3);
            chatBody.addEar(chatEvent.SAY_NO, res4);
            chatOrder.SET(true, 103, 4, 4);
        }

        private static function res2(ce:chatEvent):void
        {
            chatBody.delaySay("I see... Odd...", 3);
            chatBody.resetAll();
            chatOrder.SET(true, 53, 4, 4);
        }

        private static function res3(ce:chatEvent):void
        {
            chatBody.delaySay("Really? I suppose we can trust him then...", 6);
            chatBody.resetAll();
            chatOrder.SET(true, 53, 4, 4);
        }

        private static function res4(ce:chatEvent):void
        {
            chatBody.delaySay("Me neither. He's probably a USC official himself... Who else could give us such military technology?", 6);
            chatBody.resetAll();
            chatOrder.SET(true, 53, 4, 4);
        }

        private static function res5(ce:chatEvent):void
        {
            chatBody.delaySay("You haven't heard?! Have you been living under a rock?", 6);
            chatBody.resetAll();
            chatOrder.SET(true, 18, 5, 4);
        }

        private static function res6(ce:chatEvent):void
        {
            chatBody.delaySay("I see. It's a terrifying prospect, isn't it.", 6);
            chatBody.resetAll();
            chatOrder.SET(true, 28, 10, 4);
        }

        private static function res7(ce:chatEvent):void
        {
            chatBody.delaySay("You're not easily shaken, are you.", 6);
            chatBody.resetAll();
            chatOrder.SET(true, 18, 10, 4);
        }


    }
}//package 

