# Colony - All Changes Since V6.1

Developer Notes and Commentary on all changes are available at the very bottom of the changelog.

**Last Updated: September 17th, 2025.**

# GAMEPLAY CHANGES
- Multiplayer functionality has been restored completely! Fully working as intended along with a completely custom server.

- Rework of the Colony Ranking System, implementing 35 new ranks and icons, new XP distribution, removed consecutive win bonus and more!
- A large set of AI Improvements for every AI commander.
- 2 new AI commanders, Cpt. Bjorn and Cpt. Haley which play Special Operations and Dual respectably.
- Camera movement overall speed has been greatly increased, allowing you to move around the map quicker.
- Six new gamemodes (3-Square, 8-Square Joker, Vast, Insurgency and Classic) have been added into multiplayer.
- Added the ability to see how many units you currently have selected when selecting a group of units.
- Added new 'Random' option to MP, giving you a random government each time.
- Added a new Options menu to adjust scaling settings, volume of music & sound effects
- Fixed 'right side advantage' where units had their target point (the spot where you shoot) not 
set correctly and ending up further away than the left side, creating a slight disadvantage to left side players.
- Added the new "Multipurpose Structure" building. This structure combines two functionalities: the Precinct, a prison housing ground units, and the Aerodrome, which accommodates various air units. It can stand on its own or compliment both Post or Forge.
- Customize your player colors! In online and quick play, you can now choose the color for yourself and other players! This affects unit colors, base colors and more.
- Quick Play customization! Customize who you play against, their colors or if you just want to watch four AIs go at it!
- Introduced new hotkeys:
  - Press Tab with a selected unit to toggle between different unit types you control on the field.
  - Press V with a selected unit to limit selection to that specific unit type until V is pressed again. This feature helps with precise unit selection and micro-management, especially when units are stacked in front or behind others.
  - Scrolling with your scroll wheel over a unit you own will select all of your units; an alternative to double clicking.
  - Press 'F' or 'G' to instantly go to the very left or the very right sides of the map.


# UNIT CHANGES:

Detailed Information on the new units is available on the Colony Wiki: https://colonywiki.github.io/

- **New 'Multipurpose Structure' building** (Precinct & Aerodrome)<br/><br/>Cost: 40 Money, 30 Manpower, 30 Energy
- - -
- **New 'Mirage' unit** (Available from the Aerodrome)
- **New 'Shrike' unit** (Available from the Aerodrome)
- **New 'Eidolon' unit** (Available from the Aerodrome, requires Armory)
- - -
- **New 'A26-Legionnaire' unit** (Available from the Precinct)
- **New 'Missile Marine' unit** (Available from the Precinct)
- **New 'Jötunn' unit** (Available from the Precinct, requires Armory)
- - -
- **New 'Angel' unit** (Available from the War Sanctum)<br/><br/>Reload Time: 16 <br/>Range: 120 <br/>Healing: 5 <br/>Cost: 3 Manpower, 6 Energy
- - -
- **New 'Mod. Groditz' unit** (Available from the Armory)<br/><br/>HP: 350 -> 500 <br/>Damage: 15 -> 19 <br/>Reload Time: 5 -> 3 <br/>Cost: 35 Influence
- - -
- **Far Sniper Overhaul**<br/><br/>Reload Time: 90 -> 340 <br/>Projectile Speed: 30 -> 42 <br/>Range: 660 -> 618 <br/>Damage: 90 -> 350 <br/>Cost: 35 -> 40 Influence
- - -
- **Groditz Buffed** (340 -> 350 HP, no longer requires Armory to construct)
- **Phantom Buffed** (Reduced the cost of Phantoms to $18, 10 Manpower and 3 Energy instead of $23, 5 Manpower, and 3 Energy)
- **Pride Buffed** (6 -> 7 Damage)
- **Gladiator Buffed** (15 -> 12 seconds construction time)
- **New 'Scramble Angel Team' construction option** (Available from the War Sanctum, costs 30 Influence)
- **S-Marine** has received new sprites

# OTHER CHANGES:
- Users with an _ in their name, alongside guests, can now talk.

