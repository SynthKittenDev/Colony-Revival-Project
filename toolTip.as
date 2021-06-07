// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//toolTip

package 
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.Stage;
    import flash.text.TextFieldAutoSize;
    import flash.events.Event;
    import flash.text.*;

    public class toolTip extends Sprite 
    {

        private static var t_name:TextField = new TextField();
        private static var t_cost_m:TextField = new TextField();
        private static var t_cost_p:TextField = new TextField();
        private static var t_cost_e:TextField = new TextField();
        private static var t_desc:TextField = new TextField();
        private static var CostTip:costTip = new costTip();
        private static var CostTip2:costTip2 = new costTip2();
        private static var FONT:MainFont = new MainFont();
        private static var tf:TextFormat = new TextFormat();
        private static var tf2:TextFormat = new TextFormat();
        private static var tipState:Boolean = false;
        private static var tip_t:*;
        private static var tip_g:*;
        private static var killTime:uint = 0;
        public static var errorTip:Boolean;
        private static var theStage:Stage;
        private static var theRoot:Object;
        private static var osNum:Number = new Number();

        public function toolTip(s:Stage, r:Object, offSetX:Number=15, offSetSize:Number=150):void
        {
            errorTip = false;
            theStage = s;
            theRoot = r;
            gameKon.displayArray.push(this);
            tf.font = FONT.fontName;
            tf.size = 14;
            tf.color = 0xFFFFFF;
            tf2.font = FONT.fontName;
            tf2.size = 14;
            tf2.color = 3354667;
            addChild(t_name);
            addChild(t_desc);
            addChild(CostTip);
            addChild(CostTip2);
            CostTip.visible = false;
            CostTip.x = offSetX;
            CostTip2.visible = false;
            CostTip2.x = offSetX;
            t_name.text = "Name Plate";
            t_name.border = true;
            t_name.borderColor = 0x111111;
            t_name.background = true;
            t_name.backgroundColor = 0x1A1A1A;
            t_name.selectable = false;
            t_name.width = offSetSize;
            t_name.x = offSetX;
            t_name.y = -20;
            t_name.embedFonts = true;
            t_name.autoSize = TextFieldAutoSize.LEFT;
            t_name.multiline = true;
            t_name.wordWrap = true;
            t_name.setTextFormat(tf);
            t_desc.text = "Text Plate";
            t_desc.border = true;
            t_desc.borderColor = 0x111111;
            t_desc.background = true;
            t_desc.backgroundColor = 13223358;
            t_desc.selectable = false;
            t_desc.width = offSetSize;
            t_desc.x = offSetX;
            t_desc.embedFonts = true;
            t_desc.autoSize = TextFieldAutoSize.LEFT;
            t_desc.multiline = true;
            t_desc.wordWrap = true;
            t_desc.setTextFormat(tf2);
            t_name.visible = false;
            t_desc.visible = false;
        }

        public static function tip(t:Object, g:uint):void
        {
            tip_t = t;
            tip_g = g;
            tipState = true;
            theStage.addEventListener(Event.ENTER_FRAME, correctTip, false, 0, true);
            if (g == 1)
            {
                t_name.text = t.tipName;
                t_name.setTextFormat(tf);
                t_desc.text = "This is currently in production.";
                t_desc.setTextFormat(tf2);
                t_name.visible = true;
                t_desc.visible = true;
                osNum = (t_name.height + t_desc.height);
                setOffset();
                t_desc.y = (t_name.y + t_name.height);
            }
            else
            {
                if (t.tipName == null)
                {
                    t_desc.text = t.tipDesc;
                    t_desc.setTextFormat(tf2);
                    t_desc.visible = true;
                    osNum = t_desc.height;
                    setOffset();
                    t_desc.y = t_name.y;
                }
                else
                {
                    t_name.text = t.tipName;
                    t_name.setTextFormat(tf);
                    t_desc.text = t.tipDesc;
                    t_desc.setTextFormat(tf2);
                    t_name.visible = true;
                    t_desc.visible = true;
                    osNum = (t_name.height + t_desc.height);
                    setOffset();
                    t_desc.y = (t_name.y + t_name.height);
                    if ((((t.tipCostM + t.tipCostP) + t.tipCostE) + t.tipCostI) > 0)
                    {
                        if (t.tipCostI > 0)
                        {
                            CostTip2.visible = true;
                            CostTip2.c_i.text = t.tipCostI;
                            osNum = ((t_name.height + CostTip2.height) + t_desc.height);
                        }
                        else
                        {
                            CostTip.visible = true;
                            CostTip.c_m.text = t.tipCostM;
                            CostTip.c_p.text = t.tipCostP;
                            CostTip.c_e.text = t.tipCostE;
                            osNum = ((t_name.height + CostTip.height) + t_desc.height);
                        };
                        setOffset();
                        CostTip.y = (t_name.y + t_name.height);
                        CostTip2.y = (t_name.y + t_name.height);
                        t_desc.y = ((t_name.y + t_name.height) + CostTip.height);
                    };
                };
            };
        }

        public static function unTip():void
        {
            errorTip = false;
            tipState = true;
            t_name.visible = false;
            t_desc.visible = false;
            CostTip.visible = false;
            CostTip2.visible = false;
            theStage.removeEventListener(Event.ENTER_FRAME, correctTip);
        }

        public static function giveError(msg1:String, msg2:String):void
        {
            if (t_name.visible)
            {
                errorTip = true;
                t_name.text = msg1;
                t_name.setTextFormat(tf);
                CostTip.visible = false;
                CostTip2.visible = false;
                t_name.visible = true;
                t_desc.y = (t_name.y + t_name.height);
                t_desc.text = msg2;
                t_desc.setTextFormat(tf2);
                osNum = (t_desc.height + t_name.height);
                theStage.addEventListener(Event.ENTER_FRAME, cd_killTip);
                killTime = 0;
                setOffset();
            };
        }

        private static function cd_killTip(event:Event):void
        {
            killTime++;
            if (killTime == 75)
            {
                errorTip = false;
                theStage.removeEventListener(Event.ENTER_FRAME, cd_killTip);
                if (t_desc.visible)
                {
                    tip(tip_t, tip_g);
                };
            };
        }

        private static function correctTip(event:Event):*
        {
            setOffset();
        }

        public static function setOffset():void
        {
            if ((theStage.mouseY + osNum) > 570)
            {
                theRoot.ToolTip.y = (570 - osNum);
            };
        }


        public function killEvents():void
        {
            theStage.removeEventListener(Event.ENTER_FRAME, cd_killTip);
        }


    }
}//package 

