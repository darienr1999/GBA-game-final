#include "myLib.h"

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
    //HEY
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
    //int firingLasers;
    int phase2Pattern;
    int phase3Pattern;
    //phase 1
    int bulletTimer;
    int colorTimer;
    int waveCount;
    int shotsFired;
    int bDir;
    int waveTimer;
    //portal phase
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

//beam prototype

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

//portal prototype
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




#define BULLETCOUNT 5
#define BOSSBULLETCOUNT 30
#define BOSSWAVECOUNT 3
#define BOSSRAYCOUNT 6
#define PORTALCOUNT 4




extern ANISPRITE player;
extern BOSSSPRITE boss;
extern BULLET bullets[BULLETCOUNT];
extern BOSSBULLET bossBullets[BOSSBULLETCOUNT];
extern BOSSBEAM waves[BOSSWAVECOUNT];
extern BOSSBEAM rays[BOSSRAYCOUNT];
extern MINE mine;

extern PORTAL portals[PORTALCOUNT];

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
//BOSS METHODS
void initBoss();
void drawBoss(int);
void updateBoss();
//BOSS BULLETMETHODS
void initBossBullets();
void updateBossBullets(BOSSBULLET*);
void drawBossBullets(BOSSBULLET*, int);
void fireBossBullet();
//BOSS WAVE METHODS
void initWaves();
void updateWaves(BOSSBEAM *);
void drawWaves(BOSSBEAM *, int);
void fireWave();
//BOSS RAY METHODS
void initRays();
void chargeRayV(int,int,int);
void chargeRayH(int,int,int);
void updateRays(BOSSBEAM*);
void drawRays(BOSSBEAM *,int);
void fireRays(BOSSBEAM *);
void stopRays(BOSSBEAM *);
//PORTAL METHODS
void initPortals();
void spawnPortals();
void drawPortals(PORTAL *, int);
void spawnPortalsLeft();
void spawnPortalsRight(int);
void hideRightPortals();
void firePortals();
void stopPortals();
//MINE METHODS
void initMine();
void spawnMine();
void updateMine();
void drawMine(int);
void deSpawnMine();





//boss phases
void phase1();
void phase2();
void phase3();
void phase4();
