
//{{BLOCK(background)

//======================================================================
//
//	background, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 44 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1408 + 2048 = 3968
//
//	Time-stamp: 2020-11-03, 18:05:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 1408
extern const unsigned short backgroundTiles[704];

#define backgroundMapLen 2048
extern const unsigned short backgroundMap[1024];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
