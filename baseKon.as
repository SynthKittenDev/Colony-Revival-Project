// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//baseKon

package 
{
    import flash.display.Sprite;

    public class baseKon extends gameKon 
    {

        private var baseX:Array = new Array();
        private var baseY:Array = new Array();
        private var r:Number = 115;
        private var cF:Number = 0.625;
        public var BaseHolder:Sprite = new Sprite();
        public var BaseHolder2:Sprite = new Sprite();

        public function baseKon():void
        {
            var i:*;
            var Base:baseBuilding;
            super();
            baseX.push(0);
            baseX.push((r / 2));
            baseX.push((-(r) / 2));
            baseX.push(r);
            baseX.push(0);
            baseX.push(-(r));
            baseX.push((r / 2));
            baseX.push((-(r) / 2));
            baseX.push(0);
            baseY.push((-(r) * cF));
            baseY.push(((-(r) / 2) * cF));
            baseY.push(((-(r) / 2) * cF));
            baseY.push(0);
            baseY.push(0);
            baseY.push(0);
            baseY.push(((r / 2) * cF));
            baseY.push(((r / 2) * cF));
            baseY.push((r * cF));
            for (i in baseX)
            {
                Base = new baseBuilding();
                Base.buildSide = false;
                BaseHolder.addChild(Base);
                Base.x = baseX[i];
                Base.y = baseY[i];
            };
            for (i in baseX)
            {
                Base = new baseBuilding();
                Base.buildSide = true;
                BaseHolder2.addChild(Base);
                Base.x = baseX[i];
                Base.y = baseY[i];
            };
        }

    }
}//package 

