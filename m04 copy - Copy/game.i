# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
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
# 2 "game.h" 2

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
# 2 "game.c" 2

# 1 "finalGameSpriteSheet.h" 1
# 21 "finalGameSpriteSheet.h"
extern const unsigned short finalGameSpriteSheetTiles[16384];


extern const unsigned short finalGameSpriteSheetPal[256];
# 4 "game.c" 2


ANISPRITE player;
BULLET bullets[5];

BOSSSPRITE boss;
BOSSBULLET bossBullets[30];
BOSSBEAM waves[3];
BOSSBEAM rays[6];
PORTAL portals[4];
MINE mine;




int count = 1;
int lives;
int bossHealth;




int comboCounter = 0;


void initGame() {
    initPlayer();
    initBoss();
    hideSprites();

    lives = 1;
    bossHealth = 380;

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);
}

void updateGame() {
    updatePlayer();
    updateBoss();


}

void drawGame() {
    drawPlayer(count);
    drawBoss(count);
    count = 1;
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);
}



void initPlayer() {
    DMANow(3, finalGameSpriteSheetPal, ((unsigned short *)0x5000200), 512 /2);
 DMANow(3, finalGameSpriteSheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;
    player.col = 240/2 - (player.width/2);
 player.row = 160/2;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.color = 0;
    player.dashCdel = 3;
    player.dashRdel = 3;
    player.dashing = 0;
    player.dashCooldown = 0;
    player.bulletTimer = 0;
    player.dashTimer = 0;
    player.dead = 0;
    player.deathTimer = 0;
    initBullets();


}

void updatePlayer() {
    if (player.dashing) {
        if (player.row + player.width < 160 && player.row > 0) {
            player.row += player.dashRdel;
        }
        if (player.col + player.width < 240 && player.col - 5 > 0) {
        player.col += player.dashCdel;
        }

        if (player.dashTimer > 10) {
            player.dashing = 0;
            player.dashTimer = 0;
            player.dashCooldown = 0;
        }
        player.dashTimer++;

    } else {
        player.dashCdel = 0;
        player.dashRdel = 0;
     if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {

           player.dashRdel = -3;
           player.dashCdel = player.dashCdel;
            if (player.row -1 >= 0) {
                player.row -= player.rdel;
            } else {
                player.row = player.row;
            }

  }
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {

    player.dashRdel = 3;
             player.dashCdel = player.dashCdel;
             if (player.row + player.height + player.rdel <= 160) {
                player.row += player.rdel;
            } else {
                player.row = player.row;
            }


  }
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {

   player.dashCdel = -3;
            player.dashRdel = player.dashRdel;
            if ((player.col - player.rdel <= 0)) {
                player.col = player.col;
            } else {
                player.col -= player.rdel;
            }


  }
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
   player.dashRdel = player.dashRdel;
   player.dashCdel = 3;
            if (player.col + player.rdel >= 225) {
                player.col = player.col;
            } else {
                player.col += player.rdel;
            }


  }
        if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
            if (player.color == 1) {
                player.color = 0;
            } else if (player.color == 0) {
                player.color = 1;
            }
        }
        if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) && player.dashCooldown > 60) {
            player.dashing = 1;
        }
        if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
            lives += 5;
        }

        if (player.bulletTimer > 15) {
            fireBullet(player.color);
            player.bulletTimer = 0;
        }
        player.bulletTimer++;
        if (player.dashCooldown <= 61) {
            player.dashCooldown++;
        }

    }

    for (int i = 0; i < 5; i++) {
        updateBullets(&bullets[i]);
    }

    if (lives <= 0) {
        if (player.deathTimer <= 60) {
            player.deathTimer++;
        }
        player.dead = 1;
    }

}

