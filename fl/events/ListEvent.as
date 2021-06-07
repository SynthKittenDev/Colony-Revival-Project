// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.events.ListEvent

package fl.events
{
    import flash.events.Event;

    public class ListEvent extends Event 
    {

        public static const ITEM_ROLL_OUT:String = "itemRollOut";
        public static const ITEM_ROLL_OVER:String = "itemRollOver";
        public static const ITEM_CLICK:String = "itemClick";
        public static const ITEM_DOUBLE_CLICK:String = "itemDoubleClick";

        protected var _index:int;
        protected var _item:Object;
        protected var _columnIndex:int;
        protected var _rowIndex:int;

        public function ListEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false, _arg_4:int=-1, _arg_5:int=-1, _arg_6:int=-1, _arg_7:Object=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _rowIndex = _arg_5;
            _columnIndex = _arg_4;
            _index = _arg_6;
            _item = _arg_7;
        }

        public function get rowIndex():Object
        {
            return (_rowIndex);
        }

        public function get index():int
        {
            return (_index);
        }

        public function get item():Object
        {
            return (_item);
        }

        public function get columnIndex():int
        {
            return (_columnIndex);
        }

        override public function clone():Event
        {
            return (new ListEvent(type, bubbles, cancelable, _columnIndex, _rowIndex));
        }

        override public function toString():String
        {
            return (formatToString("ListEvent", "type", "bubbles", "cancelable", "columnIndex", "rowIndex", "index", "item"));
        }


    }
}//package fl.events

