// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//aiStrategy

package 
{
    public class aiStrategy 
    {

        public var mindSetR:uint = 0;
        public var mindSetO:uint = 0;
        public var aiSet:Array = new Array();
        public var currentStrategy:uint = 0;
        public var mustTech:Boolean;
        public var techLevel:uint = 0;
        private var useTech:uint;
        public var techLevelOffense:uint = 0;
        public var roundCount:uint = 0;
        private var techCostPass:Boolean;
        public var randomNum:uint;
        public var grouping:Boolean = false;
        public var aiGroup:Array = new Array();
        private var lastPush:uint;
        private var pushGap:uint = 9;
        private var resOrder:uint;
        private var onPlayerTeam:Boolean;
        public var techingNow:Boolean = false;
        private var resOrder2:uint;
        public var forceTech:uint;
        private var varName:String;
        private var aiNames:Array = ["Traditional", "Gladiator", "TechnoRush", "Spider", "Nuker", "SniperRush", "Joker", "FirePower", "HeavyMetal"];
        private var aiNames2:Array = ["Gen. Glastondale", "Gen. Mortfang", "Cpt. Keeley", "Cpt. Beatrix", "Cpt. Bjorn", "Cpt. Jetzul", "Cpt. Haley", "FirePower", "HeavyMetal"];
        private var c_greet:Array = ["Good evening. General Glastondale reporting in for duty.", "This is General Mortfang reporting in.", "Hello! Captain Keeley at your service.", "Hello, this is Captain Beatrix.", "Cpt. Bjorn", "Alright, arm your battle stations! It's time to bring this enemy down.", "Captain Haley reporting in!", "FirePower", "HeavyMetal"];
        private var c_name:Array = ["I am Sir Miles Glastondale.", "The name's Lux Mortfang.", "Keeley Baker", "I'm Erika Beatrix.", "Cpt. Bjorn", "I am Shinkai Jetzul.", "Haley Cornwall", "FirePower", "HeavyMetal"];
        private var c_age:Array = ["62... or 63... I don't remember.", "43.", "26.", "34.", "Cpt. Bjorn", "32.", "24.", "FirePower", "HeavyMetal"];
        private var c_like:Array = ["Retirement... One day...", "Winning. What did you expect?", "Please Commander, focus on the battle!", "What kind of question is that? Are you a spy?", "Cpt. Bjorn", "Collecting people's ears, obviously...", "Is that really relevant now, Commander?", "FirePower", "HeavyMetal"];
        private var c_make:Array = ["I'm going for an Arsenal and a Hospital.", "I will try to tech towards Gladiators.", "Uh... I don't really know, I'm kind of new at this...", "Going for Sataka technology with meditec back-up.", "Cpt. Bjorn", "Opening with sniper rush. Then I'll tech to Arsenal.", "I'll try and have both an Arsenal and a MechTerm so we'll be ready for anything.", "FirePower", "HeavyMetal"];
        private var c_do:Array = ["It's a free world, Commander. But I wouldn't mind having you back me up Phantoms and Spiders.", "Support my forces with infantry and meditecs.", "I don't think I'm qualified to answer that.", "Tanks, marines, Snipers! It all depends on what they are doing.", "Cpt. Bjorn", "You'll need to take care of enemy air units. Sakata Mk-II, marines, and Black Queens are good for that.", "I need you to keep them away while I tech.", "FirePower", "HeavyMetal"];

        public function aiStrategy(a:Array, be:uint, p:playerKon):void
        {
            var okPass:Boolean;
            super();
            aiSet.push(new Array(1, 0));
            aiSet.push(new Array(2, 1));
            aiSet.push(new Array(3, 1));
            aiSet.push(new Array(4, 1));
            aiSet.push(new Array(0, 2));
            aiSet.push(new Array(1, 0));
            aiSet.push(new Array(5, 3));
            mustTech = false;
            techingNow = false;
            techLevel = 0;
            techLevelOffense = 0;
            aiGroup = new Array();
            grouping = false;
            if (be == 99)
            {
                okPass = false;
                while ((!(okPass)))
                {
                    randomNum = Math.floor((Math.random() * (aiSet.length - 0.1)));
                    if ((((!(randomNum == 4)) && (!(randomNum == 2))) && (!(randomNum == 6))))
                    {
                        okPass = true;
                    };
                };
            }
            else
            {
                randomNum = be;
            };
            p.playerName = aiNames2[randomNum];
            if (gameKon.playerNow.team == p.team)
            {
                chatBody.pCol = p.cityColor;
                onPlayerTeam = true;
                if (!gameKon.theRoot.missionOn)
                {
                    chatBody.pName = p.playerName;
                    chatBody.C_GREET = c_greet[randomNum];
                    chatBody.C_NAME = c_name[randomNum];
                    chatBody.C_AGE = c_age[randomNum];
                    chatBody.C_LIKE = c_like[randomNum];
                    chatBody.C_MAKE = c_make[randomNum];
                    chatBody.C_DO = c_do[randomNum];
                    if (!gameKon.theRoot.tutLev)
                    {
                        if (chatBody.chatOn)
                        {
                            chatBody.delaySay(chatBody.C_GREET, 5);
                        };
                    };
                };
            }
            else
            {
                onPlayerTeam = false;
            };
            currentStrategy = 0;
            mindSetR = aiSet[randomNum][0];
            mindSetO = aiSet[randomNum][1];
            roundCount = 0;
            lastPush = 0;
            techCostPass = false;
            varName = aiNames[randomNum];
            forceTech = aiTactic.techTreeArray[randomNum].length;
            switch (randomNum)
            {
                case 2:
                    a.push(new aiOrder(7, 100));
                    break;
                case 3:
                    break;
                case 5:
                    a.push(new aiOrder(2, 1));
                    a.push(new aiOrder(44, 100));
                    break;
                default:
                    a.push(new aiOrder(5, 100));
            };
        }

        public function work(u:Array, a:Array, p:playerKon):void
        {
            var numOn:uint;
            var takeNum:uint;
            var stillChoose:Boolean;
            var moveObject:Object;
            var goMove:uint;
            var anal:uint;
            var danger:uint;
            var takeAction:uint;
            var uj:*;
            roundCount++;
            techCostPass = false;
            mustTech = false;
            useTech = techLevel;
            if (((techLevel < forceTech) && (!(techingNow))))
            {
                if (checkTechCost(p, aiTactic.techTreeArray[randomNum][techLevel], aiTactic.techTimeArray[randomNum][techLevel]))
                {
                    if (techCostPass)
                    {
                        a.push(new aiOrder(aiTactic.techTreeArray[randomNum][techLevel], 1, true));
                        techingNow = true;
                        mustTech = false;
                    };
                };
            }
            else
            {
                if (techLevel == aiTactic.techTreeArray[randomNum].length)
                {
                    useTech = (techLevel - 1);
                };
            };
            if (mustTech)
            {
                anal = 12;
                if (onPlayerTeam)
                {
                    chatBody.sendEv("A_SAVE");
                };
            }
            else
            {
                numOn = 0;
                stillChoose = true;
                while (stillChoose)
                {
                    moveObject = analyzeEnemy(p)[numOn];
                    takeAction = moveObject.ID;
                    goMove = aiTactic.counterArray[takeAction][randomNum][useTech];
                    if (goMove > 0)
                    {
                        stillChoose = false;
                        takeNum = numOn;
                    }
                    else
                    {
                        if (numOn < 11)
                        {
                            numOn++;
                        }
                        else
                        {
                            stillChoose = false;
                            takeNum = numOn;
                        };
                    };
                };
                anal = analyzeEnemy(p)[takeNum].ID;
                danger = analyzeEnemy(p)[takeNum].DANGER;
                if (danger < 9)
                {
                    if (((p.r_m + p.r_p) + p.r_e) > (25 * techLevel))
                    {
                        if (onPlayerTeam)
                        {
                            chatBody.sendEv("A_RESUME");
                        };
                        anal = 0;
                    }
                    else
                    {
                        if (onPlayerTeam)
                        {
                            chatBody.sendEv("A_SAVE2");
                        };
                        anal = 12;
                    };
                };
            };
            if ((roundCount - lastPush) >= pushGap)
            {
                if (((onPlayerTeam) && (!(grouping))))
                {
                    chatBody.sendEv("A_GROUP");
                };
                grouping = true;
            };
            if (grouping)
            {
                if (analyzeGroup() > 12)
                {
                    if (onPlayerTeam)
                    {
                        chatBody.sendEv("A_ATTACK");
                    };
                    grouping = false;
                    lastPush = roundCount;
                    for (uj in aiGroup)
                    {
                        aiGroup[uj].aiPosition = false;
                        aiGroup[uj].makeOption(0);
                    };
                    aiGroup = new Array();
                };
            };
            if (anal != 12)
            {
                aiTactic.work(a, goMove);
            };
            if (((anal == 0) && (p.r_i >= 100)))
            {
                aiTactic.work(a, 60);
                aiTactic.work(a, 61);
                aiTactic.work(a, 62);
            };
            if (onPlayerTeam)
            {
                switch (anal)
                {
                    case 1:
                        chatBody.sendEv("A_C1");
                        break;
                    case 2:
                        chatBody.sendEv("A_C2");
                        break;
                    case 3:
                        chatBody.sendEv("A_C3");
                        break;
                    case 4:
                        chatBody.sendEv("A_C4");
                        break;
                    case 5:
                        chatBody.sendEv("A_C5");
                        break;
                    case 6:
                        chatBody.sendEv("A_C6");
                        break;
                    case 7:
                        chatBody.sendEv("A_C7");
                        break;
                    case 8:
                        chatBody.sendEv("A_C8");
                        break;
                    case 9:
                        chatBody.sendEv("A_C9");
                        break;
                    case 11:
                        chatBody.sendEv("A_C11");
                        break;
                };
            };
            resOrder = 0;
            resOrder2 = 0;
            switch (randomNum)
            {
                case 0:
                    getOrder(0, 58);
                    getOrder2(5, 56);
                    getOrder(5, 59);
                    break;
                case 1:
                    getOrder(0, 58);
                    getOrder2(3, 57);
                    break;
                case 2:
                    getOrder(0, 58);
                    getOrder2(6, 57);
                    break;
                case 3:
                    getOrder(0, 58);
                    getOrder2(6, 57);
                    getOrder(6, 59);
                    break;
                case 4:
                    getOrder(0, 58);
                    break;
                case 5:
                    getOrder(0, 58);
                    getOrder(5, 59);
                    getOrder2(4, 56);
                    break;
                case 6:
                    getOrder(0, 58);
                    getOrder2(5, 56);
                    break;
            };
            aiTactic.work(a, resOrder2);
            aiTactic.work(a, resOrder);
        }

        private function getOrder(t:uint, r:uint):*
        {
            if (techLevel >= t)
            {
                resOrder = r;
            };
        }

        private function getOrder2(t:uint, r:uint):*
        {
            if (techLevel >= t)
            {
                resOrder2 = r;
            };
        }

        private function checkTechCost(p:playerKon, b:uint, t:uint):*
        {
            var o:Object = optionData.LIST[b];
            if ((((p.r_m >= o[0]) && (p.r_p >= o[1])) && (p.r_e >= o[2])))
            {
                techCostPass = true;
                return (true);
            };
            if ((t * 2) <= roundCount)
            {
                mustTech = true;
                return (true);
            };
        }

        private function analyzeGroup(aType:Boolean=false):uint
        {
            var i:*;
            var potency:uint;
            for (i in aiGroup)
            {
                switch (aiGroup[i].ID)
                {
                    case 0:
                        potency = (potency + 0);
                        break;
                    case 1:
                        potency = (potency + 1);
                        break;
                    case 2:
                        potency = (potency + 3);
                        break;
                    case 3:
                        potency = (potency + 2);
                        break;
                    case 4:
                        potency = (potency + 1);
                        break;
                    case 5:
                        potency = (potency + 1);
                        break;
                    case 6:
                        potency = (potency + 3);
                        break;
                    case 7:
                        potency = (potency + 4);
                        break;
                    case 8:
                        potency = (potency + 4);
                        break;
                    case 9:
                        potency = (potency + 2);
                        break;
                    case 10:
                        potency = (potency + 4);
                        break;
                    case 11:
                        potency = (potency + 20);
                        break;
                    case 12:
                        potency = (potency + 3);
                        break;
                    case 13:
                        potency = (potency + 20);
                        break;
                };
            };
            return (potency);
        }

        private function analyzeEnemy(p:playerKon):*
        {
            var dangerArray:* = new Array();
            var i:* = 0;
            while (i < 12)
            {
                dangerArray.push({
                    "DANGER":0,
                    "ID":i
                });
                i++;
            };
            for (i in p.eteam.all)
            {
                switch (p.eteam.all[i].ID)
                {
                    case 0:
                        dangerArray[0].DANGER = (dangerArray[0].DANGER + 1);
                        break;
                    case 1:
                        dangerArray[1].DANGER = (dangerArray[1].DANGER + 1);
                        dangerArray[3].DANGER = (dangerArray[3].DANGER + 1);
                        break;
                    case 2:
                        dangerArray[2].DANGER = (dangerArray[2].DANGER + 10);
                        dangerArray[3].DANGER = (dangerArray[3].DANGER + 10);
                        dangerArray[11].DANGER = (dangerArray[11].DANGER + 8);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 3);
                        break;
                    case 3:
                        dangerArray[7].DANGER = (dangerArray[7].DANGER + 6);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 3);
                        break;
                    case 4:
                        dangerArray[1].DANGER = (dangerArray[1].DANGER + 2);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 1);
                        break;
                    case 5:
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 1);
                        break;
                    case 6:
                        dangerArray[5].DANGER = (dangerArray[5].DANGER + 11);
                        dangerArray[11].DANGER = (dangerArray[11].DANGER + 11);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 8);
                        break;
                    case 7:
                        dangerArray[7].DANGER = (dangerArray[7].DANGER + 16);
                        break;
                    case 8:
                        dangerArray[2].DANGER = (dangerArray[2].DANGER + 16);
                        dangerArray[3].DANGER = (dangerArray[3].DANGER + 16);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 16);
                        dangerArray[11].DANGER = (dangerArray[11].DANGER + 16);
                        break;
                    case 9:
                        dangerArray[6].DANGER = (dangerArray[6].DANGER + 16);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 8);
                        break;
                    case 10:
                        dangerArray[5].DANGER = (dangerArray[5].DANGER + 12);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 15);
                        break;
                    case 11:
                        dangerArray[8].DANGER = (dangerArray[8].DANGER + 50);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 20);
                        break;
                    case 12:
                        dangerArray[4].DANGER = (dangerArray[4].DANGER + 8);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 3);
                        break;
                    case 13:
                        dangerArray[9].DANGER = (dangerArray[9].DANGER + 50);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 8);
                        break;
                    case 14:
                        dangerArray[2].DANGER = (dangerArray[2].DANGER + 20);
                        dangerArray[3].DANGER = (dangerArray[3].DANGER + 20);
                        dangerArray[10].DANGER = (dangerArray[10].DANGER + 20);
                        dangerArray[11].DANGER = (dangerArray[11].DANGER + 20);
                        break;
                    case 15:
                        dangerArray[7].DANGER = (dangerArray[7].DANGER + 20);
                        break;
                    case 16:
                        dangerArray[1].DANGER = (dangerArray[1].DANGER + 6);
                        dangerArray[3].DANGER = (dangerArray[3].DANGER + 6);
                        break;
                    case 18:
                        dangerArray[7].DANGER = (dangerArray[7].DANGER + 20);
                        break;
                    case 20:
                        dangerArray[5].DANGER = (dangerArray[5].DANGER + 15);
                        break;
                };
            };
            for (i in p.team.all)
            {
                switch (p.team.all[i].ID)
                {
                    case 0:
                        break;
                    case 1:
                        dangerArray[6].DANGER--;
                        dangerArray[7].DANGER = (dangerArray[7].DANGER - 2);
                        break;
                    case 2:
                        dangerArray[1].DANGER = (dangerArray[1].DANGER - 6);
                        break;
                    case 3:
                        dangerArray[2].DANGER = (dangerArray[2].DANGER - 5);
                        dangerArray[7].DANGER = (dangerArray[7].DANGER - 6);
                        break;
                    case 4:
                        dangerArray[1].DANGER = (dangerArray[1].DANGER - 2);
                        dangerArray[5].DANGER--;
                        break;
                    case 5:
                        break;
                    case 6:
                        dangerArray[7].DANGER = (dangerArray[7].DANGER - 7);
                        dangerArray[4].DANGER = (dangerArray[4].DANGER - 4);
                        break;
                    case 7:
                        dangerArray[1].DANGER = (dangerArray[1].DANGER - 10);
                        dangerArray[4].DANGER = (dangerArray[4].DANGER - 20);
                        break;
                    case 8:
                        dangerArray[1].DANGER = (dangerArray[1].DANGER - 16);
                        break;
                    case 9:
                        dangerArray[7].DANGER = (dangerArray[7].DANGER - 16);
                        break;
                    case 10:
                        dangerArray[11].DANGER = (dangerArray[11].DANGER - 8);
                        break;
                    case 11:
                        break;
                    case 12:
                        break;
                    case 13:
                        break;
                };
            };
            dangerArray.sortOn(["DANGER", "ID"], (Array.DESCENDING | Array.NUMERIC));
            return (dangerArray);
        }


    }
}//package 

