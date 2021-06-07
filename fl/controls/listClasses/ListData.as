// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.controls.listClasses.ListData

package fl.controls.listClasses
{
    import fl.core.UIComponent;

    public class ListData 
    {

        protected var _index:uint;
        protected var _owner:UIComponent;
        protected var _label:String;
        protected var _icon:Object = null;
        protected var _row:uint;
        protected var _column:uint;

        public function ListData(_arg_1:String, _arg_2:Object, _arg_3:UIComponent, _arg_4:uint, _arg_5:uint, _arg_6:uint=0)
        {
            _label = _arg_1;
            protected::_icon = _arg_2;
            _owner = _arg_3;
            _index = _arg_4;
            _row = _arg_5;
            _column = _arg_6;
        }

        public function get owner():UIComponent
        {
            return (_owner);
        }

        public function get label():String
        {
            return (_label);
        }

        public function get row():uint
        {
            return (_row);
        }

        public function get index():uint
        {
            return (_index);
        }

        public function get icon():Object
        {
            return (protected::_icon);
        }

        public function get column():uint
        {
            return (_column);
        }


    }
}//package fl.controls.listClasses

