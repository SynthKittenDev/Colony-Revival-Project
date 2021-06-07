// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.jiggmin.blossomSocket.BasicSocket

package com.jiggmin.blossomSocket
{
    import flash.net.Socket;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.ProgressEvent;

    public class BasicSocket extends Socket 
    {


        override public function connect(url:String, port:int):void
        {
            trace(((("connect: " + url) + " ") + port));
            dataTracer.update("Connecting to Server...");
            addListeners();
            super.connect(url, port);
        }

        protected function write(string:String):void
        {
            try
            {
                writeUTFBytes(string);
                flush();
            }
            catch(e:Error)
            {
                dataTracer.update("Error writing to socket!");
                trace(("Error writing to socket: " + e));
            };
        }

        protected function connectHandler(e:Event):void
        {
            trace("Connected.");
            dataTracer.update("Connected!");
        }

        protected function closeHandler(e:Event):void
        {
            trace("Disconnected.");
            dataTracer.DC();
            remove();
        }

        protected function ioErrorHandler(e:IOErrorEvent):void
        {
            dataTracer.noMoreProgress();
            dataTracer.update("IO Error: Could not connect. This could be because: A: The server is broken. B: The internet is broken. C: Evil aliens.");
            trace("Could not connect. This could be because: A: The server is broken. B: The internet is broken. C: Evil aliens.");
        }

        protected function securityErrorHandler(e:SecurityErrorEvent):void
        {
            dataTracer.noMoreProgress();
            dataTracer.update("Security Error: Couldn't get permission to connect to server.");
            trace("Couldn't get permission to connect to server.");
        }

        protected function socketDataHandler(e:ProgressEvent):void
        {
        }

        private function addListeners():void
        {
            removeListeners();
            addEventListener(Event.CLOSE, closeHandler, false, 0, true);
            addEventListener(Event.CONNECT, connectHandler, false, 0, true);
            addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler, false, 0, true);
            addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler, false, 0, true);
            addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler, false, 0, true);
        }

        private function removeListeners():void
        {
            removeEventListener(Event.CLOSE, closeHandler);
            removeEventListener(Event.CONNECT, connectHandler);
            removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            removeEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
        }

        public function remove():void
        {
            removeListeners();
            if (connected)
            {
                super.close();
            };
        }


    }
}//package com.jiggmin.blossomSocket

