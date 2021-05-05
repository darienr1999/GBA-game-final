
//{{BLOCK(startScreen2)

//======================================================================
//
//	startScreen2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2020-12-01, 18:48:55
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCREEN2_H
#define GRIT_STARTSCREEN2_H

#define startScreen2TilesLen 32768
extern const unsigned short startScreen2Tiles[16384];

#define startScreen2MapLen 2048
extern const unsigned short startScreen2Map[1024];

#define startScreen2PalLen 512
extern const unsigned short startScreen2Pal[256];

#endif // GRIT_STARTSCREEN2_H

//}}BLOCK(startScreen2)
