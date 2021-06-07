// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//renderMachine

package 
{
    import flash.display.Stage;
    import flash.display.Shape;
    import flash.events.Event;
    import flash.geom.ColorTransform;
    import flash.display.Sprite;
    import flash.display.BitmapData;

    public class renderMachine 
    {

        public static var poly:Number = 1;
        public static var copyBase:Array = new Array();
        public static var originalButtons:Array = new Array();
        public static var buildings:Array = new Array();
        public static var copyUnits:Array = new Array();
        public static var units:Array = new Array();
        public static var weapons:Array = new Array();
        public static var explosions:Array = new Array();
        public static var trail:Array = new Array();
        private static var drawingBuls:Boolean = false;
        public static var BaseGraphicsMain:baseGraphicsMain = new baseGraphicsMain();
        public static var Adjuster:adjuster = new adjuster();
        public static var ICON:_icon = new _icon();
        public static var TRAIL:_trail = new _trail();
        public static var UNIT:_unit = new _unit();
        public static var WEP:_weapon = new _weapon();
        public static var EX:_ex = new _ex();
        public static var nowTask:uint = 0;
        public static var maxTask:uint = 0;
        public static var renderList:Array = [];
        public static var renCom:Function;
        private static var S:Stage;
        private static var R:Object;


        public static function init(r:Object, s:Stage):void
        {
            R = r;
            S = s;
            renderList = [];
        }

        public static function renderAll(r_id:uint, col:Array=null, r_pop:uint=0):void
        {
            var maxR:*;
            var r:*;
            var uBar:*;
            var tBar:*;
            var wBar:*;
            var wA:Array;
            var hA:Array;
            var eBar:*;
            var bigB:baseGraphicsMain;
            var Mask:Shape;
            if (r_id == 0)
            {
                addRender(BaseGraphicsMain, (59 / poly), (97.9 / poly), buildings, BaseGraphicsMain);
                BaseGraphicsMain.stop();
            };
            if (r_id == 0)
            {
                ICON.stop();
                addRender(ICON, (45 / poly), (45 / poly), originalButtons, ICON);
            };
            if (r_id == 2)
            {
                units[r_pop] = new Array();
                UNIT = new _unit();
                drawingBuls = false;
                maxR = UNIT.numChildren;
                r = 0;
                while (r < maxR)
                {
                    units[r_pop][r] = new Object();
                    units[r_pop][r].normal = new Array();
                    uBar = UNIT.getChildAt(0);
                    uBar.stop();
                    UNIT.removeChildAt(0);
                    addRender(uBar, 0, 0, units[r_pop][r].normal, uBar, true, true, units[r_pop][r], col[r_pop]);
                    r++;
                };
            };
            if (r_id == 0)
            {
                maxR = TRAIL.numChildren;
                r = 0;
                while (r < maxR)
                {
                    trail[r] = new Object();
                    trail[r].normal = new Array();
                    tBar = TRAIL.getChildAt(0);
                    tBar.stop();
                    TRAIL.removeChildAt(0);
                    addRender(tBar, 0, 0, trail[r].normal, tBar, true);
                    r++;
                };
            };
            if (r_id == 0)
            {
                maxR = WEP.numChildren;
                r = 0;
                while (r < maxR)
                {
                    weapons[r] = new Object();
                    weapons[r].normal = new Array();
                    wBar = WEP.getChildAt(0);
                    wBar.stop();
                    WEP.removeChildAt(0);
                    addRender(wBar, 0, 0, weapons[r].normal, wBar, true);
                    r++;
                };
            };
            if (r_id == 0)
            {
                wA = new Array(23, 23, 23, 125, 74, 63, 30, 30, 63, 20, 23, 25, 22, 22, 33);
                hA = new Array(23, 23, 23, 67, 74, 63, 30, 30, 63, 28, 23, 33, 33, 33, 33);
                maxR = EX.numChildren;
                drawingBuls = true;
                r = 0;
                while (r < maxR)
                {
                    explosions[r] = new Object();
                    explosions[r].normal = new Array();
                    eBar = EX.getChildAt(0);
                    eBar.stop();
                    EX.removeChildAt(0);
                    addRender(eBar, wA[r], hA[r], explosions[r].normal, eBar, true);
                    r++;
                };
            };
            if (r_id == 0)
            {
                drawingBuls = false;
                bigB = new baseGraphicsMain();
                bigB.stop();
                Adjuster.addChildAt(bigB, 1);
                Mask = new Shape();
                Adjuster.addChildAt(Mask, 2);
                Mask.graphics.beginFill(0xFF0000);
                Mask.graphics.drawRect(0, 0, 45, 45);
                Mask.graphics.endFill();
                bigB.mask = Mask;
                bigB.gotoAndStop(0);
                bigB.scaleX = (bigB.scaleY = 0.85);
                bigB.x = -2;
                bigB.y = -19;
                addRender(Adjuster, 45, 45, copyBase, bigB);
            };
        }

        public static function startRen():void
        {
            maxTask = renderList.length;
            S.addEventListener(Event.ENTER_FRAME, runRen, false, 0, true);
            S.frameRate = 60;
            nowTask = 0;
            if (maxTask == 0)
            {
                endRen();
            };
        }

        public static function runRen(e:Event=null):void
        {
            var r:renderTask = renderList[nowTask];
            renderGo(r.a, r.b, r.c, r.d, r.e, r.anim, r.animated, r.ob, r.col);
            nowTask++;
            R.renderBar.width = (121 * (nowTask / maxTask));
            if (nowTask == maxTask)
            {
                endRen();
            };
        }

        public static function endRen():void
        {
            S.removeEventListener(Event.ENTER_FRAME, runRen);
            S.frameRate = 30;
            renderList = null;
            renCom();
        }

        private static function addRender(a:*, b:Number, c:Number, d:Array, e:*, anim:Boolean=false, animated:Boolean=false, ob:Object=null, col:*=null):void
        {
            renderList.push(new renderTask(a, b, c, d, e, anim, animated, ob, col));
        }

        public static function renderGo(a:*, b:Number, c:Number, d:Array, e:*, anim:Boolean=false, animated:Boolean=false, ob:Object=null, col:*=null):void
        {
            var fireFirst:*;
            var bitmap:*;
            var b2:Number;
            var c2:Number;
            var colorMatt:*;
            var colorTransform:ColorTransform;
            if (animated)
            {
                ob.run = new uint(0);
                ob.fire = new uint(0);
                ob.death = new uint(0);
                ob.killTime = new uint(0);
                ob.prefire = new uint(0);
                fireFirst = new uint(0);
            };
            var i:uint;
            var hold:Sprite = new Sprite();
            hold.addChild(a);
            a.scaleX = (1 / poly);
            a.scaleY = (1 / poly);
            while (i < e.totalFrames)
            {
                i++;
                if ((b + c) == 0)
                {
                    if (anim)
                    {
                        if (drawingBuls)
                        {
                            b2 = b;
                            c2 = c;
                        }
                        else
                        {
                            b2 = (e.width * 1.1);
                            c2 = (e.height * 1.1);
                        };
                    }
                    else
                    {
                        b2 = hold.width;
                        c2 = hold.height;
                    };
                }
                else
                {
                    b2 = b;
                    c2 = c;
                };
                if (col != null)
                {
                    if (e.currentLabel != "death")
                    {
                        colorMatt = e.getChildAt(0);
                        colorTransform = colorMatt.transform.colorTransform;
                        colorTransform.color = col;
                        colorMatt.transform.colorTransform = colorTransform;
                    };
                };
                if (e.currentLabel == "run")
                {
                    if (ob.run == 0)
                    {
                        ob.run = (e.currentFrame - 1);
                    };
                };
                if (e.currentLabel == "prefire")
                {
                    if (fireFirst == 0)
                    {
                        fireFirst = (e.currentFrame - 1);
                    };
                };
                if (e.currentLabel == "fire")
                {
                    if (ob.fire == 0)
                    {
                        ob.fire = (e.currentFrame - 1);
                    };
                };
                if (e.currentLabel == "death")
                {
                    if (ob.death == 0)
                    {
                        ob.death = (e.currentFrame - 1);
                    };
                };
                bitmap = new BitmapData(b2, c2, true, 0);
                bitmap.draw(hold);
                d.push(bitmap);
                e.nextFrame();
            };
            if (animated)
            {
                if (ob.normal.length > 1)
                {
                    ob.killTime = (ob.normal.length - ob.death);
                };
                if (fireFirst != 0)
                {
                    ob.prefire = (ob.fire - fireFirst);
                };
            };
        }


    }
}//package 

