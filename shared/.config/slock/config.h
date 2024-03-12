/* user and group to drop privileges to */
static const char *user  = "gene";
static const char *group = "wheel";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#282828",     /* after initialization */
	[INPUT] =  "#665c54",   /* during input */
	[FAILED] = "#928374",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