- A new button has been added on the homepage to bring you to the new Colony Wiki
- Lowered the volume of the Armor Games intro sound effects
- All visual effects (explosions, shot hit FX, meditec healing sprites) no longer block you from selecting a unit when attempting to left click on it
- 50% Optimization improvement to mouseEvents when playing using Flash Player
- You can now pick the rank icon you want others to see by hovering over it and scrolling. (You can only choose from icons you've unlocked. Rank up to unlock more!)
- AI now no longer sends Meditecs, AA Sakatas, Chronite Tanks, Scouts or Marines into base range
- New Monarchy theme has been added (Composed by me)
- New commands /help & /mystats & /wiki have been added to multiplayer lobby	
- Clicking 'No' on 'Are you sure you want to quit' popup no longer stops hotkeys from working without having to click back into the game
- Minor alterations to the Groditz death animation
- Fixed a bug where changing animation states of a unit while it is dying interrupts the death animation
- Fixed Mission 1 saying Capitalist provides 20% resource bonus instead of 15%
- Buffed Communist by fixing AoE not counting toward player kills, preventing them from getting a Communist payout
- You can now ask your AI partner what government they are
- Fixed a bug that made the order of which units appear in front or behind each other not work as intended
- Fixed projectiles potentially overshooting a target slightly due to lag and/or frame skipping
- Fixed a chat bug that caused the game to crash
- Fixed a bug where air units sometimes could attack the base with the wrong weapon type by swapping between 'advancing' and 'charging'
- Fixed maximizing window visual bug that made the base disappear on the right side.
- Fixed scrolling the game to the right with the mouse not working when playing maximized
- Fixed toolTip not scaling properly when you play maximized
- Fixed button text not scaling properly when you play maximized
- Fixed dropdown text not scaling properly when you play maximized
- Fixed unit animation getting stuck in the 'Shooting' animation
- Optimized 'selectAll' function, reducing lag when selecting a very large group of units
- Optimized 'endDraw' function, reducing lag when selecting a very large group of units by dragging a box around them
- Units will properly stop their movement animation when hitting a wall.
- 'Gladiator' shooting graphical error has been fixed.
- 'Null' errors and users being disconnected from a game have been fixed.
- Using hotkeys to construct a unit or building without canceling the existing queue will properly refund you. 
- Negative funds are no longer possible.
- Camera momentum is now set to 0 when hitting the edge of the map, preventing you from becoming 'stuck' to the wall.
- Manually enabling the 'Auto-Build' option will no longer randomly disable itself.
- Pressing 'TAB' should no longer cause you to select randomly select UI elements during a match, interrupting your gameplay experience and causing desyncs.
- Pressing 'Cancel' when attempting to login with an Armor Games account will no longer connect you as 'null'.
- Added a new 'Discord' button to the main menu to invite you to the official colony community server.
- Hotkeys for all UI elements have been added to their descriptions to better assist new or returning players.
- Fixed Ally/Enemy Progress Bar "Starting Maxed" in Multiplayer
- Fixed A27-Pride walking animation
- Fixed A28-Gladiator walking animation
- Fixed Far Sniper walking animation
- Fixed Sniper walking animation
 Fixed issue where pressing Tab or Alt-Tabbing caused hotkeys to stop working.
- You will no longer be disconnected for being AFK in the multiplayer server for 15 minutes.
- All other major bugs that can impact your playing enjoyment have been fixed.
- All grammatical mistakes have been fixed.
- Custom projectiles introduced for some new units.
- Custom sounds introduced for some new units.

# Developer Notes:

**Multiplayer Functionality** - I've been a fan of colony for a very long time. I was incredibly saddened when the servers first went down, and not being able to play made me really sad. I first joined the Official Colony Community Discord to see if anyone else had been able to get it working again... and to my surprise, no one did! So.. I decided as of March 18th, 2018 to get the multiplayer working again!

**Improved Camera & New Hotkeys** - I've always enjoyed the hotkeys added in during the reign of Krin, but after his leave, I did feel more hotkeys could be used to help with traversal of the map during a match. So by adding the new hotkeys and improving the camera control and speed, I feel that playing is now a lot more fun and fluid than it used to be.

**New Gamemodes** - Per community request, I introduced three new gamemodes to ignite new life in the multiplayer. With these changes, it has opened up possibilities that could only ever be dreamed of and simply weren't possible before.

**Bugfixing** - **SO** many bugs were littered around that were definitely impacting the playing experience of every player. Whether it was double spending by accident, going into negative resources, swapping to a new building or unit with hotkeys and losing your resources or being 'nulled' which basically ruined a match.. it was all so frustrating! I'm so happy I was able to fix every major issue that was plaguing the game and impacting the experience of new or returning players.

**'Angel' Unit** - The new Angel unit was implemented to expand options for aiding air units. I thought it would be neat to introduce a new air option that could in some way aid other air units, and therefore, the "Angel" was made!

**'Mod Groditz' Unit** - The new Groditz unit was implemented to provide a sensible cousin to the 'Mod. Phantom' that can be constructed from the Armory. I felt the Groditz needed some love, and this felt like it fit right in as if it truly belonged!
- - -
**'Far Sniper' Overhaul** - I always had a love for the far sniper, but it felt like it didn't really have a grand purpose. It had uses due to its long range, but most strategies I saw seemed superior to the far sniper. So I imagined a powerful, elite sniper that used a futuristic powerful anti-materiel rifle made to disrupt and eliminate enemy vehicles. I noticed that in a lot of end-games, we would get to a sort of stalemate where both sides had Sphinxs soaking up missiles, with the army behind it along with a large group of medics.<br/><br/>Outside of pure brute force by a larger army or missile spam, I thought there had to be a unit for the job but was weak to mostly everything else... and ta-da! The new and improved Far Sniper is born, built to destroy and break through even the toughest defenses of the late game. I understand if the unit may feel a bit weak at first due to its incredibly long reload time, however, I promise that it has turned the tides of battle before!
- - -
**Various Unit Buffs** - The Groditz, Pride and Gladiator all received numerous buffs to aid in their effectiveness in the current meta. Per community suggestions, we as the community came together to make these changes. The groditz felt as if it was decent, but needed a little more support, receiving a health buff to allow it to fight longer. The Pride felt a bit underwhelming in comparison to the Spec Ops Team, so it received a 1dmg increase per shot to assist it in remaining a strong and suitable option early to mid game.<br/><br/>Lastly, I spent a lot of time learning about the Gladiator unit and what it can do. And I decided although decent, the fact it took 15 seconds to construct felt too long. It has been reduced enough to where it is more viable for all players, not just players playing the fascist government!
- - -
**Anything else** - It's been an incredible 5 years of the server being up and numerous years of updates to this classic and beloved Flash game. And although the ride has sometimes been a bit bumpy (my fault), I'm so thankful for you all believing in me and the project. Although I don't plan to introduce any new large updates to the game, I feel where we are now is where we always wanted the game to be. I'll make sure the game will always remain running, so if one day you feel like playing... it's here for you. :)

# Credits

Thank you to the entire Colony Community and the Official Colony Discord server for this incredible journey. You're all so amazing! Come join us in the Discord server if you haven't already: https://discord.com/invite/rP8nhm8

**SynthKitten (aka DonutCat) - Me!**

**chessmaster102 (Couldn't have done it without you, buddy.)**

**Xelor (Your custom made server has been nothing but awesome, thanks for showing up one day and helping out, you're cool.)**

**Alpha (For creating this amazing community, seriously, if you didn't do this.. none of this would be here today.)**

**Dynamite Ty (For creating the Eidolon, A-26-Legionnaire, Shrike, Mirage, Multipurpose Structure, Missile Marine, Jötunn, Mod. Groditz, S-Marine sprites and helping import the new Angel sprite. Additionally a lot of assistance with the Colony Wiki! Thank you for your hard work!)**

**The Brickccentric (For providing the art for the Angel sprite, the new art is wonderful, thank you!)**

**Krin (For creating Colony and a lot of childhoods.)**

**Special Thanks To: Clausse10,  trying,  clhkph,  bravedoggo,  hezdog,  DACMiester,  Dastert,  eaglesx,  phantomlurker,  Scraiza,  HTC152,  Zelumpy and so many more for all of your support!**
