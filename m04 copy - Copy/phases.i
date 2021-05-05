# 1 "phases.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "phases.c"
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
# 2 "phases.c" 2

BOSSSPRITE boss;
ANISPRITE player;
MINE mine;
BOSSBULLET bossBullets[30];
BOSSBEAM waves[3];
BOSSBEAM rays[6];
PORTAL portals[4];

void phase1() {

    if (boss.bulletTimer > 15) {
        boss.shotsFired++;
        fireBossBullet();
        boss.bulletTimer = 0;
        if (boss.shotsFired >= 10) {
            if (boss.bCdel >= 1 || boss.bCdel <= -1) {
                boss.bDir *= -1;
            }
            boss.bCdel += boss.bDir;
            boss.shotsFired = 0;
        }
    }

    if (boss.colorTimer > 300) {
        if (boss.curColor) {
            boss.curColor = 0;
        } else {
            boss.curColor = 1;
        }
        boss.colorTimer = 0;
    }

    if (boss.waveTimer >200 && boss.waveCount <= 5) {
        if (boss.waveCount == 3 || boss.waveCount == 5) {
            int temp = boss.curColor;
            boss.curColor = 2;
            fireWave();
            boss.curColor = temp;
            if (boss.waveCount == 5) {
                boss.phase = 2;
                boss.waveTimer = 0;
                boss.bulletTimer = 0;
            }
        } else {
            fireWave();
        }
        boss.waveCount++;
        boss.waveTimer = 0;
    }
    boss.waveTimer++;
    boss.colorTimer++;
    boss.bulletTimer++;
    for (int i = 0; i <3; i++) {
        updateWaves(&waves[i]);
    }
    for (int i = 0; i < 30; i++) {
        updateBossBullets(&bossBullets[i]);
    }
}

void phase2() {
    for (int i = 0; i <3; i++) {
        updateWaves(&waves[i]);
    }
    for (int i = 0; i < 30; i++) {
        updateBossBullets(&bossBullets[i]);
    }

    if (boss.phase2Pattern == 1) {
        chargeRayV(0, 64, 128);

        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
            for (int i = 0; i < 6; i++) {
                fireRays(&rays[i]);
            }


        }
        else if (boss.waveTimer > 400) {

            for (int i = 0; i <6; i++) {

                stopRays(&rays[i]);


            }
            boss.phase2Pattern = 2;
            boss.waveTimer = 0;
        }
    }
    else if (boss.phase2Pattern == 2) {
        chargeRayV(176, 112, 48);

        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
            for (int i = 0; i < 6; i++) {
                fireRays(&rays[i]);
            }


        }
         else if (boss.waveTimer > 400) {

            for (int i = 0; i <6; i++) {
                stopRays(&rays[i]);
                boss.phase2Pattern = 3;
            }
            boss.waveTimer = 0;
        }
    }
    else if (boss.phase2Pattern == 3) {
            chargeRayV(24, 88, 152);
            chargeRayH(14, 78, 78);
        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
            for (int i = 0; i < 6; i++) {
                fireRays(&rays[i]);
            }


        }
        else if (boss.waveTimer > 400) {

            for (int i = 0; i <6; i++) {
                stopRays(&rays[i]);
                boss.phase2Pattern = 4;
            }
            boss.waveTimer = 0;
        }
    }
    else if (boss.phase2Pattern == 4) {
            chargeRayV(24, 109, 176);
            chargeRayH(14, 100, 100);
        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
            for (int i = 0; i < 6; i++) {
                fireRays(&rays[i]);
            }


        }
        else if (boss.waveTimer > 400) {

            for (int i = 0; i <6; i++) {
                stopRays(&rays[i]);
                boss.phase2Pattern = 5;
            }
            boss.waveTimer = 0;
        }
    }
    else if (boss.phase2Pattern == 5) {
            chargeRayV(14, 78, 142);
            chargeRayH(32, 96, 96);
        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
            for (int i = 0; i < 6; i++) {
                fireRays(&rays[i]);
            }


        }
        else if (boss.waveTimer > 400) {

            for (int i = 0; i <6; i++) {
                stopRays(&rays[i]);
                boss.phase = 3;
            }
            boss.waveTimer = 0;
        }
    }

    boss.waveTimer++;

    for (int i = 0; i < 6; i++) {
        updateRays(&rays[i]);
    }

}


