# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"

# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 287 "myLib.h"
typedef void (*ihp)(void);
# 307 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 3 "main.c" 2
# 1 "game.h" 1


typedef struct {
    int col;
    int row;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int color;
    int dashRdel;
    int dashCdel;
    int dashing;
    int dashTimer;
    int dashCooldown;
    int bulletTimer;

    int dead;
    int deathTimer;


} ANISPRITE;


typedef struct {
 int row;
 int col;
 int rdel;
 int height;
 int width;
 int active;
 int cdel;
    int color;

} BULLET;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int hide;
    int curColor;
    int bRdel;
    int bCdel;
    int phase;

    int phase2Pattern;
    int phase3Pattern;

    int bulletTimer;
    int colorTimer;
    int waveCount;
    int shotsFired;
    int bDir;
    int waveTimer;

    int alternatePortals;

} BOSSSPRITE;

typedef struct {
 int row;
 int col;
 int rdel;
 int height;
 int width;
 int active;
 int cdel;
    int color;
    int VH;
} BOSSBULLET;



typedef struct {
 int row;
 int col;
 int rdel;
 int height;
 int width;
 int active;
 int cdel;
    int color;
    int fireTimer;
    int firing;
    int vert;
} BOSSBEAM;


typedef struct {
    int row;
    int col;
    int width;
    int height;
    int active;
    int portalColor;
    int colorB;
    int vert;
} PORTAL;

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int active;
    int moveSpeed;
    int T;


} MINE;
# 134 "game.h"
extern ANISPRITE player;
extern BOSSSPRITE boss;
extern BULLET bullets[5];
extern BOSSBULLET bossBullets[30];
extern BOSSBEAM waves[3];
extern BOSSBEAM rays[6];
extern MINE mine;

extern PORTAL portals[4];

extern int lives;
extern int bossHealth;

extern int count;



void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer(int);
void initBullets();
void fireBullet(int);
void updateBullets(BULLET *);
void drawBullets(BULLET *, int);

void initBoss();
void drawBoss(int);
void updateBoss();

void initBossBullets();
void updateBossBullets(BOSSBULLET*);
void drawBossBullets(BOSSBULLET*, int);
void fireBossBullet();

void initWaves();
void updateWaves(BOSSBEAM *);
void drawWaves(BOSSBEAM *, int);
void fireWave();

void initRays();
void chargeRayV(int,int,int);
void chargeRayH(int,int,int);
void updateRays(BOSSBEAM*);
void drawRays(BOSSBEAM *,int);
void fireRays(BOSSBEAM *);
void stopRays(BOSSBEAM *);

void initPortals();
void spawnPortals();
void drawPortals(PORTAL *, int);
void spawnPortalsLeft();
void spawnPortalsRight(int);
void hideRightPortals();
void firePortals();
void stopPortals();

void initMine();
void spawnMine();
void updateMine();
void drawMine(int);
void deSpawnMine();






void phase1();
void phase2();
void phase3();
void phase4();
# 4 "main.c" 2
# 1 "startScreen.h" 1
# 22 "startScreen.h"
extern const unsigned short startScreenTiles[16384];


extern const unsigned short startScreenMap[1024];


extern const unsigned short startScreenPal[256];
# 5 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[2064];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 6 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[1120];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 7 "main.c" 2
# 1 "YouWin.h" 1
# 22 "YouWin.h"
extern const unsigned short YouWinTiles[960];


extern const unsigned short YouWinMap[1024];


extern const unsigned short YouWinPal[256];
# 8 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[704];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 9 "main.c" 2
# 1 "bg2.h" 1
# 22 "bg2.h"
extern const unsigned short bg2Tiles[1616];


extern const unsigned short bg2Map[2048];


extern const unsigned short bg2Pal[256];
# 10 "main.c" 2
# 1 "startscreen2.h" 1
# 22 "startscreen2.h"
extern const unsigned short startScreen2Tiles[16384];


extern const unsigned short startScreen2Map[1024];


extern const unsigned short startScreen2Pal[256];
# 11 "main.c" 2
# 1 "pause2.h" 1
# 22 "pause2.h"
extern const unsigned short pause2Tiles[16384];


extern const unsigned short pause2Map[1024];


extern const unsigned short pause2Pal[256];
# 12 "main.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 13 "main.c" 2
# 1 "gameSong.h" 1


extern const unsigned int gameSong_sampleRate;
extern const unsigned int gameSong_length;
extern const signed char gameSong_data[];
# 14 "main.c" 2
# 1 "gameOver.h" 1


extern const unsigned int gameOver_sampleRate;
extern const unsigned int gameOver_length;
extern const signed char gameOver_data[];
# 15 "main.c" 2
# 1 "loseSound.h" 1


