// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.events.ComponentEvent

package fl.events
{
    import flash.events.Event;

    public class ComponentEvent extends Event 
    {

        public static const BUTTON_DOWN:String = "buttonDown";
        public static const LABEL_CHANGE:String = "labelChange";
        public static const HIDE:String = "hide";
        public static const SHOW:String = "show";
        public static const RESIZE:String = "resize";
        public static const MOVE:String = "move";
        public static const ENTER:String = "enter";

        public function ComponentEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function toString():String
        {
            return (formatToString("ComponentEvent", "type", "bubbles", "cancelable"));
        }

        override public function clone():Event
        {
            return (new ComponentEvent(type, bubbles, cancelable));
        }


    }
}//package fl.events

