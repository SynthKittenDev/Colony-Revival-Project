// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//buildingData

package 
{
    public class buildingData 
    {

        public static var LIST:Array = new Array();

        private var iN:Number = -1;
        private var build:Array = new Array();

        public function buildingData()
        {
            this.make("Ground Zero", 0, "This is an underground construction site.");
            this.build.options = [2, 3, 4, 5, 6, 7, 8, null];
            this.make("Main", 1, "Main");
            this.build.options = [null, null, null, null, null, null, null, null];
            this.make("Outpost", 2, "This is a Tier-1 unit deployment structure.");
            this.build.options = [13, 14, 44, 9, null, null, null, 0];
            this.make("Forge", 5, "This is a Tier-1 unit deployment structure.");
            this.build.options = [16, 15, 35, 10, null, null, null, 0];
            this.make("Hospital", 12, "This is a Tier-1 hybrid structure.");
            this.build.options = [25, 17, 45, 54, null, null, null, 0];
            this.make("Bank", 10, "This is a Tier-1 resource structure.");
            this.build.options = [26, 11, 0, null, null, null, null, null];
            this.build.autoBuild = 0;
            this.make("Armory", 13, "This is a Tier-2 resource structure.");
            this.build.options = [31, 30, 32, 47, 59, null, null, 0];
            this.make("Generator", 8, "This is a Tier-1 resource structure.");
            this.build.options = [27, 12, 0, null, null, null, null, null];
            this.build.autoBuild = 0;
            this.make("Special Operations", 14, "This is a Tier-3 weapons structure.");
            this.build.options = [37, 40, null, 50, 48, 49, 52, 0];
            this.make("Barracks", 3, "This is a Tier-2 unit deployment structure.");
            this.build.options = [13, 14, 24, 38, 44, 33, null, 0];
            this.make("Manufactory", 6, "This is a Tier-2 unit deployment structure.");
            this.build.options = [16, 15, 19, 39, 35, 34, null, 0];
            this.make("Arsenal", 4, "This is a Tier-3 unit deployment structure.");
            this.build.options = [13, 14, 24, 18, 22, 23, 44, 0];
            this.make("Mechanics Terminal", 7, "This is a Tier-3 unit deployment structure.");
            this.build.options = [16, 15, 19, 20, 21, 43, 35, 0];
            this.make("Treasury", 11, "This is a Tier-3 resource structure.");
            this.build.options = [28, 0, null, null, null, null, null, null];
            this.build.autoBuild = 0;
            this.make("Solar Grid", 9, "This is a Tier-3 resource structure.");
            this.build.options = [29, 46, 0, null, null, null, null, null];
            this.build.autoBuild = 0;
            this.make("War Sanctum", 15, "This is a Tier-3 resource structure.");
            this.build.options = [55, 17, 58, 51, 45, 60, 57, 0];
        }

        private function make(a:String, b:uint, c:String):void
        {
            this.iN++;
            LIST[this.iN] = new Array();
            LIST[this.iN].push(a, b, c);
            LIST[this.iN].options = new Array();
            LIST[this.iN].autoBuild = null;
            this.build = LIST[this.iN];
        }


    }
}//package 

