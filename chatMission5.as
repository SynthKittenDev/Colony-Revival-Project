// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//chatMission5

package 
{
    public class chatMission5 
    {


        public static function runAiChat(a:uint):*
        {
            switch (a)
            {
                case 0:
                    chatOrder.SET(false, 0, 0);
                    break;
                case 1:
                    chatBody.sayWhat("Alright Baylet, we're on our own...");
                    chatBody.resetAll();
                    chatOrder.SET(true, 7, 2, 5);
                    break;
                case 2:
                    chatBody.sayWhat("... But there's a way out of this!");
                    chatBody.resetAll();
                    chatOrder.SET(true, 18, 3, 5);
                    break;
                case 3:
                    chatBody.sayWhat("I'm going to cover for you while you construct a Special Operations center.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 11, 4, 5);
                    break;
                case 4:
                    chatBody.sayWhat("You'll need a lot of resources to operate it though. But do this, and we'll burn them to ashes!");
                    chatBody.resetAll();
                    chatOrder.SET(true, 80, 5, 5);
                    break;
                case 5:
                    chatBody.sayWhat("Time your strikes well, Baylet! Try to kill as many of them as you can with each shot!");
                    chatBody.resetAll(true);
                    chatOrder.SET(false, 0, 0);
                    break;
            };
        }


    }
}//package 