extern const unsigned int loseSound_sampleRate;
extern const unsigned int loseSound_length;
extern const signed char loseSound_data[];
# 16 "main.c" 2
# 1 "menu.h" 1


extern const unsigned int menu_sampleRate;
extern const unsigned int menu_length;
extern const signed char menu_data[];
# 17 "main.c" 2
# 1 "instruction.h" 1
# 22 "instruction.h"
extern const unsigned short instructionTiles[16384];


extern const unsigned short instructionMap[1024];


extern const unsigned short instructionPal[256];
# 18 "main.c" 2
# 98 "main.c"
void initialize();


void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void instruction();
void goToInstruction();


unsigned short screen = 30;
int lives;
int bossHealth;

ANISPRITE player;



enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE,
    INSTRUCTION
};
int state;


unsigned short buttons;
unsigned short oldButtons;


OBJ_ATTR shadowOAM[128];


unsigned short vOff;

int instr = 0;

int main()
{
    initialize();

    while (1)
    {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        case INSTRUCTION:
            instruction();
            break;
        }
    }
}
void initialize()
{
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = (2<<14) | ((0)<<2) | ((28)<<8);
    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    (*(volatile unsigned short*)0x400000A) = (0<<14) | ((1)<<2) | ((26)<<8);




    vOff = 0;

    setupSounds();
 setupInterrupts();

    stopSound();
 playSoundA(menu_data, menu_length, 1);
    goToStart();
}
void goToStart() {





    DMANow(3, startScreen2Pal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, startScreen2Tiles, &((charblock *)0x6000000)[0], 32768 / 2);
    DMANow(3, startScreen2Map, &((screenblock *)0x6000000)[28], 2048 / 2);



    state = START;

}
void start() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))) && !(instr)) {
        initGame();
        stopSound();
  playSoundA(gameSong_data, gameSong_length, 1);
        goToGame();

    }
    else if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && !(instr)) {
        instr = 1;
        DMANow(3, startScreenPal, ((unsigned short *)0x5000000), 512/2);
        DMANow(3, startScreenTiles, &((charblock *)0x6000000)[0], 32768 / 2);
        DMANow(3, startScreenMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    }
    else if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7)))) && (instr)) {
        instr = 0;
        DMANow(3, startScreen2Pal, ((unsigned short *)0x5000000), 512/2);
        DMANow(3, startScreen2Tiles, &((charblock *)0x6000000)[0], 32768 / 2);
        DMANow(3, startScreen2Map, &((screenblock *)0x6000000)[28], 2048 / 2);
    }
    else if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))) && (instr)) {
        goToInstruction();
    }
}
void goToGame() {





    DMANow(3, bg2Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, bg2Tiles, &((charblock *)0x6000000)[0], 3232 / 2);
    DMANow(3, bg2Map, &((screenblock *)0x6000000)[28], 4096 / 2);

    state = GAME;
}
void game() {
    updateGame();
    vOff--;
    waitForVBlank();
    drawGame();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        vOff = 30;
        pauseSound();
        goToPause();
    }
    if (player.deathTimer >= 61) {
        vOff = 50;
        stopSound();
        playSoundA(loseSound_data, loseSound_length, 1);
        playSoundB(gameOver_data, gameOver_length, 0);
        goToLose();
    }

    if (bossHealth <= 0) {
        vOff = 30;
        stopSound();
        goToWin();
    }
    (*(volatile unsigned short *)0x04000012) = vOff;

}
void goToPause() {
    (*(volatile unsigned short *)0x04000012) = 30;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);
    state = PAUSE;





    DMANow(3, pause2Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, pause2Tiles, &((charblock *)0x6000000)[0], 32768 / 2);
    DMANow(3, pause2Map, &((screenblock *)0x6000000)[28], 2048 / 2);
}
void pause() {

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        unpauseSound();
        goToGame();
    }

}
void goToWin() {

    vOff = 30;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);
    state = WIN;
    DMANow(3, YouWinPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, YouWinTiles, &((charblock *)0x6000000)[0], 1920 / 2);
    DMANow(3, YouWinMap, &((screenblock *)0x6000000)[28], 2048 / 2);


}
void win() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        (*(volatile unsigned short *)0x04000012) = 0;
        stopSound();
     playSoundA(menu_data, menu_length, 1);
        goToStart();
    }
}
void goToLose() {
    (*(volatile unsigned short *)0x04000012) = screen + 20;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);
    state = LOSE;
    DMANow(3, losePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 4128 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

}
void lose() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        (*(volatile unsigned short *)0x04000012) = 0;
        stopSound();
     playSoundA(menu_data, menu_length, 1);
        goToStart();
    }
}

void goToInstruction() {
    DMANow(3, instructionPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, instructionTiles, &((charblock *)0x6000000)[0], 32768 / 2);
    DMANow(3, instructionMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    state = INSTRUCTION;

}
void instruction() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}