void drawPlayer(int a) {
    if (!(player.dead)) {
    if (!(player.dashing)) {
        if (player.color == 1) {
        shadowOAM[0].attr0 = (player.row) | (0<<13) | (0<<14);
        shadowOAM[0].attr1 = (player.col) | (1<<14);
        shadowOAM[0].attr2 = ((2)*32+(0))
           | ((0)<<12);
        } else if (player.color == 0) {
        shadowOAM[0].attr0 = (player.row) | (0<<13) | (0<<14);
        shadowOAM[0].attr1 = (player.col) | (1<<14);
        shadowOAM[0].attr2 = ((0)*32+(0))
           | ((0)<<12);
        }
    } else {
        shadowOAM[0].attr0 = (player.row) | (0<<13) | (0<<14);
        shadowOAM[0].attr1 = (player.col) | (1<<14);
        shadowOAM[0].attr2 = ((0)*32+(2))
           | ((0)<<12);
    }


    } else {
        shadowOAM[0].attr0 = (2<<8);
        a++;
    }
    for (int i = 0; i < 5; i++) {
        drawBullets(&bullets[i], a);
        a++;
    }
    count = a;


}

void initBullets() {

 for (int i = 0; i < 5; i++) {

  bullets[i].height = 8;
  bullets[i].width = 8;
  bullets[i].row = 0;
  bullets[i].col = 0;
  bullets[i].rdel = -2;
  bullets[i].active = 0;
        bullets[i].color = 0;
 }
}
void fireBullet(int playerColor) {
    for(int i = 0; i < 5; i++) {
        if (!(bullets[i].active)) {
            bullets[i].row = player.row;
            bullets[i].col = player.col + player.width/2 - bullets[i].width/2;
            bullets[i].color = playerColor;
            bullets[i].active = 1;
            break;
        }
    }
}
void updateBullets(BULLET* b) {

    if (b->active) {

        if (collision(b->col, b->row, b->width, b->height, boss.col, boss.row, boss.width, boss.height)) {
            bossHealth--;
            b->active = 0;

        }

        if (b->row + b->height-1 > 0) {
            b->row += b->rdel;
        } else {
            b->active = 0;
        }

    }

}
void drawBullets(BULLET* b, int a) {

 if(b->active) {
 if (b->color) {
        shadowOAM[a].attr0 = (b->row) | (0<<13) | (0<<14);
        shadowOAM[a].attr1 = (b->col) | (0<<14);
        shadowOAM[a].attr2 = ((7)*32+(0))
           | ((0)<<12);
    } else {
        shadowOAM[a].attr0 = (b->row) | (0<<13) | (0<<14);
        shadowOAM[a].attr1 = (b->col) | (0<<14);
        shadowOAM[a].attr2 = ((6)*32+(0))
           | ((0)<<12);
    }
 } else {
        shadowOAM[a].attr0 = (2<<8);
    }
}

void initBoss() {
    boss.col = 30;
    boss.row = 0;
    boss.width = 192;
    boss.height = 24;
    boss.aniCounter = 0;
    boss.aniState = 0;
    boss.curColor = 1;
    boss.bRdel = 1;
    boss.bCdel = 0;
    boss.phase = 1;
    boss.bulletTimer = 0;
    boss.colorTimer = 0;
    boss.shotsFired = 0;
    boss.bDir = 1;
    boss.waveTimer = 0;
    boss.waveCount = 0;

    boss.phase2Pattern = 1;
    boss.phase3Pattern = 1;







   initBossBullets();
   initWaves();
   initRays();
   initPortals();
   initMine();



}

void updateBoss() {
    if (boss.phase == 0) {
        boss.phase = 1;
    }
    else if (boss.phase == 1) {
        phase1();
    } else if (boss.phase == 2) {
        phase2();
    } else if (boss.phase == 3) {
        phase3();
    } else if (boss.phase == 4) {
        phase4();
    }

}
void drawBoss(int a) {
    for (int i = 0; i < 6; i++) {
        shadowOAM[(a)].attr0 = (boss.row) | (0<<13) | (1<<14);
        shadowOAM[(a)].attr1 = (boss.col + (32 * i)) | (1<<14);
        shadowOAM[(a)].attr2 = ((11)*32+((i * 4)))
            | ((0)<<12);
        a++;

    }

        int j = 0;
        for (int i = 6; i < 12; i++) {
        shadowOAM[(a)].attr0 = (boss.row + 8) | (0<<13) | (1<<14);
        shadowOAM[(a)].attr1 = (boss.col + (32 * j)) | (2<<14);
        shadowOAM[(a)].attr2 = ((12)*32+((j * 4)))
            | ((0)<<12);
        j++;
        a++;

    }

    count = a;


    for (int i = 0; i < 3; i++) {
        drawWaves(&waves[i],count);
    }
    for (int i = 0; i < 30; i++) {
        drawBossBullets(&bossBullets[i], count);
    }
    if (boss.phase == 3 || boss.phase == 4) {
        for (int i = 0; i < 4; i++) {
            drawPortals(&portals[i], count);
        }
    }
    if (boss.phase == 2 || boss.phase == 3 || boss.phase == 4) {
        for (int i = 0; i < 6; i++) {
            drawRays(&rays[i],count);
        }
    }
    drawMine(count);






}

