// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//weaponData

package 
{
    public class weaponData 
    {

        public static var LIST:Array = new Array();

        private var iN:Number = -1;
        private var wep:Array = new Array();

        public function weaponData()
        {
            this.make([15, 15, 260, 9, 0, true, 0, 0, 0, 0, 4, 0]);
            this.make([10, 45, 382, 40, 7, false, 0, 1, 1, 0, 12, 0]);
            this.make([94, 30, 439, 57, 0, false, 1, 2, 2, 2, 9, 0]);
            this.make([120, 15, 360, 70, 43, false, 2, 4, 1, 7, 10, 3]);
            this.make([35, 15, 390, 140, 0, false, 3, 5, 2, 6, 2, 2]);
            this.make([5, 23, 395, 11, 0, false, 4, 6, 1, 0, 11, 0]);
            this.make([30, 19, 375, 93, 0, false, 5, 7, 1, 3, 7, 0]);
            this.make([50, 18, 430, 63, 52, false, 6, 8, 2, 4, 8, 4]);
            this.make([4, 20, 400, 6, 40, false, 7, 6, 1, 9, 5, 0]);
            this.make([360, 17, 500, 140, 85, false, 8, 3, 3, 1, 1, 1]);
            this.make([18, 20, 380, 80, 0, false, 8, 6, 1, 1, 3, 3]);
            this.make([25, 25, 380, 20, 0, false, 6, 1, 2, 0, 8, 0]);
            this.make([15, 25, 190, 12, 0, true, 9, 9, 1, 0, 0, 0]);
            this.make([30, 20, 215, 35, 10, false, 0, 1, 0, 0, 6, 0]);
            this.make([80, 30, 420, 20, 0, false, 1, 2, 2, 2, 9, 5]);
            this.make([70, 18, 400, 40, 28, false, 6, 8, 2, 4, 8, 4]);
            this.make([180, 18, 385, 37, 5, false, 4, 4, 0, 10, 3, 3]);
            this.make([4, 30, 350, 20, 0, false, 10, 0, 3, 11, 12, 0]);
            this.make([12, 20, 420, 27, 0, false, 10, 0, 3, 11, 12, 0]);
            this.make([15, 18, 300, 110, 10, false, 5, 7, 1, 3, 7, 0]);
            this.make([4, 20, 400, 12, 40, false, 7, 6, 1, 9, 5, 0]);
            this.make([10, 15, 300, 12, 0, true, 0, 0, 0, 0, 4, 0]);
            this.make([180, 25, 430, 40, 25, false, 4, 4, 0, 10, 3, 3]);
            this.make([340, 42, 650, 350, 0, false, 11, 7, 2, 12, 9, 0]);
            this.make([2, 25, 395, 7, 20, false, 12, 6, 3, 0, 12, 0]);
            this.make([18, 30, 420, 57, 0, false, 1, 2, 2, 2, 9, 0]);
            this.make([47, 18, 250, 230, 7, false, 5, 7, 1, 3, 7, 0]);
            this.make([22, 40, 450, 85, 0, false, 11, 7, 2, 12, 9, 0]);
            this.make([3, 23, 360, 19, 0, false, 4, 6, 1, 0, 11, 0]);
            this.make([16, 25, 190, 5, 0, true, 9, 9, 1, 0, 0, 0]);
        }

        private function make(a:Array):void
        {
            var i:*;
            this.iN++;
            LIST[this.iN] = new Array();
            for (i in a)
            {
                LIST[this.iN][i] = a[i];
            };
        }


    }
}//package 

