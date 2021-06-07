// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ColonyFinal_fla.ArmorGamesLogo_18

package ColonyFinal_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.net.URLRequest;
    import flash.net.navigateToURL;
    import flash.events.MouseEvent;

    public dynamic class ArmorGamesLogo_18 extends MovieClip 
    {

        public var b:SimpleButton;

        public function ArmorGamesLogo_18()
        {
            addFrameScript(0, frame1);
        }

        public function getAGURL(me:MouseEvent):void
        {
            var url:String = "https://ArmorGames.com";
            var req:URLRequest = new URLRequest(url);
            try
            {
                navigateToURL(req, "_blank");
            }
            catch(e:Error)
            {
            };
        }

        internal function frame1():*
        {
            b.addEventListener(MouseEvent.CLICK, getAGURL);
        }


    }
}//package ColonyFinal_fla

