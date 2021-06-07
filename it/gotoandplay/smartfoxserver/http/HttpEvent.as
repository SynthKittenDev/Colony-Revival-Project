// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//it.gotoandplay.smartfoxserver.http.HttpEvent

package it.gotoandplay.smartfoxserver.http
{
    import flash.events.Event;

    public class HttpEvent extends Event 
    {

        public static const onHttpData:String = "onHttpData";
        public static const onHttpError:String = "onHttpError";
        public static const onHttpConnect:String = "onHttpConnect";
        public static const onHttpClose:String = "onHttpClose";

        public var params:Object;
        private var evtType:String;

        public function HttpEvent(_arg_1:String, params:Object)
        {
            super(_arg_1);
            this.params = params;
            this.evtType = _arg_1;
        }

        override public function clone():Event
        {
            return (new HttpEvent(this.evtType, this.params));
        }

        override public function toString():String
        {
            return (formatToString("HttpEvent", "type", "bubbles", "cancelable", "eventPhase", "params"));
        }


    }
}//package it.gotoandplay.smartfoxserver.http

