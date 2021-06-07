// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.jiggmin.blossomSocket.CommandSocket

package com.jiggmin.blossomSocket
{
    import flash.events.ProgressEvent;
    import com.adobe.serialization.json.JSON;

    public class CommandSocket extends BasicSocket 
    {

        private var encryptor:Encryptor;
        private var sendBuffer:Array = new Array();
        private var encrypt:Boolean = false;
        private var readNum:int = 0;
        private var writeNum:int = 0;
        private var readBuffer:String = "";
        private var EOL:String = String.fromCharCode(4);
        public var traceTraffic:Boolean = false;

        public function CommandSocket():void
        {
            encryptor = new Encryptor();
            addEventListener(BlossomEvent.RECEIVE_IV, receiveIVHandler, false, 0, true);
            addEventListener(BlossomEvent.READY, readyHandler, false, 0, true);
        }

        private function receiveIVHandler(be:BlossomEvent):void
        {
            var obj:Object;
            if (encrypt == true)
            {
                obj = new Object();
                obj.type = "confirm_iv";
                send(obj);
            };
            var iv:String = be.iv;
            encryptor.setIV(iv);
            encrypt = true;
        }

        private function readyHandler(be:BlossomEvent):void
        {
            var obj:Object;
            for each (obj in sendBuffer)
            {
                send(obj);
            };
            sendBuffer = new Array();
        }

        public function setKey(stringKey:String):void
        {
            encryptor.setKey(stringKey);
        }

        override protected function socketDataHandler(e:ProgressEvent):void
        {
            readBytesAvailable();
            super.socketDataHandler(e);
        }

        protected function send(obj:Object):void
        {
            var strObj:String;
            var sendStr:String;
            if (connected)
            {
                writeNum++;
                obj.write_num = writeNum;
                strObj = com.adobe.serialization.json.JSON.encode(obj);
                if (encrypt)
                {
                    sendStr = encryptor.encrypt(strObj);
                }
                else
                {
                    sendStr = strObj;
                };
                sendStr = (sendStr + EOL);
                write(sendStr);
                if (traceTraffic)
                {
                    trace(("write: " + strObj));
                    dataTracer.update(("write: " + strObj));
                };
            }
            else
            {
                sendBuffer.push(obj);
            };
        }

        protected function readBytesAvailable():void
        {
            var index:int;
            var command:String;
            var str:String = readUTFBytes(bytesAvailable);
            if (str != null)
            {
                readBuffer = (readBuffer + str);
                while (true)
                {
                    index = readBuffer.indexOf(EOL);
                    if (index == -1)
                    {
                        break;
                    };
                    command = readBuffer.substring(0, index);
                    readBuffer = readBuffer.substr((index + 1));
                    receiveCommand(command);
                };
            };
        }

        protected function receiveCommand(command:String):void
        {
            var stringVars:String;
            readNum++;
            var spaceIndex:int = command.indexOf(" ");
            var remoteSendNum:int = int(command.substr(0, spaceIndex));
            command = command.substr((spaceIndex + 1));
            if (remoteSendNum != readNum)
            {
                throw (new Error(((("readCount does not match messageNum. readNum: " + readNum) + ", remoteSendNum: ") + remoteSendNum)));
            };
            if (encrypt)
            {
                stringVars = encryptor.decrypt(command);
            }
            else
            {
                stringVars = command;
            };
            if (traceTraffic)
            {
                dataTracer.update(("received: " + stringVars));
                trace(("received: " + stringVars));
            };
            var obj:Object = com.adobe.serialization.json.JSON.decode(stringVars);
            handleMessage(obj);
        }

        protected function handleMessage(obj:Object):void
        {
            var _local_2:String;
            if (((obj.type == null) || (obj.type == "")))
            {
                _local_2 = BlossomEvent.RECEIVE_MESSAGE;
            }
            else
            {
                _local_2 = obj.type;
            };
            var blossomEvent:BlossomEvent = new BlossomEvent(_local_2, obj, null);
            dispatchEvent(blossomEvent);
        }

        override public function remove():void
        {
            removeEventListener(BlossomEvent.RECEIVE_IV, receiveIVHandler);
            removeEventListener(BlossomEvent.READY, readyHandler);
            if (encryptor != null)
            {
                encryptor.remove();
                encryptor = null;
            };
            super.remove();
        }


    }
}//package com.jiggmin.blossomSocket

