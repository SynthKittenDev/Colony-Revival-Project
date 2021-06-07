// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//aiTactic

package 
{
    public class aiTactic 
    {

        public static var techTreeArray:Array = new Array();
        public static var income:Array = new Array(2, 0, 0, 0, 2, 1, 2);
        public static var techTimeArray:Array = new Array();
        public static var counterArray:Array = new Array();

        {
            techTreeArray[0] = new Array(2, 4, 9, 6, 33, 11);
            techTreeArray[1] = new Array(3, 6, 10, 34, 7, 12);
            techTreeArray[2] = new Array(3, 7, 10, 6, 12, 12, 34);
            techTreeArray[3] = new Array(6, 3, 7, 10, 4, 34, 12);
            techTreeArray[4] = new Array(7, 8, 5, 11, 11, 12);
            techTreeArray[5] = new Array(9, 4, 5, 6, 33, 11);
            techTreeArray[6] = new Array(2, 6, 3, 9, 33, 10, 34, 11);
            techTreeArray[7] = new Array(2, 2, 2, 2);
            techTreeArray[8] = new Array(2, 2, 2, 2);
            techTimeArray[0] = new Array(1, 8, 16, 36, 40, 48);
            techTimeArray[1] = new Array(1, 7, 10, 25, 31, 32);
            techTimeArray[2] = new Array(1, 3, 18, 32, 40, 48, 52);
            techTimeArray[3] = new Array(0, 1, 8, 18, 22, 26, 36);
            techTimeArray[4] = new Array(1, 3, 6, 16, 30, 35);
            techTimeArray[5] = new Array(1, 14, 18, 22, 38, 50);
            techTimeArray[6] = new Array(1, 2, 16, 23, 32, 38, 45, 55);
            techTimeArray[7] = new Array(2, 2, 2, 2);
            techTreeArray[8] = new Array(2, 2, 2, 2);
        }


        public static function init():void
        {
            counterArray[0] = new Array();
            counterArray[0].push(new Array(0, 37, 25, 25, 46, 40, 40));
            counterArray[0].push(new Array(0, 26, 26, 29, 31, 31, 31));
            counterArray[0].push(new Array(0, 26, 26, 43, 47, 47, 47, 48));
            counterArray[0].push(new Array(0, 0, 26, 26, 27, 27, 30, 30));
            counterArray[0].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[0].push(new Array(0, 33, 33, 33, 49, 50, 50));
            counterArray[0].push(new Array(0, 37, 37, 28, 45, 39, 50, 51, 51));
            counterArray[1] = new Array();
            counterArray[1].push(new Array(0, 25, 25, 25, 25, 25, 25));
            counterArray[1].push(new Array(0, 26, 26, 26, 27, 27, 27));
            counterArray[1].push(new Array(0, 35, 35, 35, 35, 27, 27, 27));
            counterArray[1].push(new Array(0, 0, 26, 26, 26, 27, 27, 27));
            counterArray[1].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[1].push(new Array(0, 25, 25, 25, 25, 25, 25));
            counterArray[1].push(new Array(0, 25, 25, 25, 25, 25, 25, 25, 25));
            counterArray[2] = new Array();
            counterArray[2].push(new Array(0, 25, 25, 25, 25, 25, 32));
            counterArray[2].push(new Array(0, 28, 28, 29, 29, 29, 29));
            counterArray[2].push(new Array(0, 28, 29, 29, 29, 29, 29, 29));
            counterArray[2].push(new Array(0, 0, 28, 28, 29, 29, 29, 29));
            counterArray[2].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[2].push(new Array(0, 0, 0, 0, 0, 0, 32));
            counterArray[2].push(new Array(0, 0, 0, 28, 28, 28, 29, 29, 29));
            counterArray[3] = new Array();
            counterArray[3].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[3].push(new Array(0, 0, 0, 29, 29, 29, 29));
            counterArray[3].push(new Array(0, 0, 29, 29, 29, 29, 29, 29));
            counterArray[3].push(new Array(0, 0, 0, 0, 29, 29, 29, 29));
            counterArray[3].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[3].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[3].push(new Array(0, 0, 0, 0, 0, 0, 29, 29, 29));
            counterArray[4] = new Array();
            counterArray[4].push(new Array(0, 0, 0, 0, 33, 32, 32));
            counterArray[4].push(new Array(0, 0, 0, 29, 31, 31, 31));
            counterArray[4].push(new Array(0, 35, 35, 35, 35, 29, 29, 29));
            counterArray[4].push(new Array(0, 0, 0, 0, 29, 29, 29, 29));
            counterArray[4].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[4].push(new Array(0, 33, 33, 33, 33, 32, 32));
            counterArray[4].push(new Array(0, 0, 0, 0, 33, 33, 29, 29, 29));
            counterArray[5] = new Array();
            counterArray[5].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[5].push(new Array(0, 35, 35, 35, 35, 35, 35));
            counterArray[5].push(new Array(0, 35, 35, 35, 35, 35, 35, 35));
            counterArray[5].push(new Array(0, 0, 35, 35, 35, 35, 36, 36));
            counterArray[5].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[5].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[5].push(new Array(0, 0, 0, 35, 35, 35, 35, 35, 35));
            counterArray[6] = new Array();
            counterArray[6].push(new Array(0, 25, 25, 25, 45, 40, 40));
            counterArray[6].push(new Array(0, 26, 26, 26, 35, 35, 35));
            counterArray[6].push(new Array(0, 26, 26, 26, 26, 35, 35, 35));
            counterArray[6].push(new Array(0, 0, 26, 26, 26, 27, 30, 30));
            counterArray[6].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[6].push(new Array(0, 33, 33, 33, 45, 39, 39));
            counterArray[6].push(new Array(0, 25, 25, 33, 45, 39, 39, 39, 39));
            counterArray[7] = new Array();
            counterArray[7].push(new Array(0, 37, 37, 37, 45, 40, 32));
            counterArray[7].push(new Array(0, 28, 28, 44, 38, 38, 38));
            counterArray[7].push(new Array(0, 28, 28, 44, 44, 44, 44, 38));
            counterArray[7].push(new Array(0, 0, 28, 28, 44, 44, 38, 38));
            counterArray[7].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[7].push(new Array(0, 37, 37, 37, 45, 39, 39));
            counterArray[7].push(new Array(0, 37, 37, 28, 28, 28, 38, 38, 38));
            counterArray[8] = new Array();
            counterArray[8].push(new Array(0, 37, 37, 37, 45, 40, 32));
            counterArray[8].push(new Array(0, 26, 26, 26, 35, 35, 35));
            counterArray[8].push(new Array(0, 28, 28, 44, 44, 44, 44, 38));
            counterArray[8].push(new Array(0, 0, 26, 26, 44, 44, 38, 38));
            counterArray[8].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[8].push(new Array(0, 37, 37, 37, 45, 39, 39));
            counterArray[8].push(new Array(0, 37, 37, 28, 28, 28, 38, 38, 38));
            counterArray[9] = new Array();
            counterArray[9].push(new Array(0, 0, 0, 33, 33, 33, 32));
            counterArray[9].push(new Array(0, 0, 0, 29, 29, 29, 29));
            counterArray[9].push(new Array(0, 0, 29, 29, 29, 29, 29, 29));
            counterArray[9].push(new Array(0, 0, 0, 0, 29, 29, 29, 29));
            counterArray[9].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[9].push(new Array(0, 33, 33, 33, 33, 33, 32));
            counterArray[9].push(new Array(0, 0, 0, 0, 33, 32, 32, 32, 32));
            counterArray[10] = new Array();
            counterArray[10].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[10].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[10].push(new Array(0, 0, 0, 0, 0, 0, 0, 0));
            counterArray[10].push(new Array(0, 0, 0, 0, 0, 0, 0, 0));
            counterArray[10].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[10].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[10].push(new Array(0, 0, 0, 0, 0, 0, 0, 0, 0));
            counterArray[11] = new Array();
            counterArray[11].push(new Array(0, 0, 0, 33, 33, 42, 42));
            counterArray[11].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[11].push(new Array(0, 0, 0, 0, 27, 27, 27, 27));
            counterArray[11].push(new Array(0, 0, 0, 0, 0, 30, 30, 30));
            counterArray[11].push(new Array(0, 0, 34, 34, 34, 34, 34));
            counterArray[11].push(new Array(0, 33, 33, 33, 33, 42, 42));
            counterArray[11].push(new Array(0, 0, 0, 0, 33, 41, 41, 41, 41));
            counterArray[12] = new Array();
            counterArray[12].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[12].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[12].push(new Array(0, 0, 0, 0, 0, 0, 0, 0));
            counterArray[12].push(new Array(0, 0, 0, 0, 0, 0, 0, 0));
            counterArray[12].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[12].push(new Array(0, 0, 0, 0, 0, 0, 0));
            counterArray[12].push(new Array(0, 0, 0, 0, 0, 0, 0, 0, 0));
        }

        public static function work(a:Array, id:uint):void
        {
            switch (id)
            {
                case 0:
                    break;
                case 1:
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(27, 4));
                    break;
                case 2:
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(25, 4));
                    break;
                case 3:
                    a.push(new aiOrder(27, 4));
                    a.push(new aiOrder(27, 4));
                    break;
                case 4:
                    a.push(new aiOrder(27, 4));
                    a.push(new aiOrder(25, 4));
                    break;
                case 5:
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(31, 4));
                    break;
                case 6:
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(32, 4));
                    break;
                case 7:
                    a.push(new aiOrder(27, 4));
                    break;
                case 8:
                    a.push(new aiOrder(31, 4));
                    break;
                case 9:
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(27, 4));
                    break;
                case 10:
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(25, 4));
                    a.push(new aiOrder(30, 4));
                    break;
                case 11:
                    a.push(new aiOrder(29, 4));
                    a.push(new aiOrder(27, 4));
                    break;
                case 12:
                    a.push(new aiOrder(29, 4));
                    a.push(new aiOrder(29, 4));
                    break;
                case 13:
                    a.push(new aiOrder(29, 4));
                    a.push(new aiOrder(25, 4));
                    break;
                case 14:
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(32, 4));
                    break;
                case 15:
                    a.push(new aiOrder(26, 4));
                    break;
                case 16:
                    a.push(new aiOrder(31, 4));
                    a.push(new aiOrder(27, 4));
                    break;
                case 17:
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(27, 4));
                    break;
                case 18:
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(27, 4));
                    break;
                case 19:
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(27, 4));
                    break;
                case 20:
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(29, 4));
                    break;
                case 21:
                    a.push(new aiOrder(44, 7));
                    break;
                case 22:
                    a.push(new aiOrder(25, 4));
                    break;
                case 23:
                    a.push(new aiOrder(27, 4));
                    a.push(new aiOrder(32, 4));
                    break;
                case 24:
                    a.push(new aiOrder(29, 4));
                    a.push(new aiOrder(32, 4));
                    break;
                case 25:
                    a.push(new aiOrder(14, 2));
                    a.push(new aiOrder(13, 2));
                    a.push(new aiOrder(44, 10));
                    break;
                case 26:
                    a.push(new aiOrder(5, 10));
                    a.push(new aiOrder(15, 2));
                    a.push(new aiOrder(35, 10));
                    // trace("Go Make Units!");
                    break;
                case 27:
                    a.push(new aiOrder(21, 2));
                    a.push(new aiOrder(16, 3));
                    a.push(new aiOrder(35, 10));
                    break;
                case 28:
                    a.push(new aiOrder(15, 2));
                    a.push(new aiOrder(35, 10));
                    break;
                case 29:
                    a.push(new aiOrder(19, 1));
                    a.push(new aiOrder(16, 3));
                    a.push(new aiOrder(35, 10));
                    break;
                case 30:
                    a.push(new aiOrder(21, 2));
                    a.push(new aiOrder(17, 3));
                    a.push(new aiOrder(35, 10));
                    break;
                case 31:
                    a.push(new aiOrder(43, 1));
                    a.push(new aiOrder(35, 10));
                    break;
                case 32:
                    a.push(new aiOrder(23, 1));
                    a.push(new aiOrder(18, 2));
                    a.push(new aiOrder(44, 10));
                    break;
                case 33:
                    a.push(new aiOrder(24, 5));
                    a.push(new aiOrder(44, 10));
                    break;
                case 34:
                    a.push(new aiOrder(37, 1));
                    break;
                case 35:
                    a.push(new aiOrder(16, 12));
                    a.push(new aiOrder(35, 10));
                    break;
                case 36:
                    a.push(new aiOrder(16, 12));
                    a.push(new aiOrder(17, 3));
                    a.push(new aiOrder(35, 10));
                    break;
                case 37:
                    a.push(new aiOrder(13, 15));
                    a.push(new aiOrder(44, 10));
                    break;
                case 38:
                    a.push(new aiOrder(20, 1));
                    a.push(new aiOrder(35, 10));
                    break;
                case 39:
                    a.push(new aiOrder(18, 2));
                    a.push(new aiOrder(13, 3));
                    a.push(new aiOrder(44, 10));
                    break;
                case 40:
                    a.push(new aiOrder(18, 3));
                    a.push(new aiOrder(17, 6));
                    a.push(new aiOrder(44, 10));
                    break;
                case 41:
                    a.push(new aiOrder(22, 2));
                    a.push(new aiOrder(44, 10));
                    break;
                case 42:
                    a.push(new aiOrder(22, 3));
                    a.push(new aiOrder(17, 6));
                    a.push(new aiOrder(44, 10));
                    break;
                case 43:
                    a.push(new aiOrder(15, 10));
                    a.push(new aiOrder(35, 10));
                    break;
                case 44:
                    a.push(new aiOrder(39, 1));
                    a.push(new aiOrder(35, 10));
                    break;
                case 45:
                    a.push(new aiOrder(38, 2));
                    a.push(new aiOrder(13, 3));
                    a.push(new aiOrder(44, 10));
                    break;
                case 46:
                    a.push(new aiOrder(38, 3));
                    a.push(new aiOrder(17, 6));
                    a.push(new aiOrder(44, 10));
                    break;
                case 47:
                    a.push(new aiOrder(16, 2));
                    a.push(new aiOrder(15, 1));
                    a.push(new aiOrder(19, 1));
                    a.push(new aiOrder(35, 10));
                    break;
                case 48:
                    a.push(new aiOrder(39, 1));
                    a.push(new aiOrder(21, 2));
                    a.push(new aiOrder(35, 10));
                    break;
                case 49:
                    a.push(new aiOrder(18, 2));
                    a.push(new aiOrder(13, 3));
                    a.push(new aiOrder(24, 2));
                    a.push(new aiOrder(44, 10));
                    break;
                case 50:
                    a.push(new aiOrder(24, 2));
                    a.push(new aiOrder(18, 1));
                    a.push(new aiOrder(22, 1));
                    a.push(new aiOrder(44, 10));
                    break;
                case 51:
                    a.push(new aiOrder(39, 1));
                    a.push(new aiOrder(21, 2));
                    a.push(new aiOrder(35, 10));
                    a.push(new aiOrder(24, 2));
                    a.push(new aiOrder(18, 1));
                    a.push(new aiOrder(22, 1));
                    a.push(new aiOrder(44, 10));
                    break;
                case 52:
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(27, 4));
                    a.push(new aiOrder(32, 4));
                    break;
                case 53:
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(29, 4));
                    a.push(new aiOrder(32, 4));
                    break;
                case 54:
                    a.push(new aiOrder(35, 10));
                    break;
                case 55:
                    a.push(new aiOrder(31, 4));
                    break;
                case 56:
                    a.push(new aiOrder(30, 4));
                    break;
                case 57:
                    a.push(new aiOrder(23, 4));
                    break;
                case 58:
                    a.push(new aiOrder(25, 4));
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(27, 4));
                    a.push(new aiOrder(27, 4));
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(29, 4));
                    a.push(new aiOrder(29, 4));
                    a.push(new aiOrder(44, 3));
                    a.push(new aiOrder(35, 3));
                    a.push(new aiOrder(31, 4));
                    break;
                case 59:
                    a.push(new aiOrder(17, 6));
                    a.push(new aiOrder(25, 4));
                    a.push(new aiOrder(26, 4));
                    a.push(new aiOrder(27, 4));
                    a.push(new aiOrder(27, 4));
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(28, 4));
                    a.push(new aiOrder(29, 4));
                    a.push(new aiOrder(29, 4));
                    a.push(new aiOrder(44, 3));
                    a.push(new aiOrder(35, 3));
                    a.push(new aiOrder(31, 4));
                case 60:
                    a.push(new aiOrder(46, 1));
                    break;
                case 61:
                    a.push(new aiOrder(47, 1));
                    break;
                case 62:
                    a.push(new aiOrder(48, 1));
                    break;
            };
        }


    }
}//package 

