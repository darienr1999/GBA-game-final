
//{{BLOCK(bg2)

//======================================================================
//
//	bg2, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 101 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 3232 + 4096 = 7840
//
//	Time-stamp: 2020-11-24, 16:01:34
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG2_H
#define GRIT_BG2_H

#define bg2TilesLen 3232
extern const unsigned short bg2Tiles[1616];

#define bg2MapLen 4096
extern const unsigned short bg2Map[2048];

#define bg2PalLen 512
extern const unsigned short bg2Pal[256];

#endif // GRIT_BG2_H

//}}BLOCK(bg2)
