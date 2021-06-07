// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.controls.listClasses.ICellRenderer

package fl.controls.listClasses
{
    public interface ICellRenderer 
    {

        function setSize(_arg_1:Number, _arg_2:Number):void;
        function get listData():ListData;
        function get data():Object;
        function setMouseState(_arg_1:String):void;
        function set x(_arg_1:Number):void;
        function set y(_arg_1:Number):void;
        function set data(_arg_1:Object):void;
        function set selected(_arg_1:Boolean):void;
        function set listData(_arg_1:ListData):void;
        function get selected():Boolean;

    }
}//package fl.controls.listClasses

