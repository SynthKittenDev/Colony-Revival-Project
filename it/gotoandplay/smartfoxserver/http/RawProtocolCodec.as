// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//it.gotoandplay.smartfoxserver.http.RawProtocolCodec

package it.gotoandplay.smartfoxserver.http
{
    public class RawProtocolCodec implements IHttpProtocolCodec 
    {

        private static const SESSION_ID_LEN:int = 32;


        public function encode(sessionId:String, message:String):String
        {
            return (((sessionId == null) ? "" : sessionId) + message);
        }

        public function decode(message:String):String
        {
            var decoded:String;
            if (message.charAt(0) == HttpConnection.HANDSHAKE_TOKEN)
            {
                decoded = message.substr(1, SESSION_ID_LEN);
            };
            return (decoded);
        }


    }
}//package it.gotoandplay.smartfoxserver.http

