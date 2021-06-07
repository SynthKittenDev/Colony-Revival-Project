// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//AdLoader

package 
{
    import flash.display.Loader;
    import flash.system.Security;
    import flash.net.URLRequest;
    import flash.display.DisplayObject;

    public class AdLoader 
    {

        private static var cpmstarLoader:Loader;


        public static function LoadAd(poolid:int, subpoolid:int):DisplayObject
        {
            Security.allowDomain("server.cpmstar.com");
            var cpmstarViewSWFUrl:String = "https://server.cpmstar.com/adviewas3.swf";
            cpmstarLoader = new Loader();
            cpmstarLoader.load(new URLRequest(((((cpmstarViewSWFUrl + "?poolid=") + poolid) + "&subpoolid=") + subpoolid)));
            return (cpmstarLoader);
        }


    }
}//package 

