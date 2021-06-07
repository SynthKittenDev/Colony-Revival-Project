// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//optionData

package 
{
    public class optionData 
    {

        public static var LIST:Array = new Array();
        public static var LIST2:Array = new Array();

        private var iN:Number = -1;
        private var option:Array = new Array();
        private var mul:Number = Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number(Number((1 + (Math.random() * 4)))))))))))))))))))))))));

        public function optionData()
        {
            this.make(0, 0, 0, 5, "Destroy", [0, 24], "Demolish this building to make room for a new one.");
            this.option.buildOrder = 0;
            this.make(0, 0, 0, 1, "Main Base", [0, 0], "X");
            this.option.buildOrder = 1;
            this.make(40, 30, 30, 5, "Build Outpost", [1, 0], "You can deploy marines, tanks, and other combat vehicles from this building.");
            this.option.buildOrder = 2;
            this.make(40, 30, 30, 5, "Build Forge", [1, 0], "You can deploy sky drones and android forces from this building.");
            this.option.buildOrder = 3;
            this.make(40, 10, 30, 5, "Build Hospital", [1, 0], "Treat the wounded, and deploy meditecs from this building.");
            this.option.buildOrder = 4;
            this.make(50, 0, 0, 10, "Build Bank", [1, 0], "This building allows you to gain financial resources.");
            this.option.buildOrder = 5;
            this.make(60, 25, 25, 15, "Build Armory", [1, 0], "This building allows to call in any additional supplies.");
            this.option.buildOrder = 6;
            this.make(50, 0, 0, 10, "Build Generator", [1, 0], "This building allows you to gain energy resources.");
            this.option.buildOrder = 7;
            this.make(80, 30, 30, 20, "Build Special Operations", [1, 0], "Launch missiles from this building.");
            this.option.buildOrder = 8;
            this.make(30, 0, 0, 17, "Upgrade to Barracks", [1, 0], "Upgrade this building into a Barracks (Tier 2).");
            this.option.buildOrder = 9;
            this.make(60, 0, 0, 15, "Upgrade to Manufactory", [1, 0], "Upgrade this building into a Manfactory (Tier 2).");
            this.option.buildOrder = 10;
            this.make(50, 0, 0, 15, "Upgrade to Treasury", [1, 0], "Upgrade this building into a Treasury (Tier 3).");
            this.option.buildOrder = 13;
            this.make(50, 0, 0, 15, "Upgrade to Solar Grid", [1, 0], "Upgrade this building into a Solar Grid (Tier 3).");
            this.option.buildOrder = 14;
            this.make(0, 2, 0, 1.2, "Deploy Marine", [0, 6], "Light infantry unit, armed with shocks rifles and anti-air rockets.");
            this.option.buildUnits = new Array([1]);
            this.make(5, 10, 0, 5, "Deploy Chronite Tank", [0, 7], "Heavily armored vehicle. Fires explosive shells at ground targets.");
            this.option.buildUnits = new Array([2]);
            this.make(3, 0, 7, 4, "Deploy Scout", [0, 8], "Fast flying drone with light armor. Fitted with formidable chronite-piercing weapons.");
            this.option.buildUnits = new Array([3]);
            this.make(0, 0, 5, 1.2, "Deploy A25-Roman", [0, 9], "Standard android soldier, armed with pulse rifles. Can't attack air units.");
            this.option.buildUnits = new Array([4]);
            this.make(0, 6, 0, 6, "Deploy Meditec", [0, 10], "Light infantry unit that heals injured men and fixes any damaged ground vehicles.");
            this.option.buildUnits = new Array([5]);
            this.make(5, 15, 0, 5, "Deploy Gröditz", [0, 12], "Heavy bi-pedal 'Walker' unit with rapid firing weapons, effective against both ground and air targets.");
            this.option.buildUnits = new Array([6]);
            this.make(23, 5, 3, 7.3, "Deploy Phantom", [0, 13], "Assault helicopter that can rain down rapid fire against ground targets, but cannot fire at air targets.");
            this.option.buildUnits = new Array([7]);
            this.make(0, 0, 21, 5, "Deploy Sakata Mk-II", [0, 14], "Standard Sakata body, fitted with strong anti-air cannons, but unable to attack ground targets.");
            this.option.buildUnits = new Array([9]);
            this.make(0, 0, 23, 3, "Deploy Sakata Spider", [0, 15], "Fast and heavily armored assault unit with self-healing capabilities. Cannot attack air targets.");
            this.option.buildUnits = new Array([8]);
            this.make(0, 30, 10, 3, "Deploy Hover Tank", [0, 16], "Specially armored tank, equipped with deadly anti-Chronite ground weapons.");
            this.option.buildUnits = new Array([10]);
            this.make(30, 50, 25, 15, "Deploy Black Queen", [0, 17], "Heavily armored air superiority fighter. Can drop bombs on ground targets every 12 seconds.");
            this.option.buildUnits = new Array([11]);
            this.make(7, 12, 0, 1.6, "Deploy Sniper", [0, 11], "Light infantry unit, armed with a long range anti-Chronite sniper rifle.");
            this.option.buildUnits = new Array([12]);
            this.make(0, 0, 0, 5, "Resuscitate", [0, 20], "Gain 3 additional manpower over 5 seconds.");
            this.option.buildResource[1] = 3;
            this.make(0, 0, 0, 4.8, "Stock Exchange", [0, 19], "Gain 3 additional money over 5 seconds.");
            this.option.buildResource[0] = 3;
            this.make(0, 0, 0, 4.8, "Generate Power", [0, 21], "Gain 3 additional energy over 5 seconds.");
            this.option.buildResource[2] = 3;
            this.make(0, 0, 0, 3, "Gold Trading", [0, 19], "Gain 4 additional money over 3 seconds.");
            this.option.buildResource[0] = 4;
            this.make(0, 0, 0, 3, "Absorb Power", [0, 21], "Gain 4 additional energy over 3 seconds.");
            this.option.buildResource[2] = 4;
            this.make(0, 0, 0, 10, "Plan Reinforcements", [0, 20], "Gain 9 additional manpower over 10 seconds.");
            this.option.buildResource[1] = 9;
            this.make(0, 0, 0, 10, "Plan Financial Support", [0, 19], "Gain 9 additional money over 10 seconds.");
            this.option.buildResource[0] = 9;
            this.make(0, 0, 0, 10, "Plan Reserve Energy", [0, 21], "Gain 9 additional energy over 10 seconds.");
            this.option.buildResource[2] = 9;
            this.make(80, 0, 50, 10, "Upgrade Structure", [1, 0], "Uprade this building into an Arsenal (Tier 3). Requires an Armory to upgrade.");
            this.option.buildOrder = 11;
            this.option.buildReq = 6;
            this.make(70, 0, 20, 10, "Upgrade Structure", [1, 0], "Upgrade this building into a Mechanics Terminal (Tier 3). Requires an Armory to upgrade.");
            this.option.buildOrder = 12;
            this.option.buildReq = 6;
            this.make(0, 0, 0, 5, "Salvage", [0, 21], "Gain 2 energy over 5 seconds.");
            this.option.buildResource[2] = 2;
            this.make(0, 0, 0, 30, "Create Clones", [0, 20], "Gain 20 manpower over 30 seconds.");
            this.option.buildResource[1] = 20;
            this.make(60, 0, 15, 1, "Launch Missile", [0, 22], "Launches a deadly missile at enemies closest to the base.");
            this.option.buildMissile = 1;
            this.make(5, 15, 0, 5, "Deploy Gröditz", [0, 12], "Requires Armory to deploy. Heavy bi-pedal 'Walker' unit with rapid firing weapons, effective against both ground and air targets.");
            this.option.buildUnits = new Array([6]);
            this.option.buildReq = 6;
            this.make(0, 0, 21, 5, "Deploy Sakata Mk-II", [0, 14], "Requires Armory to deploy. Standard Sakata body, fitted with strong anti-air cannons, but unable to attack ground targets.");
            this.option.buildUnits = new Array([9]);
            this.option.buildReq = 6;
            this.make(15, 0, 60, 1, "Launch Missile", [0, 23], "Launches a deadly missile at enemies closest to the base.");
            this.option.buildMissile = 1;
            this.make(75, 20, 0, 1, "Convert to Avionics", [1, 0], "Convert this building into an Avionics Terminal.");
            this.option.buildOrder = 15;
            this.make(3, 0, 6, 2.5, "Deploy Scout", [0, 8], "Fast flying drone with light armor. Fitted with formidable chronite-piercing weapons.");
            this.option.buildUnits = new Array([3]);
            this.make(30, 10, 30, 12, "Deploy Gladiator", [0, 18], "Specially developed branch of the Roman androids, with stronger parts, and air-attack capabilities.");
            this.option.buildUnits = new Array([13]);
            this.make(0, 0, 0, 3, "Recruit", [0, 20], "Gain 1 manpower over 3 seconds.");
            this.option.buildResource[1] = 1;
            this.make(0, 0, 0, 1, "Scramble Rescue Team", [0, 25], "Instantly deploy 3 Meditecs.", 20);
            this.option.buildUnits = new Array(5, 5, 5);
            this.make(0, 0, 0, 1, "Deploy Modified Sakata", [0, 26], "Deploy a specialized Sakata unit.", 50);
            this.option.buildUnits = new Array([14]);
            this.make(0, 0, 0, 1, "Deploy Modified Phantom", [0, 27], "Deploy a specialized Phantom unit.", 35);
            this.option.buildUnits = new Array([15]);
            this.make(0, 0, 0, 1, "Deploy Special Forces", [0, 28], "Deploy a team of highly trained infantry.", 35);
            this.option.buildUnits = new Array(16, 16, 16, 16, 5, 5, 12, 12);
            this.make(0, 0, 0, 1, "Deploy Far Sniper", [0, 29], "Deploy a specialized Sniper that can attack ground units at a very long range with exceptional power.", 50);
            this.option.buildUnits = new Array([17]);
            this.make(0, 0, 0, 5, "Black Operations", [0, 30], "Gain 2 influence over 5 seconds.");
            this.option.buildResource[3] = 2;
            this.make(0, 0, 0, 2, "Deploy Saint", [0, 32], "Deploy a flying drone built with Hover Tank technology.", 50);
            this.option.buildUnits = new Array([18]);
            this.make(0, 0, 0, 2, "Deploy A27-Pride", [0, 31], "Deploy an Android unit with long range suppressing fire.", 40);
            this.option.buildUnits = new Array([19]);
            this.make(0, 0, 0, 1, "Upgrade Marines", [0, 36], "Upgrade Marines.", 2);
            this.option.buildTech = 0;
            this.make(65, 0, 0, 15, "Upgrade to War Sanctum", [1, 0], "Upgrade this building into a War Sanctum (Tier 3).");
            this.option.buildOrder = 15;
            this.make(0, 0, 0, 3, "Recover", [0, 20], "Gain 4 additional manpower over 3 seconds.");
            this.option.buildResource[1] = 4;
            this.make(0, 1, 0, 3, "Special Medic", [0, 0], "", 1);
            this.make(0, 0, 0, 12, "Deploy Sphinx", [0, 34], "Deploy a hybrid tank that resists heavy attacks. Equipped with anti-armor weapons.", 80);
            this.option.buildUnits = new Array([20]);
            this.make(0, 3, 6, 6, "Deploy Angel", [0, 38], "Light air unit that repairs friendly air units.");
            this.option.buildUnits = new Array([21]);
            this.make(0, 0, 0, 1, "Deploy Modified Gröditz", [0, 37], "Deploy a specialized Gröditz unit.", 35);
            this.option.buildUnits = new Array([22]);
            this.make(0, 0, 0, 1, "Scramble Angel Team", [0, 36], "Instantly deploy 3 Angels.", 30);
            this.option.buildUnits = new Array(21, 21, 21);
        }

        private function make(a:uint, b:uint, c:uint, d:Number, e:String, f:Array, g:String, h:uint=0):void
        {
            this.iN++;
            LIST[this.iN] = new Array();
            LIST2[this.iN] = new Array();
            LIST[this.iN].push(a, b, c, d, h);
            LIST2[this.iN].push((a * this.mul), (b * this.mul), (c * this.mul), (d * this.mul), (h * this.mul));
            LIST[this.iN].orders = new Array();
            this.option = LIST[this.iN];
            this.option.id = this.iN;
            this.option.iconGraphic = new Array();
            this.option.iconGraphic[0] = f[0];
            this.option.iconGraphic[1] = f[1];
            this.option.nameLabel = e;
            this.option.buildOrder = null;
            this.option.buildResource = new Array(0, 0, 0, 0);
            this.option.buildStock = null;
            this.option.buildTech = null;
            this.option.buildUnits = null;
            this.option.buildMissile = null;
            this.option.buildReq = null;
            this.option.stockReq = null;
            this.option.techReq = null;
            this.option.tip = new tipObject(e, a, b, c, g, h);
        }

        public function checkData():Boolean
        {
            var i:*;
            var j:*;
            var boss:Number;
            for (i in LIST)
            {
                for (j in LIST[i])
                {
                    boss = (Math.round(((LIST2[i][j] / this.mul) * 1000)) / 1000);
                    if (((!(LIST2[i][j] == null)) && (!(LIST[i][j] == boss))))
                    {
                        // trace(((((((("OPTION: (" + i) + " ") + j) + ") // ") + LIST[i][j]) + " -- ") + boss));
                        return (true);
                    };
                };
            };
            return (false);
        }


    }
}//package 