void initBossBullets() {
    for (int i = 0; i < 30; i++) {
        bossBullets[i].height = 8;
  bossBullets[i].width = 8;
  bossBullets[i].row = 0;
  bossBullets[i].col = 0;
  bossBullets[i].rdel = 0;
  bossBullets[i].active = 0;
        bossBullets[i].color = 0;
    }
}
void drawBossBullets(BOSSBULLET * b, int a) {
    if(b->active) {
        if (b->color == 1) {
            shadowOAM[a].attr0 = (b->row) | (0<<13) | (0<<14);
            shadowOAM[a].attr1 = (b->col) | (0<<14);
            shadowOAM[a].attr2 = ((5)*32+(0))
               | ((0)<<12);
            a++;
        } else if (!(b->color)) {
            shadowOAM[a].attr0 = (b->row) | (0<<13) | (0<<14);
            shadowOAM[a].attr1 = (b->col) | (0<<14);
            shadowOAM[a].attr2 = ((4)*32+(0))
               | ((0)<<12);
            a++;
        } else if (b->color == 2) {
            shadowOAM[a].attr0 = (b->row) | (0<<13) | (0<<14);
            shadowOAM[a].attr1 = (b->col) | (0<<14);
            shadowOAM[a].attr2 = ((8)*32+(0))
               | ((0)<<12);
            a++;
        }
    } else {
            shadowOAM[a].attr0 =(2<<8);
            a++;
    }
    count = a;
}

void initWaves() {
    for (int i = 0; i < 3; i++) {

  waves[i].height = 16;
  waves[i].width = 240;
  waves[i].row = 3;
  waves[i].col = 0;
  waves[i].rdel = 2;
  waves[i].active = 0;

 }
}
void drawWaves(BOSSBEAM *b, int a) {
    if (b->active) {
        int j = 0;
        switch (b->color) {
            case 0:
                j = 2;
                break;
            case 1:
                j = 0;
                break;
            case 2:
                j = 4;
                break;
        }
        int x = 0;
        for (int i = 0; i < 7; i++) {
            shadowOAM[(a)].attr0 = (b->row) | (0<<13) | (1<<14);
            shadowOAM[(a)].attr1 = (b->col + (32 * i)) | (2<<14);
            shadowOAM[(a)].attr2 = ((j)*32+(6))
               | ((0)<<12);
            a++;
            x++;
        }
            shadowOAM[(a)].attr0 = (b->row) | (0<<13) | (0<<14);
            shadowOAM[(a)].attr1 = (b->col + (32 * x)) | (1<<14);
            shadowOAM[(a)].attr2 = ((j)*32+(4))
               | ((0)<<12);
            a++;

    } else {
        shadowOAM[a].attr0 =(2<<8);
        a += 8;
    }
    count = a;
}

