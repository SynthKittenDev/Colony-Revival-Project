// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.controls.CheckBox

package fl.controls
{
    import flash.display.Shape;
    import flash.display.Graphics;
    import flash.display.DisplayObject;

    public class CheckBox extends LabelButton 
    {

        private static var defaultStyles:Object = {
            "icon":null,
            "upIcon":"CheckBox_upIcon",
            "downIcon":"CheckBox_downIcon",
            "overIcon":"CheckBox_overIcon",
            "disabledIcon":"CheckBox_disabledIcon",
            "selectedDisabledIcon":"CheckBox_selectedDisabledIcon",
            "focusRectSkin":null,
            "focusRectPadding":null,
            "selectedUpIcon":"CheckBox_selectedUpIcon",
            "selectedDownIcon":"CheckBox_selectedDownIcon",
            "selectedOverIcon":"CheckBox_selectedOverIcon",
            "textFormat":null,
            "disabledTextFormat":null,
            "embedFonts":null,
            "textPadding":5
        };
        public static var createAccessibilityImplementation:Function;


        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }


        override public function drawFocus(_arg_1:Boolean):void
        {
            var _local_2:Number;
            super.drawFocus(_arg_1);
            if (_arg_1)
            {
                _local_2 = Number(getStyleValue("focusRectPadding"));
                uiFocusRect.x = (background.x - _local_2);
                uiFocusRect.y = (background.y - _local_2);
                uiFocusRect.width = (background.width + (_local_2 << 1));
                uiFocusRect.height = (background.height + (_local_2 << 1));
            };
        }

        override public function get autoRepeat():Boolean
        {
            return (false);
        }

        override public function set autoRepeat(_arg_1:Boolean):void
        {
        }

        override public function set toggle(_arg_1:Boolean):void
        {
            throw (new Error("Warning: You cannot change a CheckBox's toggle."));
        }

        override public function get toggle():Boolean
        {
            return (true);
        }

        override protected function configUI():void
        {
            var _local_1:Shape;
            var _local_2:Graphics;
            super.configUI();
            super.toggle = true;
            _local_1 = new Shape();
            _local_2 = _local_1.graphics;
            _local_2.beginFill(0, 0);
            _local_2.drawRect(0, 0, 100, 100);
            _local_2.endFill();
            background = (_local_1 as DisplayObject);
            addChildAt(background, 0);
        }

        override protected function drawLayout():void
        {
            var _local_1:Number;
            super.drawLayout();
            _local_1 = Number(getStyleValue("textPadding"));
            switch (_labelPlacement)
            {
                case ButtonLabelPlacement.RIGHT:
                    icon.x = _local_1;
                    textField.x = (icon.x + (icon.width + _local_1));
                    background.width = ((textField.x + textField.width) + _local_1);
                    background.height = (Math.max(textField.height, icon.height) + (_local_1 * 2));
                    break;
                case ButtonLabelPlacement.LEFT:
                    icon.x = ((width - icon.width) - _local_1);
                    textField.x = (((width - icon.width) - (_local_1 * 2)) - textField.width);
                    background.width = ((textField.width + icon.width) + (_local_1 * 3));
                    background.height = (Math.max(textField.height, icon.height) + (_local_1 * 2));
                    break;
                case ButtonLabelPlacement.TOP:
                case ButtonLabelPlacement.BOTTOM:
                    background.width = (Math.max(textField.width, icon.width) + (_local_1 * 2));
                    background.height = ((textField.height + icon.height) + (_local_1 * 3));
                    break;
            };
            background.x = Math.min((icon.x - _local_1), (textField.x - _local_1));
            background.y = Math.min((icon.y - _local_1), (textField.y - _local_1));
        }

        override protected function drawBackground():void
        {
        }

        override protected function initializeAccessibility():void
        {
            if (CheckBox.createAccessibilityImplementation != null)
            {
                CheckBox.createAccessibilityImplementation(this);
            };
        }


    }
}//package fl.controls

