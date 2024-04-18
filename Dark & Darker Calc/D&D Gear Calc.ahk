#SingleInstance

total := 0, Geartotal := 0, UtilityTotal := 0

GuiActive := true

TwoHand := {junk: 15, Poor: 22, Common: 30, Uncommon: 45, Rare: 60, Epic: 90, Legendary: 120, Unique: 175}
Primary := {junk: 9, Poor: 13, Common: 18, Uncommon: 27, Rare: 36, Epic: 54, Legendary: 72, Unique: 125}
Secondary := {junk: 7, Poor: 10, Common: 14, Uncommon: 21, Rare: 28, Epic: 42, Legendary: 56, Unique: 100}

Head := {junk: 4, Poor: 6, Common: 8, Uncommon: 12, Rare: 16, Epic: 24, Legendary: 32, Unique: 40}
Hands := {junk: 4, Poor: 6, Common: 8, Uncommon: 12, Rare: 16, Epic: 24, Demon_Grip: 24, Legendary: 32, Unique: 40}
Feet := {junk: 4, Poor: 6, Common: 8, Uncommon: 12, Rare: 16, Epic: 24, Legendary: 32, Unique: 40}

Chest := {junk: 5, Poor: 7, Common: 10, Uncommon: 15, Rare: 20, Epic: 30, Legendary: 40, Tri_Pelt: 40, Unique: 50}
Legs := {Junk: 5, Poor: 7, Common: 10, Uncommon: 15, Rare: 20, Epic: 30, Legendary: 40, Wolf_Hunter: 40, Demonclad: 40, Unique: 50}
Back := {junk: 5, Poor: 7, Common: 10, Uncommon: 15, Rare: 20, Epic: 30, Legendary: 40, Unique: 50}

Necklace := {Uncommon: 9, Rare: 12, Epic: 18, Legendary: 24, Unique: 30}
Rings := {Uncommon: 9, Rare: 12, Epic: 18, Legendary: 24, Unique: 30}

Utility := {junk: 2, Poor: 3, Common: 4, Uncommon: 6, Rare: 8, Epic: 12, Legendary: 16, Unique: 20}

AllRarityType := "|junk|Poor|Common|Uncommon|Rare|Epic|Legendary|Unique"
Above_Green := "|Uncommon|Rare|Epic|Legendary|Unique"
Back_Slot := "|Rare|Epic|Legendary|Unique"
Exceptions := {Hands: ["Demon_Grip"], Chest: ["Tri_Pelt"], Legs: ["Wolf_Hunter", "Demonclad"]}

Greeting := "
(

Welcome, everyone! 🌟 Thank you for using my script, I'm thrilled to see it in action! Your support means the world. 🚀

Remember to Check out StonedOutlaw on Kick and Twitch. 📺
🃏 Dont forget to follow for even more fun and shenanigans. 

🎮 See you in the Dungeons! ⚔️

) "

;--------------------------------------------------------------------------- Launch Settings

DownloadPicture("Dark And Darker.jpg", "https://i.postimg.cc/HLTDXL0J/Dark-And-Darker.jpg")

Menu, Tray, NoStandard 
Menu, Tray, Add, Main Menu, GUI_Toggle
Menu, Tray, Add, Reload Script, Reload
Menu, Tray, Add, Exit Script, ExitScript

SetTimer, ShowSplash, -100

Hotkey, F1, GUI_Toggle, Toggle

GoSub, GUI_Toggle

;--------------------------------------------------------------------------- GUI

GUI_Toggle:
if (GuiActive = 0) {
    GoSub MainGui
	Menu, Tray, check, Main Menu
} Else {
	GoSub GuiClose
	Menu, Tray, Uncheck, Main Menu
}
Return

