// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.events.DataChangeEvent

package fl.events
{
    import flash.events.Event;

    public class DataChangeEvent extends Event 
    {

        public static const DATA_CHANGE:String = "dataChange";
        public static const PRE_DATA_CHANGE:String = "preDataChange";

        protected var _items:Array;
        protected var _endIndex:uint;
        protected var _changeType:String;
        protected var _startIndex:uint;

        public function DataChangeEvent(_arg_1:String, _arg_2:String, _arg_3:Array, _arg_4:int=-1, _arg_5:int=-1):void
        {
            super(_arg_1);
            _changeType = _arg_2;
            _startIndex = _arg_4;
            _items = _arg_3;
            _endIndex = ((_arg_5 == -1) ? _startIndex : _arg_5);
        }

        public function get changeType():String
        {
            return (_changeType);
        }

        public function get startIndex():uint
        {
            return (_startIndex);
        }

        public function get items():Array
        {
            return (_items);
        }

        override public function clone():Event
        {
            return (new DataChangeEvent(type, _changeType, _items, _startIndex, _endIndex));
        }

        override public function toString():String
        {
            return (formatToString("DataChangeEvent", "type", "changeType", "startIndex", "endIndex", "bubbles", "cancelable"));
        }

        public function get endIndex():uint
        {
            return (_endIndex);
        }


    }
}//package fl.events

