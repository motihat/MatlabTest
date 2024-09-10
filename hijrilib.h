// HijriLib.h - Contains declarations of Hijri Calendar functions
#ifndef hijrilib_h
#define hijrilib_h
#include "libhelp.h"

/* Function declarations */

// Get Gregrian Date Given a Hijri Date
EXPORTED_FUNCTION short GetGregorianDate(short hdd, short hmm, short hyy, short *gdd, short *gmm, short *gyy, short *wkday);

// Get Hijri Date Given a Gregorian Date
EXPORTED_FUNCTION short GetHijriDate(short gdd, short gmm, short gyy, short *hdd, short *hmm, short *hyy, short *wkday);

EXPORTED_FUNCTION short IsLeapyr(short yy);

EXPORTED_FUNCTION short IsQabisah(short yy);

#endif