MainGui:
if (!GuiActive) {
Gui, +Owner -MinimizeBox +0x400000
Gui, Add, Picture, x0 y0 w585 h680 , Dark And Darker.jpg
Gui, Margin, 0, 0
Gui, Color, Black
Gui, Font, s14, Impact

Gui, Add, GroupBox, xM+10 yM+0 Section w120 H640 c0x6666FF, Equipment
Gui, Add, Text, xs+10 ys+35 c0x49780B, TwoHand:
Gui, Add, Text, xs+10 ys+80 c0x49780B, TwoHand 2:
Gui, Add, Text, xs+10 ys+120 c0x92AE6D, Primary:
Gui, Add, Text, xs+10 ys+160 c0x92AE6D, Primary 2:
Gui, Add, Text, xs+10 ys+200 c0xACD4B0, Secondary:
Gui, Add, Text, xs+10 ys+240 c0xACD4B0, Secondary 2:
Gui, Add, Text, xs+10 ys+280 cYellow, Head:
Gui, Add, Text, xs+10 ys+320 cYellow, Hands:
Gui, Add, Text, xs+10 ys+360 cYellow, Feet:
Gui, Add, Text, xs+10 ys+400 c0xFFE194, Chest:
Gui, Add, Text, xs+10 ys+440 c0xFFE194, Legs:
Gui, Add, Text, xs+10 ys+480 c0xFFE194, Back:
Gui, Add, Text, xs+10 ys+520 cPurple, Necklace:
Gui, Add, Text, xs+10 ys+560 cPurple, Ring 1:
Gui, Add, Text, xs+10 ys+600 cPurple, Ring 2:

Gui, Add, GroupBox, xM+135 yM+0 Section w145 H640 c0x6666FF, Rarity
Gui, Add, ComboBox, xs+10 ys+35 w125 gConvert vTwoHand_Rarity, %AllRarityType%
Gui, Add, ComboBox, xs+10 ys+75 w125 gConvert vTwoHand2_Rarity, %AllRarityType%
Gui, Add, ComboBox, xs+10 ys+115 w125 gConvert vPrimary_Rarity, %AllRarityType%
Gui, Add, ComboBox, xs+10 ys+155 w125 gConvert vPrimary2_Rarity, %AllRarityType%
Gui, Add, ComboBox, xs+10 ys+195 w125 gConvert vSecondary_Rarity, %AllRarityType%
Gui, Add, ComboBox, xs+10 ys+235 w125 gConvert vSecondary2_Rarity, %AllRarityType%
Gui, Add, ComboBox, xs+10 ys+275 w125 gConvert vHead_Rarity, %AllRarityType%
Gui, Add, ComboBox, xs+10 ys+315 w125 gConvert vHands_Rarity, % AllRarityType "|" Exceptions.Hands[1]
Gui, Add, ComboBox, xs+10 ys+355 w125 gConvert vFeet_Rarity, %AllRarityType%

Gui, Add, ComboBox, xs+10 ys+395 w125 gConvert vChest_Rarity, % AllRarityType "|" Exceptions.Chest[1]
Gui, Add, ComboBox, xs+10 ys+435 w125 gConvert vLegs_Rarity, % AllRarityType "|" Exceptions.Legs[1] "|" Exceptions.Legs[2]
Gui, Add, ComboBox, xs+10 ys+475 w125 gConvert vBack_Rarity, %Back_Slot%
Gui, Add, ComboBox, xs+10 ys+515 w125 gConvert vNecklace_Rarity, %Above_Green%
Gui, Add, ComboBox, xs+10 ys+555 w125 gConvert vRings_Rarity, %Above_Green%
Gui, Add, ComboBox, xs+10 ys+595 w125 gConvert vRings2_Rarity, %Above_Green%

Gui, Add, GroupBox, xM+285 yM+0 Section w135 H550 c0x6666FF, Utility
; Control set 1
Gui, Add, Text, xs+10 ys+30 c0xD1B01D, Rarity:
Gui, Add, ComboBox, xs+10 ys+60 w115 gConvert vUtility0, %AllRarityType%
Gui, Add, Text, xs+10 ys+100 c0xF47C04, Count:
Gui, Add, Edit, xs+70 ys+98 w45 gConvert vUtility0_Count, %Utility0_Count%
; Control set 2
Gui, Add, Text, xs+10 ys+160 c0xD1B01D, Rarity:
Gui, Add, ComboBox, xs+10 ys+190 w115 gConvert vUtility1, %AllRarityType%
Gui, Add, Text, xs+10 ys+230 c0xF47C04, Count:
Gui, Add, Edit, xs+70 ys+228 w45 gConvert vUtility1_Count, %Utility1_Count%
; Control set 3
Gui, Add, Text, xs+10 ys+300 c0xD1B01D, Rarity:
Gui, Add, ComboBox, xs+10 ys+330 w115 gConvert vUtility2, %AllRarityType%
Gui, Add, Text, xs+10 ys+370 c0xF47C04, Count:
Gui, Add, Edit, xs+70 ys+368 w45 gConvert vUtility2_Count, %Utility2_Count%
; Control set 4
Gui, Add, Text, xs+10 ys+430 c0xD1B01D, Rarity:
Gui, Add, ComboBox, xs+10 ys+460 w115 gConvert vUtility3, %AllRarityType%
Gui, Add, Text, xs+10 ys+500 c0xF47C04, Count:
Gui, Add, Edit, xs+70 ys+498 w45 gConvert vUtility3_Count, %Utility3_Count%

Gui, Add, Button, xs+40 ys+575 gWiki, Wiki

Gui, Add, GroupBox, xM+425 yM+0 Section w150 H640 c0x6666FF, Gear Score
Gui, Font, c0xD1B01D s12, Impact
Gui, Add, Text, xs+10 ys+30, TwoHand 1:
Gui, Add, Text, xs+100 ys+30 w45 vTwoHand1, %TwoHand1%
Gui, Add, Text, xs+10 ys+55, TwoHand 2:
Gui, Add, Text, xs+100 ys+55 w45 vTwoHand2, %TwoHand2%
Gui, Add, Text, xs+10 ys+80, Primary 1:
Gui, Add, Text, xs+100 ys+80 w45 vPrimary1, %Primary1%
Gui, Add, Text, xs+10 ys+105, Primary 2:
Gui, Add, Text, xs+100 ys+105 w45 vPrimary2, %Primary2%
Gui, Add, Text, xs+10 ys+130, Secondary 1:
Gui, Add, Text, xs+100 ys+130 w45 vSecondary1, %Secondary1%
Gui, Add, Text, xs+10 ys+155, Secondary 2:
Gui, Add, Text, xs+100 ys+155 w45 vSecondary2, %Secondary2%
Gui, Add, Text, xs+10 ys+180, Head:
Gui, Add, Text, xs+100 ys+180 w45 vHeadR, %HeadR%
Gui, Add, Text, xs+10 ys+205, Hands:
Gui, Add, Text, xs+100 ys+205 w45 vHandsR, %HandsR%
Gui, Add, Text, xs+10 ys+230, Feet:
Gui, Add, Text, xs+100 ys+230 w45 vFeetR, %FeetR%
Gui, Add, Text, xs+10 ys+255, Chest:
Gui, Add, Text, xs+100 ys+255 w45 vChestR, %ChestR%
Gui, Add, Text, xs+10 ys+280, Legs:
Gui, Add, Text, xs+100 ys+280 w45 vLegsR, %LegsR%
Gui, Add, Text, xs+10 ys+305, Back:
Gui, Add, Text, xs+100 ys+305 w45 vBackR, %BackR%
Gui, Add, Text, xs+10 ys+330, Necklace:
Gui, Add, Text, xs+100 ys+330 w45 vNecklaceR, %NecklaceR%
Gui, Add, Text, xs+10 ys+355, Ring 1:
Gui, Add, Text, xs+100 ys+355 w45 vRings1, %Rings1%
Gui, Add, Text, xs+10 ys+380, Ring 2:
Gui, Add, Text, xs+100 ys+380 w45 vRings2, %Rings2%
Gui, Add, Text, xs+10 ys+405, ---------------------------
Gui, Add, Text, xs+10 ys+430, Utility 1:
Gui, Add, Text, xs+100 ys+430 w45 vUtilityR0, %UtilityR0%
Gui, Add, Text, xs+10 ys+455, Utility 2:
Gui, Add, Text, xs+100 ys+455 w45 vUtilityR1, %UtilityR1%
Gui, Add, Text, xs+10 ys+480, Utility 3:
Gui, Add, Text, xs+100 ys+480 w45 vUtilityR2, %UtilityR2%
Gui, Add, Text, xs+10 ys+505, Utility 4:
Gui, Add, Text, xs+100 ys+505 w45 vUtilityR3, %UtilityR3%
Gui, Add, Text, xs+10 ys+530, ---------------------------
Gui, Add, Text, xs+10 ys+555, Utility Sum:
Gui, Add, Text, xs+100 ys+555 vUtilityTotal, %UtilityTotal%
Gui, Add, Text, xs+10 ys+580, Gear Sum:
Gui, Add, Text, xs+100 ys+580 w45 vGeartotal, %Geartotal%
Gui, Add, Text, xs+10 ys+605, Total:
Gui, Add, Text, xs+100 ys+605 w45 vTotal, %total%

Gui, Add, Button, x142.5 y645 w300 gStreams, Give Support, Check Out My Live Streams!

Gui, Show,w585 h680, Gear Score Calculator By StonedOutlaw =3
GuiActive := true
} Else {
Return
} 
Return