void phase3() {
    if (boss.phase3Pattern == 1) {
        spawnPortals();
        chargeRayV(240/2 - 64, 240/2, 240/2);
        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
                for (int i = 0; i < 6; i++) {
                    fireRays(&rays[i]);
                }


            }
            else if (boss.waveTimer > 400) {
                for (int i = 0; i <6; i++) {
                    stopRays(&rays[i]);
                }
                for (int i = 0; i < 4; i++) {
                    stopPortals(&portals[i]);
                }
                boss.phase3Pattern = 2;
                boss.waveTimer = 0;
            }

    }
    else if (boss.phase3Pattern == 2) {
        if (boss.waveTimer > 50 && boss.waveTimer < 150) {
            spawnPortalsLeft();
        }
        if (boss.waveTimer > 150 && boss.waveTimer < 250) {
            spawnPortalsRight(0);
        }

        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
                    firePortals();

        }
            else if (boss.waveTimer > 400) {
                for (int i = 0; i <6; i++) {
                    stopRays(&rays[i]);
                }
                for (int i = 0; i < 4; i++) {
                    stopPortals(&portals[i]);
                }
                boss.phase3Pattern = 3;
                boss.waveTimer = 0;
            }
    }
        else if (boss.phase3Pattern == 3) {
        if (boss.waveTimer > 50 && boss.waveTimer < 150) {
            spawnPortalsLeft();
        }
        if (boss.waveTimer > 150 && boss.waveTimer < 250) {
            spawnPortalsRight(1);
        }

        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
                    firePortals();

        }
            else if (boss.waveTimer > 400) {
                for (int i = 0; i <6; i++) {
                    stopRays(&rays[i]);
                }
                for (int i = 0; i < 4; i++) {
                    stopPortals(&portals[i]);
                }
                boss.phase3Pattern = 4;
                boss.waveTimer = 0;
            }
    }
    else if (boss.phase3Pattern == 4) {
        if (boss.waveTimer > 50 && boss.waveTimer < 150) {
            spawnPortalsLeft();
        }
        if (boss.waveTimer > 150 && boss.waveTimer < 250) {
            spawnPortalsRight(0);
        }

        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
                    firePortals();

        }
            else if (boss.waveTimer > 400) {
                for (int i = 0; i <6; i++) {
                    stopRays(&rays[i]);
                }
                for (int i = 0; i < 4; i++) {
                    stopPortals(&portals[i]);
                }
                boss.phase3Pattern = 5;
                boss.waveTimer = 0;
            }
    }
    else if (boss.phase3Pattern == 5) {
        if (boss.waveTimer > 50 && boss.waveTimer < 150) {
            spawnPortalsLeft();
        }
        if (boss.waveTimer > 150 && boss.waveTimer < 250) {
            spawnPortalsRight(0);
        }

        if (boss.waveTimer > 250 && boss.waveTimer < 400) {
                    firePortals();

        }
        else if (boss.waveTimer > 400) {
                for (int i = 0; i <6; i++) {
                    stopRays(&rays[i]);
                }
                for (int i = 0; i < 4; i++) {
                    stopPortals(&portals[i]);
                }
                boss.phase = 4;

            }
    }

    boss.waveTimer++;
    for (int i = 0; i < 6; i++) {
        updateRays(&rays[i]);
    }

}

void phase4() {
    spawnMine();
    updateMine();

    if (boss.bulletTimer > 15) {
        boss.shotsFired++;
        fireBossBullet();
        boss.bulletTimer = 0;
    }
        if (boss.colorTimer > 200) {
        if (boss.curColor) {
            boss.curColor = 0;
        } else {
            boss.curColor = 1;
        }
        boss.colorTimer = 0;
    }

    if (boss.waveTimer >300) {
        fireWave();
        boss.waveTimer = 0;
    }

    boss.waveTimer++;
    boss.colorTimer++;
    boss.bulletTimer++;
    for (int i = 0; i <3; i++) {
        updateWaves(&waves[i]);
    }
    for (int i = 0; i < 30; i++) {
        updateBossBullets(&bossBullets[i]);
    }


}

