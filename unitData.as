// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//unitData

package 
{
    public class unitData 
    {

        public static var LIST:Array = new Array();
        public static var LIST2:Array = new Array();

        private var iN:Number = -1;
        private var unit:Array = new Array();
        public var mul:Number;

        public function unitData()
        {
            this.mul = Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number((1 + (Math.random() * 4))))))))))))))))))))))))));
            this.make("Central Base", false, 5000, 0, 0, 3, 1, 15, false, 0, "This is the headquarters. Equipped with powerful defensive weapons.", 0, 0, 3);
            this.make("Marine", false, 62, 3, 1, 0, 0, 16, false, 0, "Light armor. Armed with shock rifles and rockets, effective against both ground and air.", 25, 16.4);
            this.unit.Value = 1;
            this.unit.deathSound = 3;
            this.make("Chronite Tank", false, 310, 1, 2, 2, 3, null, false, 0, "Chronite (heavy) armor. Armed with explosive shells, but cannot fire at air targets.", 100, 10, 3);
            this.unit.Value = 5;
            this.unit.deathSound = 4;
            this.make("Scout", true, 140, 5, 11, 1, 11, 11, false, 0, "Titanium armor. Armed with pulse lasers. ", 57, 44, 3);
            this.unit.Value = 3;
            this.unit.deathSound = 6;
            this.make("A25-Roman", false, 250, 4, 4, 1, 13, null, false, 0, "Titanium armor. Armed with pulse rifles, but cannot fire at air targets.", 22, 16);
            this.unit.Value = 2;
            this.unit.deathSound = 5;
            this.make("Meditec", false, 100, 3, 12, 0, 12, null, true, 0, "Light armor. Can heal/repair any friendly ground unit.", 22, 16);
            this.unit.Value = 2;
            this.unit.deathSound = 3;
            this.make("Gröditz", false, 350, 2, 7, 2, 5, 5, false, 0, "Chronite (heavy) armor. Armed with standard machine guns.", 47, 32, 3);
            this.unit.Value = 7;
            this.unit.deathSound = 4;
            this.make("Phantom", true, 320, 4, 3, 1, 8, null, false, 0, "Titanium armor. Armed with area-damage rapid cannons.", 61, 43.3, 3);
            this.unit.Value = 7;
            this.unit.deathSound = 4;
            this.make("Sakata Spider", false, 350, 4, 8, 2, 6, null, false, 0.57, "Chronite (heavy) armor. Armed with singular voltage beams. Self repairing technology.", 54, 5, 3);
            this.unit.Value = 10;
            this.unit.deathSound = 4;
            this.make("Sakata Mk-II", false, 200, 4, 9, 4, null, 7, false, 0.3, "Special armor. Armed with anti-air Hadron cannons. Cannot attack ground targets.", 64, 5, 3);
            this.unit.Value = 7;
            this.unit.deathSound = 4;
            this.make("Hover Tank", false, 370, 3, 6, 4, 4, null, false, 0, "Special armor, resistant against missile damage. Armed with high impact, linear Positron cannons.", 102, 10, 3);
            this.unit.Value = 10;
            this.unit.deathSound = 4;
            this.make("Black Queen", true, 550, 4, 10, 4, 9, 10, false, 0, "Special armor, resistant against missile damage. Armed with anti-air missiles, and long ranged bombs.", 46, 37, 3);
            this.unit.Value = 15;
            this.unit.deathSound = 1;
            this.make("Sniper", false, 154, 4, 5, 0, 2, 14, false, 0, "Light armor. Equipped with armor-piercing Positron rifles. Not as effective against air targets.", 38, 9.3);
            this.unit.Value = 3;
            this.unit.deathSound = 3;
            this.make("A28-Gladiator", false, 650, 6, 13, 4, 17, 18, false, 0, "Special armor, resistant against missile damage. Armed with a high frequency pulse rifle.  Not as effective against air targets.", 22, 16);
            this.unit.Value = 15;
            this.unit.deathSound = 2;
            this.make("Mod. Sakata", false, 450, 6, 14, 2, 19, null, false, 2, "Modified to be faster in movement, firing, and repairing.", 54, 5, 3);
            this.unit.Value = 12;
            this.unit.deathSound = 4;
            this.make("Mod. Phantom", true, 400, 5, 15, 1, 20, null, false, 0, "Modified to have stronger weapons and more durable armor.", 61, 43.3, 3);
            this.unit.Value = 12;
            this.unit.deathSound = 4;
            this.make("S-Marine", false, 230, 5, 1, 0, 21, 22, false, 0.3, "Specially trained to live longer, and do more damage.", 25, 16.4);
            this.unit.Value = 6;
            this.unit.deathSound = 3;
            this.make("Far Sniper", false, 120, 4, 16, 0, 23, null, false, 0, "Light armor. Equipped with armor-piercing Heavy Positron rifles, which do exceptional damage to ground units. Massive range, but can't attack air units.", 38, 9.3);
            this.unit.Value = 3;
            this.unit.deathSound = 3;
            this.make("Saint", true, 400, 5, 18, 4, 25, 4, false, 0.2, "Special armor. Armed with anti-air Positron cannons, and rapid ground rifles. Self-repairing technology.", 53, 48.5, 3);
            this.unit.Value = 15;
            this.unit.deathSound = 6;
            this.make("A27-Pride", false, 375, 4, 17, 4, 24, 24, false, 0, "Special armor, resistant against missile damage. Armed with a high range pulse rifle.", 22, 16);
            this.unit.Value = 15;
            this.unit.deathSound = 2;
            this.make("Sphinx", false, 1300, 2, 19, 5, 26, 27, false, 0, "Composite Armor, effective against heavy attacks, but weak against light attacks. Fires anti-special armor shells.", 59, 15, 3);
            this.unit.Value = 15;
            this.unit.deathSound = 4;
            this.make("Angel", true, 75, 3, 12, 0, null, 29, true, 0, "Light armor. Can heal/repair any friendly air unit.", 59, 15);
            this.unit.Value = 2;
            this.unit.deathSound = 4;
            this.make("Mod. Gröditz", false, 500, 2, 7, 2, 28, 28, false, 0, "Modified Chronite (heavy) armor. Armed with dual Mk II machine guns.", 47, 32, 3);
            this.unit.Value = 7;
            this.unit.deathSound = 4;
        }

        private function make(a:String, b:Boolean, c:uint, d:uint, e:uint, f:uint, g:*, h:*, i:Boolean, j:Number, k:String, l:Number=0, m:Number=0, o:uint=0):void
        {
            this.iN++;
            LIST[this.iN] = new Array();
            LIST2[this.iN] = new Array();
            this.doMake(LIST[this.iN], 1, a, b, c, d, e, f, g, h, i, j, k, l, m, o);
            this.doMake(LIST2[this.iN], this.mul, a, b, c, d, e, f, g, h, i, j, k, l, m, o);
            this.unit = LIST[this.iN];
        }

        private function doMake(unit:Array, multi:Number, a:String, b:Boolean, c:uint, d:uint, e:uint, f:uint, g:*, h:*, i:Boolean, j:Number, k:String, l:Number=0, m:Number=0, o:uint=0):void
        {
            unit.Name = a;
            unit.Air = b;
            unit.Life = (c * multi);
            unit.Speed = (d * multi);
            unit.Graphic = (e * multi);
            unit.Armor = (f * multi);
            unit.Weapon_G = g;
            unit.Weapon_A = h;
            unit.Healer = i;
            unit.selfHeal = (j * multi);
            unit.Desc = k;
            unit.setX = (l * multi);
            unit.setY = (m * multi);
            unit.exDie = o;
            unit.deathSound = 0;
            unit.Value = 0;
        }

        public function checkData():Boolean
        {
            var i:*;
            var j:*;
            var boss:Number;
            var checkData:Array = ["Life", "Speed", "Graphic", "Armor", "selfHeal", "setX", "setY"];
            for (i in LIST)
            {
                for (j in checkData)
                {
                    boss = (Math.round(((LIST2[i][checkData[j]] / this.mul) * 1000)) / 1000);
                    if (LIST[i][checkData[j]] != boss)
                    {
                        // trace(((("UNIT: " + LIST[i][checkData[j]]) + " -- ") + boss));
                        return (true);
                    };
                };
            };
            return (false);
        }


    }
}//package 

