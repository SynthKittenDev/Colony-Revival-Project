// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//chatEvent

package 
{
    import flash.events.Event;

    public class chatEvent extends Event 
    {

        public static var SAY_HI:String = "SAY_HI";
        public static var SAY_YES:String = "SAY_YES";
        public static var SAY_NO:String = "SAY_NO";
        public static var SAY_WHAT:String = "SAY_WHAT";
        public static var SAY_WHY:String = "SAY_WHY";
        public static var SAY_WHERE:String = "SAY_WHERE";
        public static var SAY_WHO:String = "SAY_WHO";
        public static var SAY_WHEN:String = "SAY_WHEN";
        public static var SAY_OK:String = "SAY_OK";
        public static var SAY_HOW:String = "SAY_HOW";
        public static var SAY_HUH:String = "SAY_HUH";
        public static var SAY_SORRY:String = "SAY_SORRY";
        public static var HELP:String = "HELP";
        public static var THANKS:String = "THANKS";
        public static var INSULT:String = "INSULT";

        public function chatEvent(_arg_1:String, bubbles:Boolean=false, cancelable:Boolean=true):void
        {
            super(_arg_1, bubbles, cancelable);
        }

    }
}//package 

