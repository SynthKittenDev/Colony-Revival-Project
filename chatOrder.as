// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//chatOrder

package 
{
    public class chatOrder 
    {

        public static var act:Boolean;
        public static var timeCount:uint;
        public static var currentOrder:uint;
        public static var missionChat:uint;


        public static function go():void
        {
            if (missionChat == 0)
            {
                chatBody.runAiChat(currentOrder);
            };
            if (missionChat == 1)
            {
                chatMission1.runAiChat(currentOrder);
            };
            if (missionChat == 2)
            {
                chatMission2.runAiChat(currentOrder);
            };
            if (missionChat == 3)
            {
                chatMission3.runAiChat(currentOrder);
            };
            if (missionChat == 4)
            {
                chatMission4.runAiChat(currentOrder);
            };
            if (missionChat == 5)
            {
                chatMission5.runAiChat(currentOrder);
            };
            if (missionChat == 6)
            {
                chatMission6.runAiChat(currentOrder);
            };
        }

        public static function SET(a:Boolean, b:uint, c:uint, d:uint=0):void
        {
            act = a;
            timeCount = (chatBody.stepCount + b);
            currentOrder = c;
            missionChat = d;
        }


    }
}//package 