void initRays() {
    for (int i = 0; i < 6; i++) {
  rays[i].height = 160;
  rays[i].width = 64;
  rays[i].row = 14;
  rays[i].col = 0;
  rays[i].rdel = 1;
  rays[i].active = 0;
        rays[i].firing = 0;
        rays[i].fireTimer = 0;
 }
}
void drawRays(BOSSBEAM * d, int a) {
    if (d->active) {

    if (d->vert) {

        if (!(d->firing)) {
            int j = 0;
            switch (d->color) {
                case 0:
                    j = 2;
                    break;
                case 1:
                    j = 0;
                    break;
                case 2:
                    j = 4;
                    break;
            }
            for (int i = 0; i < 2; i++) {
                shadowOAM[a].attr0 = (d->row) | (0<<13) | (1<<14);
                shadowOAM[a].attr1 = (d->col + (32 * i)) | (2<<14);
                shadowOAM[a].attr2 = ((j)*32+(4 + (i * 4)))
                   | ((0)<<12);
                a++;
            }


        } else if (d->firing) {
            int x = 0;
            int y = 0;
            switch (d->color) {
                case 0:
                    x = 20;
                    y = 0;
                    break;
                case 1:
                    x = 12;
                    y = 0;
                    break;
               case 2:
                    x = 24;
                    y = 8;
                   break;
            }
            for (int i = 0; i < 3; i++) {
                shadowOAM[a].attr0 = (d->row + (64 * i)) | (0<<13) | (0<<14);
                shadowOAM[a].attr1 = (d->col) | (3<<14);
                shadowOAM[a].attr2 = ((y)*32+(x))
                   | ((0)<<12);
                a++;
            }

        }

    } else {


        if (!(d->firing)) {
            int j = 0;
            switch (d->color) {
                case 0:
                    j = 2;
                    break;
                case 1:
                    j = 0;
                    break;
                case 2:
                    j = 4;
                    break;
            }
            for (int i = 0; i < 2; i++) {
                shadowOAM[a].attr0 = (d->row + (32 * i)) | (0<<13) | (2<<14);
                shadowOAM[a].attr1 = (d->col) | (2<<14);
                shadowOAM[a].attr2 = (((14 + (4 * i)))*32+(j))
                                | ((0)<<12);
                a++;
            }


        } else if (d->firing) {
            int x = 0;
            int y = 0;
            switch (d->color) {
                case 0:
                    x = 20;
                    y = 0;
                    break;
                case 1:
                    x = 12;
                    y = 0;
                    break;
               case 2:
                    x = 24;
                    y = 8;
                   break;
            }
            for (int i = 0; i < 4; i++) {
                shadowOAM[a].attr0 = (d->row) | (0<<13) | (0<<14);
                shadowOAM[a].attr1 = (d->col + (64 * i)) | (3<<14);
                shadowOAM[a].attr2 = ((y)*32+(x))
                   | ((0)<<12);
                a++;
            }

        }
    }
} else {
        for (int i = 0; i < 4; i++) {
            shadowOAM[a].attr0 = (2<<8);
            a++;
        }
    }
count = a;
}


void initPortals() {
    for (int i = 0; i < 4; i++) {
        portals[i].active = 0;
        portals[i].colorB = 0;
        portals[i].width = 0;
        portals[i].height = 0;
        portals[i].vert = 0;
        portals[i].portalColor = 0;

    }
}

void drawPortals(PORTAL* b, int a) {
    if (b->active) {
        if (b->vert) {
                int j = 0;
                switch (b->portalColor) {
                    case 0:
                        j = 6;
                        break;
                    case 1:
                        j = 14;
                        break;

                }
                for (int i = 0; i < 2; i++) {
                    shadowOAM[a].attr0 = (b->row) | (0<<13) | (1<<14);
                    shadowOAM[a].attr1 = (b->col + (32 * i)) | (2<<14);
                    shadowOAM[a].attr2 = ((14)*32+(j + (i * 4)))
                        | ((0)<<12);
                    a++;
                }
        } else {
            int j = 0;
                switch (b->portalColor) {
                    case 0:
                        j = 6;
                        break;
                    case 1:
                        j = 8;
                        break;
                }
                for (int i = 0; i < 2; i++) {
                    shadowOAM[a].attr0 = (b->row + (32 * i)) | (0<<13) | (2<<14);
                    shadowOAM[a].attr1 = (b->col) | (2<<14);
                    shadowOAM[a].attr2 = (((16 + (4 * i)))*32+(j))
                                    | ((0)<<12);
                    a++;
                }
        }
    } else {
        for (int i = 0; i < 2; i++) {
            shadowOAM[a].attr0 = (2<<8);
            a++;
        }
    }
    count = a;

}

void initMine() {
    mine.width = 32;
    mine.height = 32;
    mine.active = 0;
    mine.row = 240 /2;
    mine.col = 160/2;
    mine.moveSpeed = 1;
    mine.T = 0;
}

void drawMine(int a) {
    if (mine.active) {
        shadowOAM[a].attr0 = (mine.row) | (0<<13) | (0<<14);
        shadowOAM[a].attr1 = (mine.col) | (2<<14);
        shadowOAM[a].attr2 = ((24)*32+(0))
            | ((0)<<12);
        a++;
    }
    count = a;
}