void fireBossBullet() {
    if (boss.phase == 1) {
        for (int j = 0; j < 3; j++) {
            for (int i = 0; i <30; i++) {
                if(!(bossBullets[i].active)) {
                    bossBullets[i].row = 0;
                    bossBullets[i].col = 240/2;
                    bossBullets[i].rdel = boss.bRdel;
                    bossBullets[i].active = 1;
                    bossBullets[i].VH = 0;
                    if (boss.curColor) {
                        bossBullets[i].color = 1;
                    } else {
                        bossBullets[i].color = 0;
                    }

                    if (j == 0) {
                        bossBullets[i].cdel = boss.bCdel -1;
                    } else if (j == 1) {
                        bossBullets[i].cdel = boss.bCdel;
                    }else if (j == 2) {
                        bossBullets[i].cdel = boss.bCdel + 1;
                    }
                    break;
                }
            }
        }
    } else if (boss.phase == 4) {
        for (int j = 0; j < 2; j++) {
            for (int i = 0; i <30; i++) {
                if(!(bossBullets[i].active)) {
                    bossBullets[i].color = 2;
                    bossBullets[i].cdel = 0;
                    if (j == 0) {
                        bossBullets[i].row = 2;
                        bossBullets[i].col = 240/2;
                        bossBullets[i].rdel = boss.bRdel;
                        bossBullets[i].active = 1;
                        bossBullets[i].VH = 0;

                    } else if (j == 1) {
                        bossBullets[i].row = 160/2;
                        bossBullets[i].col = 2;
                        bossBullets[i].rdel = boss.bRdel;
                        bossBullets[i].active = 1;
                        bossBullets[i].VH = 1;

                    }
                    break;
                }
            }
        }
    }
}
void updateBossBullets(BOSSBULLET * b) {
    if (b->active) {
        if(collision(b->col, b->row, b->width, b->height, player.col, player.row, player.width, player.height)) {
            if (b->color == 2) {
                if (!player.dashing) {
                    lives--;
                }
            } else if (b->color != player.color || player.dashing) {
                lives--;
            }
        }
        if (!(b->VH)) {
            if ((b->row + b->height <= 180) && (b->col + b->width + 5 <= 240) && (b->col - 1 > 0)) {
                b->row += b->rdel;
                b->col += b->cdel;
            } else {
                b->active = 0;
            }
        } else if (b->VH) {
            if ((b->col + b->width <= 240)) {
                b->col += b->rdel;
            } else {
                b->active = 0;
                b->VH = 0;
            }
        }

    }
}

void updateWaves(BOSSBEAM * c) {
    if (c->active) {

        if(collision(c->col, c->row, c->width, c->height, player.col, player.row, player.width, player.height)) {
            if (c->color == 2) {
                if (!player.dashing) {
                    lives--;
                }
            } else if (c->color != player.color || player.dashing) {
                lives--;
            }
        }
        if (c->row <= 160) {
            c->row += c->rdel;
        } else {
            c->active = 0;
        }

    }


}
void fireWave() {
    for (int i = 0; i < 3; i++) {
        if (!(waves[i].active)) {
            waves[i].row = 0;
            waves[i].col = 0;
            waves[i].active = 1;
            if (boss.curColor == 1) {
                waves[i].color = 0;
            } else if (boss.curColor == 0) {
                waves[i].color = 1;
            } else {
                waves[i].color = 2;
            }
            if (boss.phase == 4) {
                waves[i].rdel = 1;
            }
            break;
        }
    }
}

