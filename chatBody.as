// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//chatBody

package 
{
    import flash.display.Sprite;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class chatBody extends Sprite 
    {

        private static var C:Sprite;
        public static var addStandard:Boolean;
        private static var T:Timer;
        public static var stepCount:uint;
        private static var delayArray:Array;
        private static var previousDanger:uint;
        public static var pName:String;
        public static var pCol:uint;
        public static var gotBuild:Boolean;
        public static var needBuild:uint;
        public static var chatOn:Boolean = false;
        private static var previousAction:uint;
        private static var previousTime:uint;
        private static var noMoreUpgrade:uint;
        private static var noMoreDanger:uint;
        public static var C_GREET:String;
        public static var C_NAME:String;
        public static var C_AGE:String;
        public static var C_LIKE:String;
        public static var C_MAKE:String;
        public static var C_DO:String;
        private static var missionMode:Boolean = false;
        private static var RE_HI:RegExp = /hey|hi|hello|greetings|sup|yo|heya|oi|morning|good evening| good morning|howdy|gday/i;
        private static var RE_OK:RegExp = /sure|ok|yes|alright|aight|okay|yes sir|you got it|uh huh|righto|ya|yeah|right|ye|yup|yep|fine/i;
        private static var RE_SHUT:RegExp = /that's enough|shut up|shutup|shaddap|stop it|stop talking|be quiet/i;
        private static var RE_YES:RegExp = /sure|alright|ok|okay|yes|ya|yes|yeah|yeh|yessir|si|oui|ja|why not|yup|yep|ye|please|fine/i;
        private static var RE_NO:RegExp = /no|nope|nah|naw|not really/i;
        private static var RE_SORRY:RegExp = /apologies|i apologize|sorry|sry|soz/i;
        private static var RE_THANKS:RegExp = /thanks|thankyou|thank you|ty/i;
        private static var RE_HELP:RegExp = /help|hlp/i;
        private static var RE_WHY:RegExp = /why?|what for?/i;
        private static var RE_WHAT:RegExp = /what|which/i;
        private static var RE_HOW:RegExp = /how?|how do i|how/i;
        private static var RE_HUH:RegExp = /huh?|what('s| is|) (going on|happening|happened)|/i;
        private static var RE_INSULT:RegExp = /(fuck|fuk) (you|u|off)|sod off|(you|u) (are stupid|suck|r stupid)|(you're|ur) (a moron|stupid|dumb)/i;
        private static var RE_NAME:RegExp = /what(s| is|'s) (your|ur) (name|full name)/i;
        private static var RE_AGE:RegExp = /how old (are|r) (you|u)|what(s|'s) (your|ur) age/i;
        private static var RE_LIKE:RegExp = /(what|wut|wt|wat) do (you|u) like|what's your favourite thing/i;
        private static var RE_DO:RegExp = /(what|wut|wat) (should i|do u want me to ) (do|make|build)|what do i (make|build|do)/i;
        private static var RE_MAKE:RegExp = /(what|wat|wut) (r|are|will) (you|u) (going to do|doing|do|make|making|building|build|going to make)/i;
        private static var RE_HUMAN:RegExp = /are you human|are you a person|who are you|are you real|are u human|are u a person/i;


        public static function setAction():void
        {
            addEar("A_GROUP", a_group);
            addEar("A_ATTACK", a_attack);
            addEar("A_SAVE", a_save);
            addEar("A_RESUME", a_resume);
            addEar("A_SAVE2", a_save2);
            addEar("A_C1", a_c1);
            addEar("A_C2", a_c2);
            addEar("A_C3", a_c3);
            addEar("A_C4", a_c4);
            addEar("A_C5", a_c5);
            addEar("A_C6", a_c6);
            addEar("A_C7", a_c7);
            addEar("A_C8", a_c8);
            addEar("A_C9", a_c9);
            addEar("A_C11", a_c11);
            addEar("C_DO", ac_do);
            addEar("C_NAME", ac_name);
            addEar("C_AGE", ac_age);
            addEar("C_LIKE", ac_like);
            addEar("C_MAKE", ac_make);
            addEar("C_HUMAN", ac_human);
        }

        public static function killAll():void
        {
            if (chatOn)
            {
                T.stop();
                T.removeEventListener(TimerEvent.TIMER, putItUp);
                T = null;
                C = null;
                chatOn = false;
            };
        }

        public static function init(t:uint):void
        {
            noMoreUpgrade = 100;
            noMoreDanger = 60;
            previousAction = 0;
            previousTime = 0;
            previousDanger = 0;
            T = new Timer(500);
            T.start();
            T.addEventListener(TimerEvent.TIMER, putItUp, false, 0, true);
            stepCount = 0;
            delayArray = new Array();
            gotBuild = false;
            addStandard = false;
            needBuild = 99;
            chatOn = true;
            missionMode = true;
            if (t == 0)
            {
                addStandard = true;
                missionMode = false;
                chatOrder.SET(false, 0, 0);
            }
            else
            {
                if (t == 1)
                {
                    needBuild = 2;
                    missionMode = false;
                    chatOrder.SET(true, 3, 1);
                }
                else
                {
                    if (t == 2)
                    {
                        pName = "Cpt. Jorin";
                        pCol = 2;
                        needBuild = 2;
                        C_NAME = "Hans Jorin";
                        chatOrder.SET(true, 3, 1, 1);
                    }
                    else
                    {
                        if (t == 3)
                        {
                            pName = "Cpt. Beatrix";
                            C_NAME = "Erika Beatrix";
                            chatOrder.SET(true, 3, 1, 2);
                        }
                        else
                        {
                            if (t == 4)
                            {
                                pName = "General Glastondale";
                                C_NAME = "Sir Miles Glastondale";
                                pCol = 2;
                                chatOrder.SET(true, 240, 1, 3);
                            }
                            else
                            {
                                if (t == 5)
                                {
                                    pName = "Cpt. Beatrix";
                                    C_NAME = "Erika Beatrix";
                                    chatOrder.SET(true, 7, 1, 4);
                                }
                                else
                                {
                                    if (t == 6)
                                    {
                                        pName = "General Mortfang";
                                        C_NAME = "Lux Mortfang";
                                        chatOrder.SET(true, 7, 1, 5);
                                    }
                                    else
                                    {
                                        if (t == 7)
                                        {
                                            pName = "Haxel";
                                            C_NAME = "Julio Haxel";
                                            chatOrder.SET(true, 7, 1, 6);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            resetAll(addStandard);
        }

        private static function putItUp(e:TimerEvent):void
        {
            var i:*;
            stepCount++;
            if (noMoreDanger > 0)
            {
                noMoreDanger--;
                trace(("NMD " + noMoreDanger));
            };
            if (noMoreUpgrade > 0)
            {
                noMoreUpgrade--;
            };
            if (previousTime > 0)
            {
                previousTime--;
            }
            else
            {
                previousAction = 0;
            };
            for (i in delayArray)
            {
                delayArray[i].T--;
                if (delayArray[i].T == 0)
                {
                    sayWhat(delayArray[i].R);
                    delayArray.splice(i, 1);
                };
            };
            if (chatOrder.act)
            {
                if (stepCount >= chatOrder.timeCount)
                {
                    chatOrder.go();
                };
            };
        }

        public static function resetAll(AS:Boolean=false):void
        {
            C = new Sprite();
            if (!missionMode)
            {
                addEar("SHUTUP", shut);
            }
            else
            {
                addEar("SHUTUP", shut2);
            };
            addEar("INSULT", insult);
            if (AS)
            {
                addEar(chatEvent.SAY_HI, greet_1);
            };
        }

        public static function dealWith(r:String):void
        {
            if (chatOn)
            {
                if (RE_SORRY.test(r))
                {
                    sendEv(chatEvent.SAY_SORRY);
                };
                if (RE_THANKS.test(r))
                {
                    sendEv(chatEvent.THANKS);
                };
                if (RE_HELP.test(r))
                {
                    sendEv(chatEvent.HELP);
                };
                if (RE_INSULT.test(r))
                {
                    sendEv(chatEvent.INSULT);
                };
                if (RE_HOW.test(r))
                {
                    sendEv(chatEvent.SAY_HOW);
                };
                if (RE_WHAT.test(r))
                {
                    sendEv(chatEvent.SAY_WHAT);
                };
                if (RE_WHY.test(r))
                {
                    sendEv(chatEvent.SAY_WHY);
                };
                if (RE_HUH.test(r))
                {
                    sendEv("HUH");
                };
                if (RE_SHUT.test(r))
                {
                    sendEv("SHUTUP");
                };
                if (RE_HUMAN.test(r))
                {
                    sendEv("C_HUMAN");
                };
                if (RE_NAME.test(r))
                {
                    sendEv("C_NAME");
                };
                if (RE_AGE.test(r))
                {
                    sendEv("C_AGE");
                };
                if (RE_LIKE.test(r))
                {
                    sendEv("C_LIKE");
                };
                if (RE_MAKE.test(r))
                {
                    sendEv("C_MAKE");
                };
                if (RE_DO.test(r))
                {
                    sendEv("C_DO");
                };
                if (RE_HI.test(r))
                {
                    sendEv(chatEvent.SAY_HI);
                };
                if (RE_OK.test(r))
                {
                    sendEv(chatEvent.SAY_OK);
                };
                if (RE_NO.test(r))
                {
                    sendEv(chatEvent.SAY_NO);
                }
                else
                {
                    if (RE_YES.test(r))
                    {
                        sendEv(chatEvent.SAY_YES);
                    };
                };
            };
        }

        public static function dealWithA(u:uint):void
        {
            switch (u)
            {
                case 0:
                    break;
            };
        }

        public static function sendEv(r:String):void
        {
            if (chatOn)
            {
                C.dispatchEvent(new chatEvent(r));
            };
        }

        public static function sayWhat(r:String):void
        {
            gameKon.theRoot.doChat(r, pName, pCol);
        }

        public static function addEar(r:String, f:Function):void
        {
            C.addEventListener(r, f, false, 0, true);
        }

        public static function delaySay(r:String, t:uint):void
        {
            delayArray.push({
                "T":t,
                "R":r
            });
        }

        private static function greet_1(e:chatEvent):void
        {
            delaySay("Hello.", 3);
            resetAll();
            chatOrder.SET(true, 6, 19);
        }

        private static function tut_1(e:chatEvent):void
        {
            delaySay("Alright! That's what I like to hear.", 2);
            resetAll();
            chatOrder.SET(true, 10, 3);
        }

        private static function tut_2(e:chatEvent):void
        {
            delaySay("Good work.", 2);
            gotBuild = false;
            needBuild = 9;
            resetAll();
            chatOrder.SET(true, 7, 8);
        }

        private static function tut_3(e:chatEvent):void
        {
            delaySay("No! You've made the wrong building! You don't really listen to me, do you?", 2);
        }

        private static function tut_4(e:chatEvent):void
        {
            delaySay("Good! I like eager people.", 2);
            resetAll();
            chatOrder.SET(true, 15, 14);
        }

        private static function tut_5(e:chatEvent):void
        {
            delaySay("Alright. You know all the basics anyway, so good luck, and let's win this!", 2);
            resetAll();
            setAction();
            chatOrder.SET(false, 0, 0);
        }

        private static function tut_6(e:chatEvent):void
        {
            delaySay("Wonderful. You learn fast.", 2);
            resetAll();
            chatOrder.SET(true, 15, 15);
        }

        private static function tut_7(e:chatEvent):void
        {
            delaySay("Ok for example, when you select Outpost, you can press 1 for Marines, 2 for Tanks, and 3 for Recruit. I hope it's clear now...", 2);
            resetAll();
            chatOrder.SET(true, 15, 15);
        }

        private static function tut_8(e:chatEvent):void
        {
            delaySay("Beautiful. Now you can make Snipers. These guys have armor piercing bullets, and they can even outrange the enemy base defenses.", 2);
            resetAll();
            chatOrder.SET(true, 25, 16);
        }

        private static function talk_1(e:chatEvent):void
        {
            delaySay("Excellent. I will give you my battle reports.", 2);
            resetAll();
            setAction();
        }

        private static function talk_2(e:chatEvent):void
        {
            delaySay("Alright then. Let us be silent.", 2);
            resetAll(true);
        }

        private static function shut(e:chatEvent):void
        {
            delaySay("Alright... Fine.", 2);
            resetAll(true);
            chatOrder.SET(false, 0, 0);
        }

        private static function shut2(e:chatEvent):void
        {
            delaySay("...", 2);
        }

        private static function ty(e:chatEvent):void
        {
            delaySay("Thanks.", 2);
            C.removeEventListener(chatEvent.SAY_OK, ty);
        }

        private static function insult(e:chatEvent):void
        {
            delaySay("How dare you say that to me!", 2);
        }

        private static function good(e:chatEvent):void
        {
            delaySay("Outstanding.", 2);
            resetAll();
            setAction();
        }

        private static function np(e:chatEvent):void
        {
            delaySay("Alright don't worry. We'll think of something.", 2);
            resetAll();
            setAction();
        }

        private static function ac_human(e:chatEvent):void
        {
            delaySay("No of course not. I thought you knew that already.", 2);
            resetAll();
            setAction();
        }

        private static function ac_name(e:chatEvent):void
        {
            delaySay(C_NAME, 4);
            resetAll();
            setAction();
        }

        private static function ac_age(e:chatEvent):void
        {
            delaySay(C_AGE, 4);
            resetAll();
            setAction();
        }

        private static function ac_like(e:chatEvent):void
        {
            delaySay(C_LIKE, 4);
            resetAll();
            setAction();
        }

        private static function ac_make(e:chatEvent):void
        {
            delaySay(C_MAKE, 4);
            resetAll();
            setAction();
        }

        private static function ac_do(e:chatEvent):void
        {
            delaySay(C_DO, 4);
            resetAll();
            setAction();
        }

        private static function a_group(e:chatEvent):void
        {
            jimBob(1, "Alright, I'm going to try form an attack group. Back me up.");
            addEar(chatEvent.SAY_OK, ty);
        }

        private static function a_attack(e:chatEvent):void
        {
            jimBob(2, "Sending my men forward now! Go! Go!");
        }

        private static function a_save(e:chatEvent):void
        {
            jimBob(3, "I'm saving up so I can upgrade.");
        }

        private static function a_resume(e:chatEvent):void
        {
            jimBob(4, "No major enemy threat detected.");
        }

        private static function a_save2(e:chatEvent):void
        {
            jimBob(5, "We're not in immediate danger, but I'm out of resources. I'm going to save up.");
        }

        private static function a_c1(e:chatEvent):void
        {
            jimBob(6, "They have a lot of infantry. Tanks will be good against them.");
        }

        private static function a_c2(e:chatEvent):void
        {
            jimBob(7, "Threat from ground to ground units. Scouts and Phantoms would be ideal now.");
        }

        private static function a_c3(e:chatEvent):void
        {
            jimBob(8, "I think now is a good time to deploy a Phantom.");
        }

        private static function a_c4(e:chatEvent):void
        {
            jimBob(9, "Sniper threat detected! Phantoms will be our best counter.");
        }

        private static function a_c5(e:chatEvent):void
        {
            jimBob(10, "Threat from single target attackers, we shoud shield our forces with Romans.");
        }

        private static function a_c6(e:chatEvent):void
        {
            jimBob(11, "Let's bring down those Anti-Air Spiders.");
        }

        private static function a_c7(e:chatEvent):void
        {
            jimBob(12, "Air threat detected! Respond with Sakata Mk-II and Marines!");
        }

        private static function a_c8(e:chatEvent):void
        {
            jimBob(13, "They've got a Black Queen! Try to damage it during its 12 second reload!");
        }

        private static function a_c9(e:chatEvent):void
        {
            jimBob(14, "A Gladiator! Send in everything you've got, we have to take it down!");
        }

        private static function a_c11(e:chatEvent):void
        {
            jimBob(15, "We need some Positron weapons to take down that armor. Can you send in any Hover Tanks or Snipers?");
            addEar(chatEvent.SAY_OK, good);
            addEar(chatEvent.SAY_YES, good);
            addEar(chatEvent.SAY_NO, np);
        }

        private static function jimBob(a:uint, s:String):void
        {
            if (previousAction != a)
            {
                if (a > 5)
                {
                    if (previousDanger != a)
                    {
                        if (previousAction !== 6)
                        {
                            if (noMoreDanger == 0)
                            {
                                trace("BOO");
                                previousDanger = a;
                                previousAction = 6;
                                noMoreDanger = 80;
                                previousTime = 5000;
                                sayWhat(s);
                                resetAll();
                                setAction();
                            };
                        };
                    };
                }
                else
                {
                    if (a == 3)
                    {
                        if (noMoreUpgrade == 0)
                        {
                            previousAction = a;
                            noMoreUpgrade = 250;
                            previousTime = 5000;
                            sayWhat(s);
                            resetAll();
                            setAction();
                        };
                    }
                    else
                    {
                        previousAction = a;
                        previousTime = 5000;
                        sayWhat(s);
                        resetAll();
                        setAction();
                    };
                };
            };
        }

        public static function runAiChat(a:uint):*
        {
            switch (a)
            {
                case 0:
                    chatOrder.SET(false, 0, 0);
                    break;
                case 1:
                    greetTut();
                    break;
                case 2:
                    tut1();
                    break;
                case 3:
                    tut2();
                    break;
                case 4:
                    tut3();
                    break;
                case 5:
                    tut4();
                    break;
                case 6:
                    tut5();
                    break;
                case 7:
                    tut6();
                    break;
                case 8:
                    tut7();
                    break;
                case 9:
                    tut8();
                    break;
                case 10:
                    tut9();
                    break;
                case 11:
                    tut10();
                    break;
                case 12:
                    tut11();
                    break;
                case 13:
                    tut12();
                    break;
                case 14:
                    tut13();
                    break;
                case 15:
                    tut14();
                    break;
                case 16:
                    tut15();
                    break;
                case 17:
                    tut16();
                    break;
                case 18:
                    tut17();
                    break;
                case 19:
                    tut18();
                    break;
            };
        }

        private static function greetTut():void
        {
            sayWhat("Hello! Welcome to the tutorial mission.");
            resetAll();
            chatOrder.SET(true, 4, 2);
        }

        private static function tut1():void
        {
            sayWhat("The enemy is already mobilizing, so do what I say and we'll be fine. Alright?");
            resetAll();
            addEar(chatEvent.SAY_OK, tut_1);
            chatOrder.SET(true, 25, 3);
        }

        private static function tut2():void
        {
            sayWhat("Ok. Basics first. Red bases are yours and Blue are mine. We don't share troops, technology, or funds.");
            resetAll();
            chatOrder.SET(true, 13, 4);
        }

        private static function tut3():void
        {
            sayWhat("But we do have the same objective. Protect our central base, and destroy all enemy forces.");
            resetAll();
            chatOrder.SET(true, 13, 5);
        }

        private static function tut4():void
        {
            sayWhat("You can see the enemy's base by scrolling the screen to the right, with either your mouse, or the arrow keys.");
            resetAll();
            chatOrder.SET(true, 15, 6);
        }

        private static function tut5():void
        {
            sayWhat("Right... Now I need you to start building something. Click on one of your Red platforms and build an Outpost.");
            resetAll();
            if (!gotBuild)
            {
                chatOrder.SET(false, 0, 0);
                addEar("B_RIGHT", tut_2);
                addEar("B_WRONG", tut_3);
            }
            else
            {
                gotBuild = false;
                needBuild = 9;
                chatOrder.SET(true, 2, 7);
            };
        }

        private static function tut6():void
        {
            sayWhat("Oh, it looks like you already have one.");
            resetAll();
            chatOrder.SET(true, 20, 8);
        }

        private static function tut7():void
        {
            sayWhat("Now make some Marines. They will automatically advance and attack.");
            resetAll();
            chatOrder.SET(true, 15, 9);
        }

        private static function tut8():void
        {
            sayWhat("If you want them to stop in front of our base instead, toggle rally mode by pressing X.");
            resetAll();
            chatOrder.SET(true, 16, 10);
        }

        private static function tut9():void
        {
            sayWhat("When you need additional manpower, use the Recruit option from the Outpost.");
            resetAll();
            chatOrder.SET(true, 16, 11);
        }

        private static function tut10():void
        {
            sayWhat("You can also make your orders repeat themselves by holding Shift when you press it. It will continute to build as long as you have the resources.");
            resetAll();
            chatOrder.SET(true, 16, 12);
        }

        private static function tut11():void
        {
            sayWhat("Also, learn to command the troops that you have on the field. Drag a box around them to select them.");
            resetAll();
            chatOrder.SET(true, 20, 13);
        }

        private static function tut12():void
        {
            sayWhat("That's pretty much all the basic stuff. Do you want to learn more? Yes or no?");
            resetAll();
            chatOrder.SET(false, 0, 0);
            addEar(chatEvent.SAY_YES, tut_4);
            addEar(chatEvent.SAY_NO, tut_5);
        }

        private static function tut13():void
        {
            sayWhat("There are hotkeys for all the options. 1, 2, 3, 4, Q, W, E and R. They correspond to the layout of the buttons. You understand?");
            resetAll();
            chatOrder.SET(false, 0, 0);
            addEar(chatEvent.SAY_YES, tut_6);
            addEar(chatEvent.SAY_NO, tut_7);
        }

        private static function tut14():void
        {
            sayWhat("Right, moving on... You'll need to ugrade your Outpost if you want to get the best troops. Upgrade it to a Barracks.");
            resetAll();
            addEar("B_RIGHT", tut_8);
            chatOrder.SET(false, 0, 0);
        }

        private static function tut15():void
        {
            sayWhat("Snipers are expensive though, so you need to control them well. For example, move them back while they reload to keep them away from enemy fire.");
            chatOrder.SET(true, 40, 17);
            resetAll();
        }

        private static function tut16():void
        {
            sayWhat("Alright, you should be getting a hang of this now.");
            chatOrder.SET(true, 15, 18);
            resetAll();
        }

        private static function tut17():void
        {
            sayWhat("Let 's smash them to the ground!");
            chatOrder.SET(false, 0, 0);
            resetAll();
            setAction();
        }

        private static function tut18():void
        {
            sayWhat("Would you like me to talk?");
            chatOrder.SET(false, 0, 0);
            resetAll();
            addEar(chatEvent.SAY_YES, talk_1);
            addEar(chatEvent.SAY_NO, talk_2);
        }


    }
}//package 

