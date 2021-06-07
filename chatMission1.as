// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//chatMission1

package 
{
    public class chatMission1 
    {


        public static function runAiChat(a:uint):*
        {
            switch (a)
            {
                case 0:
                    chatOrder.SET(false, 0, 0);
                    break;
                case 1:
                    chatBody.sayWhat("Hey Baylet, it's me. Do you copy?");
                    chatBody.resetAll();
                    chatOrder.SET(true, 25, 2, 1);
                    chatBody.addEar(chatEvent.SAY_HI, res1);
                    chatBody.addEar(chatEvent.SAY_YES, res1);
                    chatBody.addEar(chatEvent.SAY_NO, res2);
                    chatBody.addEar("UNIT_DIED", res10);
                    break;
                case 2:
                    chatBody.sayWhat("Baylet, are you there? I need you to answer me!");
                    chatBody.resetAll();
                    chatOrder.SET(true, 15, 3, 1);
                    chatBody.addEar(chatEvent.SAY_HI, res1);
                    chatBody.addEar(chatEvent.SAY_YES, res1);
                    chatBody.addEar(chatEvent.SAY_OK, res1);
                    chatBody.addEar(chatEvent.SAY_NO, res2);
                    chatBody.addEar("UNIT_DIED", res10);
                    break;
                case 3:
                    chatBody.sayWhat("You can talk to me by pressing Enter, typing something, then pressing Enter again to transmit the message.");
                    chatBody.resetAll();
                    chatOrder.SET(false, 0, 0, 1);
                    chatBody.addEar(chatEvent.SAY_HI, res1);
                    chatBody.addEar(chatEvent.SAY_OK, res1);
                    chatBody.addEar(chatEvent.SAY_NO, res2);
                    chatBody.addEar("UNIT_DIED", res10);
                    break;
                case 4:
                    chatBody.sayWhat("Again, I'm sorry for waking you up in the middle of the night...");
                    chatBody.resetAll();
                    chatOrder.SET(true, 9, 5, 1);
                    chatBody.addEar("UNIT_DIED", res10);
                    break;
                case 5:
                    chatBody.sayWhat("But there's been a situation. We've lost contact with all the other settlements.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 11, 6, 1);
                    chatBody.addEar("UNIT_DIED", res10);
                    break;
                case 6:
                    chatBody.sayWhat("It's probably nothing serious...");
                    chatBody.resetAll();
                    chatOrder.SET(true, 10, 7, 1);
                    chatBody.addEar("UNIT_DIED", res10);
                    break;
                case 7:
                    chatBody.sayWhat("In any case, I need you to send some men down to Bjorn's base and find out if the same thing's happened to them.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 10, 8, 1);
                    chatBody.addEar("UNIT_DIED", res10);
                    break;
                case 8:
                    chatBody.sayWhat("First, raise an Outpost on one of your construction platforms.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 12, 9, 1);
                    chatBody.addEar("UNIT_DIED", res10);
                    chatBody.addEar(chatEvent.SAY_HOW, res4);
                    chatBody.addEar(chatEvent.SAY_WHY, res5);
                    break;
                case 9:
                    chatBody.sayWhat("The blue ones are mine, by the way. You have no control over them.");
                    chatBody.resetAll();
                    chatBody.addEar(chatEvent.SAY_HOW, res4);
                    chatBody.addEar("UNIT_DIED", res10);
                    if (!chatBody.gotBuild)
                    {
                        chatOrder.SET(true, 30, 10, 1);
                        chatBody.addEar("B_RIGHT", res11);
                        chatBody.addEar("B_WRONG", res9);
                    }
                    else
                    {
                        chatOrder.SET(true, 10, 20, 1);
                    };
                    break;
                case 10:
                    chatBody.sayWhat("Click on one of the empty red platforms at our base and build an Outpost on it.");
                    chatBody.resetAll();
                    chatBody.addEar("UNIT_DIED", res10);
                    if (!chatBody.gotBuild)
                    {
                        chatOrder.SET(false, 0, 0, 0);
                        chatBody.addEar("B_RIGHT", res11);
                        chatBody.addEar("B_WRONG", res9);
                    }
                    else
                    {
                        chatOrder.SET(true, 10, 20, 1);
                    };
                    break;
                case 11:
                    chatBody.sayWhat("Now, make some Marines from the Outpost. They will automatically head towards Bjorn's settlement.");
                    chatBody.resetAll();
                    chatBody.addEar("UNIT_DIED", res10);
                    chatOrder.SET(true, 15, 12, 1);
                    break;
                case 12:
                    chatBody.sayWhat("We're gonna get to the bottom of this...");
                    chatBody.resetAll();
                    chatBody.addEar("UNIT_DIED", res10);
                    chatOrder.SET(false, 0, 0, 1);
                    break;
                case 13:
                    chatBody.sayWhat("All stations on high alert! Prepare for retaliation!");
                    chatBody.resetAll();
                    mission1StartAi();
                    chatBody.addEar("SAY_HUH", res7);
                    chatOrder.SET(true, 20, 14, 1);
                    break;
                case 14:
                    chatBody.sayWhat("I don't know what happened... Could it be a base malfunction?");
                    chatBody.resetAll();
                    chatOrder.SET(true, 6, 15, 1);
                    break;
                case 15:
                    chatBody.sayWhat("No, wait... Detecting movement from inside their base. There's people behind this!");
                    chatBody.resetAll();
                    chatOrder.SET(true, 7, 16, 1);
                    break;
                case 16:
                    chatBody.sayWhat("Alright, Baylet, are you still there?");
                    chatBody.resetAll();
                    chatBody.addEar(chatEvent.SAY_YES, res8);
                    chatBody.addEar(chatEvent.SAY_HI, res8);
                    chatOrder.SET(true, 25, 17, 1);
                    break;
                case 17:
                    chatBody.sayWhat("Baylet! Answer me, dammit!");
                    chatBody.resetAll();
                    chatBody.addEar(chatEvent.SAY_YES, res8);
                    chatBody.addEar(chatEvent.SAY_HI, res8);
                    chatOrder.SET(false, 0, 0, 1);
                    break;
                case 18:
                    chatBody.sayWhat("We have to send our attacks in waves. Toggle the rally point by pressing X.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 10, 19, 1);
                    break;
                case 19:
                    chatBody.sayWhat("If your rally point is on, any units you will make gather in front of your base, rather than advance forward.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 10, 21, 1);
                    break;
                case 20:
                    chatBody.sayWhat("Oh, I see you already did that. Very well!");
                    chatBody.resetAll();
                    chatOrder.SET(true, 10, 11, 1);
                    break;
                case 21:
                    chatBody.sayWhat("When you think you have enough troops, drag a box around them to select them, and tell them to advance!");
                    chatBody.resetAll();
                    chatOrder.SET(true, 20, 22, 1);
                    break;
                case 22:
                    chatBody.sayWhat("Remember, our Tanks are good against thier ground units, and our marines can shoot rockets at their flying drones.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 15, 23, 1);
                    break;
                case 23:
                    chatBody.sayWhat("When you need more manpower, you can Recruit them from the Outpost.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 12, 24, 1);
                    break;
                case 24:
                    chatBody.sayWhat("If you hold Shift when you build something, it will put that option into auto-build, repeating itself until you cancel it.");
                    chatBody.resetAll();
                    chatOrder.SET(true, 25, 25, 1);
                    break;
                case 25:
                    chatBody.sayWhat("Do not relent! Stop at nothing to bring them down!");
                    chatBody.resetAll();
                    chatOrder.SET(false, 0, 0, 1);
                    break;
            };
        }

        private static function mission1StartAi():void
        {
            gameKon.theRoot.GameKon.player2.startAi(0, 0, 0);
            gameKon.theRoot.GameKon.player3.startAi(0, 1, 2);
            gameKon.theRoot.GameKon.player3.setRes(0, 80);
            gameKon.theRoot.GameKon.player3.setRes(2, 100);
            gameKon.theRoot.GameKon.player2.AI.AiStrategy.forceTech = 1;
            gameKon.theRoot.GameKon.player3.AI.AiStrategy.forceTech = 1;
        }

        private static function res1(ce:chatEvent):void
        {
            chatBody.delaySay("Good. Looks like our communication lines are still working.", 6);
            chatBody.resetAll();
            chatOrder.SET(true, 13, 4, 1);
        }

        private static function res2(ce:chatEvent):void
        {
            chatBody.delaySay("Stop joking around Baylet, we're on a mission here.", 5);
            chatBody.resetAll();
            chatBody.addEar(chatEvent.SAY_SORRY, res3);
            chatOrder.SET(true, 17, 4, 1);
        }

        private static function res3(ce:chatEvent):void
        {
            chatBody.delaySay("It's fine.", 5);
            chatBody.resetAll();
            chatOrder.SET(true, 11, 4, 1);
        }

        private static function res4(ce:chatEvent):void
        {
            chatBody.delaySay("Relax, I'm about to tell you.", 5);
            chatBody.resetAll();
            chatOrder.SET(true, 13, 10, 1);
        }

        private static function res5(ce:chatEvent):void
        {
            chatBody.delaySay("Wh-... Because that's our protocal!", 5);
            chatBody.resetAll();
            chatOrder.SET(true, 15, 9, 1);
        }

        private static function res6(ce:chatEvent):void
        {
            chatBody.resetAll();
            chatOrder.SET(true, 2, 10, 1);
        }

        private static function res7(ce:chatEvent):void
        {
            chatBody.delaySay("Didn't you see? They just shot at our marines!", 5);
            chatBody.resetAll();
            chatOrder.SET(true, 18, 14, 1);
        }

        private static function res8(ce:chatEvent):void
        {
            chatBody.delaySay("Good.", 5);
            chatBody.resetAll();
            chatOrder.SET(true, 11, 18, 1);
        }

        private static function res9(ce:chatEvent):void
        {
            chatBody.delaySay("That's the wrong building! I told you to build an Oupost!", 5);
        }

        private static function res10(ce:chatEvent):void
        {
            chatBody.delaySay("Oh my God... Did they just...", 5);
            chatBody.resetAll();
            chatOrder.SET(true, 11, 13, 1);
        }

        private static function res11(ce:chatEvent):void
        {
            chatBody.delaySay("Good job.", 5);
            chatBody.resetAll();
            chatOrder.SET(true, 11, 11, 1);
        }


    }
}//package 

