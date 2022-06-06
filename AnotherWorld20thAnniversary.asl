// Game:           Another World 20th anniversary edition
// Original by:    Vel'Cheran
// Updated:        2022-06-02
// IGT timing:     NO
//

state("anowor")
{
	int levelNumber			: 0x023300, 0x28;
}

startup
{
	settings.Add("split_settings", true, "Split settings");
        settings.Add("split5", false, "Level 5 (city 1)", "split_settings");
        settings.Add("split8", false, "Level 8 (pipe)", "split_settings");
        settings.Add("split9", false, "Level 9 (recharge)", "split_settings");
        settings.Add("split10", false, "Level 10 (cave)", "split_settings");
        settings.Add("split17", false, "Level 17 (city 2)", "split_settings");
        settings.Add("split28", false, "Level 28 (palace)", "split_settings");
        settings.Add("split33", false, "Level 33 (arena)", "split_settings");
        settings.Add("split34", false, "Level 34 (baths)", "split_settings");
}

start
{
	bool doStart = current.levelNumber > old.levelNumber && old.levelNumber == 1;
	return doStart;
}

reset
{
	bool doReset = (current.levelNumber != old.levelNumber && current.levelNumber == 1)
					|| current.levelNumber == null;
	return doReset;
}

split
{
	bool doSplit = current.levelNumber > old.levelNumber 
		&& ((current.levelNumber == 5 && settings["split5"])
			|| (current.levelNumber == 8 && settings["split8"])
			|| (current.levelNumber == 9 && settings["split9"])
			|| (current.levelNumber == 10 && settings["split10"])
			|| (current.levelNumber == 17 && settings["split17"])
			|| (current.levelNumber == 28 && settings["split28"])
			|| (current.levelNumber == 33 && settings["split33"])
			|| (current.levelNumber == 34 && settings["split34"])
			|| current.levelNumber == 35);
	return doSplit;
}
