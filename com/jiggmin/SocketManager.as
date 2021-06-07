// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.jiggmin.SocketManager

package com.jiggmin
{
    import com.jiggmin.blossomSocket.BlossomSocket;
    import flash.events.EventDispatcher;
    import flash.events.Event;
    import com.jiggmin.blossomSocket.BlossomEvent;

    public class SocketManager 
    {

        public static var SOCKET_ERROR:String = "socketError";
        public static var errorMessage:String = "";
        public static var _socket:BlossomSocket;
        protected static var disp:EventDispatcher;


        public static function connect(a:String="colony1.armorgames.com"):BlossomSocket
        {
            close();
            _socket = new BlossomSocket(a, 1276, "JGtkSTBCK0tnLVhhdCF2Xw==");
            _socket.addEventListener(Event.CLOSE, socketCloseHandler, false, 0, true);
            _socket.addEventListener(BlossomEvent.ERROR, socketErrorHandler, false, 0, true);
            return (_socket);
        }

        public static function close():void
        {
            if (socket != null)
            {
                _socket.removeEventListener(Event.CLOSE, socketCloseHandler);
                _socket.removeEventListener(BlossomEvent.ERROR, socketErrorHandler);
                // trace("close socket");
                _socket.remove();
                _socket = null;
            };
        }

        public static function get socket():BlossomSocket
        {
            return (_socket);
        }

        private static function socketCloseHandler(e:Event):void
        {
            close();
            errorMessage = "Your connection to the server was lost.";
            dispatchEvent(new Event(SocketManager.SOCKET_ERROR));
        }

        private static function socketErrorHandler(be:BlossomEvent):void
        {
            close();
            errorMessage = be.error;
            dispatchEvent(new Event(SocketManager.SOCKET_ERROR));
        }

        public static function addEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean=false, p_priority:int=0, p_useWeakReference:Boolean=false):void
        {
            if (disp == null)
            {
                disp = new EventDispatcher();
            };
            disp.addEventListener(p_type, p_listener, p_useCapture, p_priority, p_useWeakReference);
        }

        public static function removeEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean=false):void
        {
            if (disp == null)
            {
                return;
            };
            disp.removeEventListener(p_type, p_listener, p_useCapture);
        }

        public static function dispatchEvent(p_event:Event):void
        {
            if (disp == null)
            {
                return;
            };
            disp.dispatchEvent(p_event);
        }


    }
}//package com.jiggmin

