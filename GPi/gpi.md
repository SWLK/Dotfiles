# GPi config

Majority of the issue stems from sleep button not behaving properly, and therefore shifting the screen after boot.

+ That is mitigatable might manually turning the screen off and on with the button

+ Though before I knew that was the cause, I've tried a couple of ways to change screen settings

## List of notes:

+ Not exactly sure if `disable_overscan` actually does anything

	+ It did work for one boot, and now that I think about it it might be due to the sleep button shifting the screen

+ overscan settings also suffer from the same problem, that is to say that they might work, but it was the sleep shifting that was messing with it

+ dpi settings (mode and group) are set to 2 and 87 respectively, I've change it to 2 and 4, but have reverted it

+ The setting that matters most seems to be the `hdmi_timings` variable, that has a substantial effect to the display settings
