// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.controls.listClasses.CellRenderer

package fl.controls.listClasses
{
    import fl.controls.LabelButton;
    import flash.events.MouseEvent;

    public class CellRenderer extends LabelButton implements ICellRenderer 
    {

        private static var defaultStyles:Object = {
            "upSkin":"CellRenderer_upSkin",
            "downSkin":"CellRenderer_downSkin",
            "overSkin":"CellRenderer_overSkin",
            "disabledSkin":"CellRenderer_disabledSkin",
            "selectedDisabledSkin":"CellRenderer_selectedDisabledSkin",
            "selectedUpSkin":"CellRenderer_selectedUpSkin",
            "selectedDownSkin":"CellRenderer_selectedDownSkin",
            "selectedOverSkin":"CellRenderer_selectedOverSkin",
            "textFormat":null,
            "disabledTextFormat":null,
            "embedFonts":null,
            "textPadding":5
        };

        protected var _data:Object;
        protected var _listData:ListData;

        public function CellRenderer():void
        {
            toggle = true;
            focusEnabled = false;
        }

        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }


        override protected function toggleSelected(_arg_1:MouseEvent):void
        {
        }

        override public function get selected():Boolean
        {
            return (super.selected);
        }

        public function set listData(_arg_1:ListData):void
        {
            _listData = _arg_1;
            label = _listData.label;
            setStyle("icon", _listData.icon);
        }

        override public function set selected(_arg_1:Boolean):void
        {
            super.selected = _arg_1;
        }

        public function set data(_arg_1:Object):void
        {
            _data = _arg_1;
        }

        public function get listData():ListData
        {
            return (_listData);
        }

        override public function setSize(_arg_1:Number, _arg_2:Number):void
        {
            super.setSize(_arg_1, _arg_2);
        }

        override protected function drawLayout():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Number;
            _local_1 = Number(getStyleValue("textPadding"));
            _local_2 = 0;
            if (icon != null)
            {
                icon.x = _local_1;
                icon.y = Math.round(((height - icon.height) >> 1));
                _local_2 = (icon.width + _local_1);
            };
            if (label.length > 0)
            {
                textField.visible = true;
                _local_3 = Math.max(0, ((width - _local_2) - (_local_1 * 2)));
                textField.width = _local_3;
                textField.height = (textField.textHeight + 4);
                textField.x = (_local_2 + _local_1);
                textField.y = Math.round(((height - textField.height) >> 1));
            }
            else
            {
                textField.visible = false;
            };
            background.width = width;
            background.height = height;
        }

        public function get data():Object
        {
            return (_data);
        }


    }
}//package fl.controls.listClasses