;--------------------------------------------------------------------------- Stream Ad

ShowSplash:
Sleep 100
SplashTextOn, 400, 200, Gear Score Calculator By StonedOutlaw =3, %Greeting%
Sleep 10000 
SplashTextOff 
SetTimer, ShowSplash, OFF
Return

;--------------------------------------------------------------------------- Math

Convert:
Gui, Submit, NoHide
if (GuiActive) {

	if (A_GuiControl = "TwoHand_Rarity" || "TwoHand2_Rarity" ) {
		TwoHand1 := TwoHand[TwoHand_Rarity]
		TwoHand2 := TwoHand[TwoHand2_Rarity]
		TwoHandR := Add(TwoHand1,TwoHand2)
		GuiControl,, TwoHand1, %TwoHand1%
		GuiControl,, TwoHand2, %TwoHand2%
	} If Else (A_GuiControl = "Primary_Rarity" || "Primary2_Rarity" ) {
		Primary1 := Primary[Primary_Rarity]
		Primary2 := Primary[Primary2_Rarity]
		PrimaryR := Add(Primary1,Primary2)
		GuiControl,, Primary1, %Primary1%
		GuiControl,, Primary2, %Primary2%
	} If Else (A_GuiControl = "Secondary_Rarity" || "Secondary2_Rarity" ) {
		Secondary1 := Secondary[Secondary_Rarity]
		Secondary2 := Secondary[Secondary2_Rarity]
		SecondaryR := Add(Secondary1,Secondary2)
		GuiControl,, Secondary1, %Secondary1%
		GuiControl,, Secondary2, %Secondary2%
	} If Else (A_GuiControl = "Necklace_Rarity" || "Rings_Rarity" || "Rings2_Rarity" ){
		NecklaceR := Necklace[Necklace_Rarity]
		Rings1 := Rings[Rings_Rarity]
		Rings2 := Rings[Rings2_Rarity]
		RingsR := Add(Rings1,Rings2)
		GuiControl,, NecklaceR, %NecklaceR%
		GuiControl,, Rings1, %Rings1%
		GuiControl,, Rings2, %Rings2%
	} If Else (A_GuiControl = "Head_Rarity" || "Hands_Rarity" || "Feet_Rarity" ){
		HeadR := Head[Head_Rarity]
		HandsR := Hands[Hands_Rarity]
		FeetR := Feet[Feet_Rarity]
		GuiControl,, HeadR, %HeadR%
		GuiControl,, HandsR, %HandsR%
		GuiControl,, FeetR, %FeetR%
	} If Else (A_GuiControl = "Chest_Rarity" || "Legs_Rarity" || "Back_Rarity" ){
		ChestR := Chest[Chest_Rarity]
		LegsR := Legs[Legs_Rarity]
		BackR := Back[Back_Rarity]
		GuiControl,, ChestR, %ChestR%
		GuiControl,, LegsR, %LegsR%
		GuiControl,, BackR, %BackR%
	} If Else (A_GuiControl =  "Utility0_Count" ||  "Utility1_Count" || "Utility2_Count" || "Utility3_Count" ){
		UtilityR0 := (Utility[Utility0] * Utility0_Count),UtilityR1 := (Utility[Utility1] * Utility1_Count),UtilityR2 := (Utility[Utility2] * Utility2_Count),UtilityR3 := (Utility[Utility3] * Utility3_Count),UtilityTotal := Add(UtilityR0,UtilityR1,UtilityR2,UtilityR3)
		GuiControl,, UtilityR0, %UtilityR0%
		GuiControl,, UtilityR1, %UtilityR1%
		GuiControl,, UtilityR2, %UtilityR2%
		GuiControl,, UtilityR3, %UtilityR3%
		GuiControl,, UtilityTotal, %UtilityTotal%
	}

Geartotal := Add(TwoHandR, PrimaryR, SecondaryR, HeadR, HandsR, FeetR, ChestR, LegsR, BackR, NecklaceR, RingsR)
GuiControl,, Geartotal, %Geartotal%

total := Add(Geartotal,UtilityTotal)
GuiControl,, Total, %total%
}
return

;--------------------------------------------------------------------------- SubRoutes

Wiki:
Run, https://darkanddarker.wiki.spellsandguns.com/Gear_Score#B
return

Streams:
Run, https://www.twitch.tv/stonedoutlaw
Run, https://kick.com/stonedoutlaw
return

GuiEscape:
GuiClose:
if (GuiActive) {
    Gui, Destroy
	GuiActive := False
}
return

Reload:
Reload
Return

ExitScript:
ExitApp
Return

;--------------------------------------------------------------------------- Functions

DownloadPicture(Image_Name, URL) {
    if (FileExist(Image_Name)) {
		Return
    } else {
		URLDownloadToFile, %URL%, %Image_Name%
		if (!FileExist(Image_Name)) {
			MsgBox, 48, ERROR!, Failed to save %Image_Name%. Error code: %ErrorLevel%, 5
		}
	}
}

Add(vars*) {
    for each, var in vars
        total += %var%
    return total
}