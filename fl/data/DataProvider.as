// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.data.DataProvider

package fl.data
{
    import flash.events.EventDispatcher;
    import fl.events.DataChangeEvent;
    import fl.events.DataChangeType;

    public class DataProvider extends EventDispatcher 
    {

        protected var data:Array;

        public function DataProvider(_arg_1:Object=null)
        {
            if (_arg_1 == null)
            {
                data = [];
            }
            else
            {
                data = getDataFromObject(_arg_1);
            };
        }

        protected function dispatchPreChangeEvent(_arg_1:String, _arg_2:Array, _arg_3:int, _arg_4:int):void
        {
            dispatchEvent(new DataChangeEvent(DataChangeEvent.PRE_DATA_CHANGE, _arg_1, _arg_2, _arg_3, _arg_4));
        }

        public function invalidateItemAt(_arg_1:int):void
        {
            checkIndex(_arg_1, (data.length - 1));
            dispatchChangeEvent(DataChangeType.INVALIDATE, [data[_arg_1]], _arg_1, _arg_1);
        }

        public function getItemIndex(_arg_1:Object):int
        {
            return (data.indexOf(_arg_1));
        }

        protected function getDataFromObject(_arg_1:Object):Array
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:uint;
            var _local_5:Object;
            var _local_6:XML;
            var _local_7:XMLList;
            var _local_8:XML;
            var _local_9:XMLList;
            var _local_10:XML;
            var _local_11:XMLList;
            var _local_12:XML;
            if ((_arg_1 is Array))
            {
                _local_3 = (_arg_1 as Array);
                if (_local_3.length > 0)
                {
                    if (((_local_3[0] is String) || (_local_3[0] is Number)))
                    {
                        _local_2 = [];
                        _local_4 = 0;
                        while (_local_4 < _local_3.length)
                        {
                            _local_5 = {
                                "label":String(_local_3[_local_4]),
                                "data":_local_3[_local_4]
                            };
                            _local_2.push(_local_5);
                            _local_4++;
                        };
                        return (_local_2);
                    };
                };
                return (_arg_1.concat());
            };
            if ((_arg_1 is DataProvider))
            {
                return (_arg_1.toArray());
            };
            if ((_arg_1 is XML))
            {
                _local_6 = (_arg_1 as XML);
                _local_2 = [];
                _local_7 = _local_6.*;
                for each (_local_8 in _local_7)
                {
                    _arg_1 = {};
                    _local_9 = _local_8.attributes();
                    for each (_local_10 in _local_9)
                    {
                        _arg_1[_local_10.localName()] = _local_10.toString();
                    };
                    _local_11 = _local_8.*;
                    for each (_local_12 in _local_11)
                    {
                        if (_local_12.hasSimpleContent())
                        {
                            _arg_1[_local_12.localName()] = _local_12.toString();
                        };
                    };
                    _local_2.push(_arg_1);
                };
                return (_local_2);
            };
            throw (new TypeError((("Error: Type Coercion failed: cannot convert " + _arg_1) + " to Array or DataProvider.")));
        }

        public function removeItemAt(_arg_1:uint):Object
        {
            var _local_2:Array;
            checkIndex(_arg_1, (data.length - 1));
            dispatchPreChangeEvent(DataChangeType.REMOVE, data.slice(_arg_1, (_arg_1 + 1)), _arg_1, _arg_1);
            _local_2 = data.splice(_arg_1, 1);
            dispatchChangeEvent(DataChangeType.REMOVE, _local_2, _arg_1, _arg_1);
            return (_local_2[0]);
        }

        public function addItem(_arg_1:Object):void
        {
            dispatchPreChangeEvent(DataChangeType.ADD, [_arg_1], (data.length - 1), (data.length - 1));
            data.push(_arg_1);
            dispatchChangeEvent(DataChangeType.ADD, [_arg_1], (data.length - 1), (data.length - 1));
        }

        public function sortOn(_arg_1:Object, _arg_2:Object=null):*
        {
            var _local_3:Array;
            dispatchPreChangeEvent(DataChangeType.SORT, data.concat(), 0, (data.length - 1));
            _local_3 = data.sortOn(_arg_1, _arg_2);
            dispatchChangeEvent(DataChangeType.SORT, data.concat(), 0, (data.length - 1));
            return (_local_3);
        }

        public function sort(... _args):*
        {
            var _local_2:Array;
            dispatchPreChangeEvent(DataChangeType.SORT, data.concat(), 0, (data.length - 1));
            _local_2 = data.sort.apply(data, _args);
            dispatchChangeEvent(DataChangeType.SORT, data.concat(), 0, (data.length - 1));
            return (_local_2);
        }

        public function addItems(_arg_1:Object):void
        {
            addItemsAt(_arg_1, data.length);
        }

        public function concat(_arg_1:Object):void
        {
            addItems(_arg_1);
        }

        public function clone():DataProvider
        {
            return (new DataProvider(data));
        }

        public function toArray():Array
        {
            return (data.concat());
        }

        public function get length():uint
        {
            return (data.length);
        }

        public function addItemAt(_arg_1:Object, _arg_2:uint):void
        {
            checkIndex(_arg_2, data.length);
            dispatchPreChangeEvent(DataChangeType.ADD, [_arg_1], _arg_2, _arg_2);
            data.splice(_arg_2, 0, _arg_1);
            dispatchChangeEvent(DataChangeType.ADD, [_arg_1], _arg_2, _arg_2);
        }

        public function getItemAt(_arg_1:uint):Object
        {
            checkIndex(_arg_1, (data.length - 1));
            return (data[_arg_1]);
        }

        override public function toString():String
        {
            return (("DataProvider [" + data.join(" , ")) + "]");
        }

        public function invalidateItem(_arg_1:Object):void
        {
            var _local_2:uint;
            _local_2 = getItemIndex(_arg_1);
            if (_local_2 == -1)
            {
                return;
            };
            invalidateItemAt(_local_2);
        }

        protected function dispatchChangeEvent(_arg_1:String, _arg_2:Array, _arg_3:int, _arg_4:int):void
        {
            dispatchEvent(new DataChangeEvent(DataChangeEvent.DATA_CHANGE, _arg_1, _arg_2, _arg_3, _arg_4));
        }

        protected function checkIndex(_arg_1:int, _arg_2:int):void
        {
            if (((_arg_1 > _arg_2) || (_arg_1 < 0)))
            {
                throw (new RangeError((((("DataProvider index (" + _arg_1) + ") is not in acceptable range (0 - ") + _arg_2) + ")")));
            };
        }

        public function addItemsAt(_arg_1:Object, _arg_2:uint):void
        {
            var _local_3:Array;
            checkIndex(_arg_2, data.length);
            _local_3 = getDataFromObject(_arg_1);
            dispatchPreChangeEvent(DataChangeType.ADD, _local_3, _arg_2, ((_arg_2 + _local_3.length) - 1));
            data.splice.apply(data, [_arg_2, 0].concat(_local_3));
            dispatchChangeEvent(DataChangeType.ADD, _local_3, _arg_2, ((_arg_2 + _local_3.length) - 1));
        }

        public function replaceItem(_arg_1:Object, _arg_2:Object):Object
        {
            var _local_3:int;
            _local_3 = getItemIndex(_arg_2);
            if (_local_3 != -1)
            {
                return (replaceItemAt(_arg_1, _local_3));
            };
            return (null);
        }

        public function removeItem(_arg_1:Object):Object
        {
            var _local_2:int;
            _local_2 = getItemIndex(_arg_1);
            if (_local_2 != -1)
            {
                return (removeItemAt(_local_2));
            };
            return (null);
        }

        public function merge(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:uint;
            var _local_6:Object;
            _local_2 = getDataFromObject(_arg_1);
            _local_3 = _local_2.length;
            _local_4 = data.length;
            dispatchPreChangeEvent(DataChangeType.ADD, data.slice(_local_4, data.length), _local_4, (this.data.length - 1));
            _local_5 = 0;
            while (_local_5 < _local_3)
            {
                _local_6 = _local_2[_local_5];
                if (getItemIndex(_local_6) == -1)
                {
                    data.push(_local_6);
                };
                _local_5++;
            };
            if (data.length > _local_4)
            {
                dispatchChangeEvent(DataChangeType.ADD, data.slice(_local_4, data.length), _local_4, (this.data.length - 1));
            }
            else
            {
                dispatchChangeEvent(DataChangeType.ADD, [], -1, -1);
            };
        }

        public function replaceItemAt(_arg_1:Object, _arg_2:uint):Object
        {
            var _local_3:Array;
            checkIndex(_arg_2, (data.length - 1));
            _local_3 = [data[_arg_2]];
            dispatchPreChangeEvent(DataChangeType.REPLACE, _local_3, _arg_2, _arg_2);
            data[_arg_2] = _arg_1;
            dispatchChangeEvent(DataChangeType.REPLACE, _local_3, _arg_2, _arg_2);
            return (_local_3[0]);
        }

        public function invalidate():void
        {
            dispatchEvent(new DataChangeEvent(DataChangeEvent.DATA_CHANGE, DataChangeType.INVALIDATE_ALL, data.concat(), 0, data.length));
        }

        public function removeAll():void
        {
            var _local_1:Array;
            _local_1 = data.concat();
            dispatchPreChangeEvent(DataChangeType.REMOVE_ALL, _local_1, 0, _local_1.length);
            data = [];
            dispatchChangeEvent(DataChangeType.REMOVE_ALL, _local_1, 0, _local_1.length);
        }


    }
}//package fl.data

