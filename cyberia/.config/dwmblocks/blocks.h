//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" ", "~/.local/bin/statusbar/sb-volume", 2, 5},

	{"", "~/.local/bin/statusbar/sb-battery", 2, 5},

	{"", "~/.local/bin/statusbar/sb-ram", 2, 5},
	
	{"", "~/.local/bin/statusbar/sb-cpu", 2, 5},

	{"", "date '+%b %d (%a) %I:%M%p '",	5, 0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