void updateRays(BOSSBEAM* b) {
    if (b->active) {
        if (b->firing) {
            if(collision(b->col, b->row, b->width, b->height, player.col, player.row, player.width, player.height)) {
                if (b->color == 2) {
                    if (!player.dashing) {
                        lives--;
                    }
                } else if (b->color != player.color || player.dashing) {
                    lives--;
                }
            }
        }

    }
}
void fireRays(BOSSBEAM* b) {
    if(b->active) {
        b->firing = 1;
    }
}
void stopRays(BOSSBEAM* b) {
    if (b->active) {
        b->firing = 0;
        b->active = 0;

    }
}
void chargeRayV(int a, int b, int c) {
    if (boss.phase == 2) {
        for (int i = 0; i < 3; i++) {

            rays[i].width = 64;
            rays[i].height = 160;
            rays[i].firing = 0;
            rays[i].vert = 1;
            if (i == 0) {
                rays[i].col = a;
            } else if (i == 1) {
                rays[i].col = b;
            } else if (i == 2) {
                rays[i].col = c;
            }
            if (boss.phase2Pattern == 5) {
                rays[i].color = 1;
            } else {
                rays[i].color = 2;
            }
            rays[i].active = 1;


        }
    } else if (boss.phase == 3) {
        for (int i = 0; i < 3; i++) {
            rays[i].width = 64;
            rays[i].height = 160;
            rays[i].firing = 0;
            rays[i].vert = 1;
            if (i == 0) {
                rays[i].col = a;
            } else if (i == 1) {
                rays[i].col = b;
            } else if (i == 2) {
                rays[i].col = c;
            }
            if (i == 0) {
                rays[i].col = a;
                rays[i].color = 0;
            } else {
                rays[i].color = 1;
            }
            rays[i].active = 1;
        }
    }

}
void chargeRayH(int a, int b, int c) {
    if (boss.phase == 2) {
        for (int i = 3; i < 6; i++) {
            rays[i].width= 240;
            rays[i].height = 64;
            rays[i].firing = 0;

            rays[i].vert = 0;
            rays[i].col = 3;
            if (i == 3) {
                rays[i].row = a;
            } else if (i == 4) {
                rays[i].row = b;
            } else if (i == 5) {
                rays[i].row = c;
            }
            if (boss.phase2Pattern == 5) {
                rays[i].color = 0;
            } else {
                rays[i].color = 2;
            }
            rays[i].active = 1;

        }
    } else if (boss.phase == 3) {
        for (int i = 3; i < 6; i++) {
            rays[i].width= 240;
            rays[i].height = 64;
            rays[i].firing = 0;
            rays[i].active = 1;
            rays[i].vert = 0;
            rays[i].col = 1;
            if (i == 3) {
                rays[i].row = a;
            } else if (i == 4) {
                rays[i].row = b;
            } else if (i == 5) {
                rays[i].row = c;
            }

            if (boss.phase3Pattern == 2 || boss.phase3Pattern == 5) {
                if (i == 3) {
                    rays[i].color = 0;
                } else {
                    rays[i].color = 1;
                }
            }
            else if (boss.phase3Pattern == 3 || boss.phase3Pattern == 4) {
                if (i == 3) {
                    rays[i].color = 1;
                } else {
                    rays[i].color = 0;
                }
            }
        }
    }
}

void spawnPortals() {
    for (int i = 0; i < 2; i++) {
        portals[i].active = 1;
        portals[i].width = 64;
        portals[i].height = 16;
        portals[i].vert = 1;
        portals[i].row = 160 - 16;
        if (i == 0) {
            portals[i].col = 240/2 - 64;
            portals[i].portalColor = 0;
            portals[i].colorB = 0;
        } else {
            portals[i].col = 240/2;
            portals[i].portalColor = 1;
            portals[i].colorB = 1;
        }
    }
}
void stopPortals(PORTAL * b) {
    if (b->active) {
        b->active = 0;
    }
}
void spawnPortalsLeft() {
    for (int i = 0; i < 2; i++) {
        portals[i].active = 1;
        portals[i].width = 16;
        portals[i].height = 64;
        portals[i].vert = 0;
        portals[i].col = 1;
        portals[i].row = 24 + (64 * i);
        if (!(i%2)) {
            portals[i].portalColor = 0;
        } else {
            portals[i].portalColor = 1;
        }

    }
}
void spawnPortalsRight(int a) {
    int x = 0;
    for (int i = 2; i < 4; i++) {
        portals[i].active = 1;
        portals[i].width = 16;
        portals[i].height = 64;
        portals[i].vert = 0;
        portals[i].col = 240 - 16;
        portals[i].row = 24 + (64 * x);
        if (a) {
            if (!(i%2)) {
                portals[i].portalColor = 0;
            } else {
                portals[i].portalColor = 1;
            }
        } else {
            if (!(i%2)) {
                portals[i].portalColor = 1;
            } else {
                portals[i].portalColor = 0;
            }
        }







        x++;
    }
}
void firePortals() {

    chargeRayH(24,88,88);
    for (int i = 0; i < 6; i++) {
        fireRays(&rays[i]);
    }
}


void spawnMine() {
    if (!(mine.active)) {
        mine.active = 1;
    }

}
void updateMine() {
    if (mine.active) {
        if(collision(mine.col, mine.row, mine.width, mine.height, player.col, player.row, player.width, player.height)) {
            lives--;
        }
        if (!mine.T){
            if (player.col + 8 > mine.col + 16) {
                mine.col += mine.moveSpeed;
            }
            else if (player.col + 8 < mine.col + 16) {
                mine.col -= mine.moveSpeed;
            }
            else if (mine.col + 16 > player.col && mine.col + 16 < player.col + 16) {
                mine.T = 1;
            }
        }
        else if (mine.T) {
            if (player.row > mine.row + 16) {
                mine.row += mine.moveSpeed;
            }
            else if (player.row + 8 < mine.row + 16) {
                mine.row -= mine.moveSpeed;
            }
            else if (mine.row + 16 > player.row && mine.row + 16 < player.row + 16) {
                mine.T = 0;
            }
        }
    }


}
