// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//it.gotoandplay.smartfoxserver.http.LoaderFactory

package it.gotoandplay.smartfoxserver.http
{
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    public class LoaderFactory 
    {

        private static const DEFAULT_POOL_SIZE:int = 8;

        private var loadersPool:Array;
        private var currentLoaderIndex:int;

        public function LoaderFactory(responseHandler:Function, errorHandler:Function, poolSize:int=8)
        {
            var urlLoader:URLLoader;
            super();
            loadersPool = [];
            var i:int;
            while (i < poolSize)
            {
                urlLoader = new URLLoader();
                urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
                urlLoader.addEventListener(Event.COMPLETE, responseHandler);
                urlLoader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
                urlLoader.addEventListener(IOErrorEvent.NETWORK_ERROR, errorHandler);
                loadersPool.push(urlLoader);
                i++;
            };
            currentLoaderIndex = 0;
        }

        public function getLoader():URLLoader
        {
            var urlLoader:URLLoader = loadersPool[currentLoaderIndex];
            currentLoaderIndex++;
            if (currentLoaderIndex >= loadersPool.length)
            {
                currentLoaderIndex = 0;
            };
            return (urlLoader);
        }


    }
}//package it.gotoandplay.smartfoxserver.http

