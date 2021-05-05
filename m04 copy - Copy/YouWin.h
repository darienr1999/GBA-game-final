
//{{BLOCK(YouWin)

//======================================================================
//
//	YouWin, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 60 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1920 + 2048 = 4480
//
//	Time-stamp: 2020-10-25, 17:15:32
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_YOUWIN_H
#define GRIT_YOUWIN_H

#define YouWinTilesLen 1920
extern const unsigned short YouWinTiles[960];

#define YouWinMapLen 2048
extern const unsigned short YouWinMap[1024];

#define YouWinPalLen 512
extern const unsigned short YouWinPal[256];

#endif // GRIT_YOUWIN_H

//}}BLOCK(YouWin)
