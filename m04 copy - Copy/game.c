#include "game.h"
#include "myLib.h"
#include "finalGameSpriteSheet.h"
//#include "boss.h"

ANISPRITE player;
BULLET bullets[BULLETCOUNT];

BOSSSPRITE boss;
BOSSBULLET bossBullets[BOSSBULLETCOUNT];
BOSSBEAM waves[BOSSWAVECOUNT];
BOSSBEAM rays[BOSSRAYCOUNT];
PORTAL portals[PORTALCOUNT];
MINE mine;


//COLORS 0 = BLUE, 1 = RED, 2 = YELLOW

int count = 1;
int lives;
int bossHealth;



//this will prob be used later
int comboCounter = 0;

//===========MAAAAAAIN METHODS=======================
void initGame() {
    initPlayer();
    initBoss();
    hideSprites();

    lives = 1;
    bossHealth = 380;

    DMANow(3, shadowOAM, OAM, 4 * 128);
}
//updates all objects
void updateGame() {
    updatePlayer();
    updateBoss();
    

}
//draws everything
void drawGame() {
    drawPlayer(count);
    drawBoss(count);
    count = 1;
    DMANow(3, shadowOAM, OAM, 4 * 128);
}

//==========================PLAYER METHODS====================================================================
//player intialize
void initPlayer() {
    DMANow(3, finalGameSpriteSheetPal, SPRITEPALETTE, finalGameSpriteSheetPalLen /2);
	DMANow(3, finalGameSpriteSheetTiles, &CHARBLOCK[4], finalGameSpriteSheetTilesLen / 2);
    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;
    player.col = SCREENWIDTH/2 - (player.width/2);
	player.row = SCREENHEIGHT/2;
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
//player update
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
    	if(BUTTON_HELD(BUTTON_UP)) {
			
           player.dashRdel = -3;
           player.dashCdel = player.dashCdel;
            if (player.row -1 >= 0) {
                player.row -= player.rdel;
            } else {
                player.row = player.row;
            }

		}
        if(BUTTON_HELD(BUTTON_DOWN)) {
			
			 player.dashRdel = 3;
             player.dashCdel = player.dashCdel;
             if (player.row + player.height + player.rdel <= 160) {
                player.row += player.rdel;
            } else {
                player.row = player.row;
            }
  
			
		}
        if(BUTTON_HELD(BUTTON_LEFT)) {
			
			player.dashCdel = -3;
            player.dashRdel = player.dashRdel;
            if ((player.col - player.rdel <= 0)) {
                player.col = player.col;
            } else {
                player.col -= player.rdel;
            }

			
		}
        if(BUTTON_HELD(BUTTON_RIGHT)) {
			player.dashRdel = player.dashRdel;
			player.dashCdel = 3;
            if (player.col + player.rdel >= 225) {
                player.col = player.col;
            } else {
                player.col += player.rdel;
            }

			
		}
        if (BUTTON_PRESSED(BUTTON_A)) {
            if (player.color == 1) {
                player.color = 0;
            } else if (player.color == 0) {
                player.color = 1;
            }
        }
        if (BUTTON_PRESSED(BUTTON_B) && player.dashCooldown > 60) {
            player.dashing = 1;
        }
        if (BUTTON_PRESSED(BUTTON_SELECT)) {
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
    //UPDATE BULLETS
    for (int i = 0;  i < BULLETCOUNT; i++) {
        updateBullets(&bullets[i]);
    }
    //CHECK dEATH
    if (lives <= 0) {
        if (player.deathTimer <= 60) {
            player.deathTimer++;
        }
        player.dead = 1;
    }
 
}
//player draw
void drawPlayer(int a) {
    if (!(player.dead)) {
    if (!(player.dashing)) {
        if (player.color == 1) {
        shadowOAM[0].attr0 = (player.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (player.col) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_TILEID(0,
        2) | ATTR2_PALROW(0);
        } else if (player.color == 0) {
        shadowOAM[0].attr0 = (player.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (player.col) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_TILEID(0,
        0) | ATTR2_PALROW(0);
        }
    } else {
        shadowOAM[0].attr0 = (player.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (player.col) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_TILEID(2,
        0) | ATTR2_PALROW(0);
    }


    } else {
        shadowOAM[0].attr0 = ATTR0_HIDE;
        a++;
    }
    for (int i = 0;  i < BULLETCOUNT; i++) {
        drawBullets(&bullets[i], a);
        a++;
    }
    count = a;


}
//player bullets init
void initBullets() {

	for (int i = 0; i < BULLETCOUNT; i++) {

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
    for(int i = 0; i < BULLETCOUNT; i++) {
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
    	// If active, update; otherwise ignore
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
        shadowOAM[a].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[a].attr1 = (b->col) | ATTR1_TINY;
        shadowOAM[a].attr2 = ATTR2_TILEID(0,
        7) | ATTR2_PALROW(0);
    } else {
        shadowOAM[a].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[a].attr1 = (b->col) | ATTR1_TINY;
        shadowOAM[a].attr2 = ATTR2_TILEID(0,
        6) | ATTR2_PALROW(0);
    }
	} else {
        shadowOAM[a].attr0 = ATTR0_HIDE;
    }
}
//=========================================BOSSSSSSSSSS MEHODS=========================================
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
    //boss.firingLasers = 0;
    boss.phase2Pattern = 1;
    boss.phase3Pattern = 1;
    /*
    shortDelay = 0;
    fireTimer = 0;
    lives = 2;
    waveCount = 0;
    yellowWaveTimer = 0;
    */
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
        shadowOAM[(a)].attr0 = (boss.row) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[(a)].attr1 = (boss.col + (32 * i)) | ATTR1_SMALL;
        shadowOAM[(a)].attr2 = ATTR2_TILEID((i * 4),
        11) | ATTR2_PALROW(0);
        a++;
        
    }

        int j = 0;
        for (int i = 6; i < 12; i++) {
        shadowOAM[(a)].attr0 = (boss.row + 8) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[(a)].attr1 = (boss.col + (32 * j)) | ATTR1_MEDIUM;
        shadowOAM[(a)].attr2 = ATTR2_TILEID((j * 4),
        12) | ATTR2_PALROW(0);
        j++;
        a++;
        
    }
   
    count = a;
    

    for (int i = 0; i < BOSSWAVECOUNT; i++) {
        drawWaves(&waves[i],count);
    }
    for (int i = 0; i < BOSSBULLETCOUNT; i++) {
        drawBossBullets(&bossBullets[i], count);
    }
    if (boss.phase == 3 || boss.phase == 4) {
        for (int i = 0; i < PORTALCOUNT; i++) {
            drawPortals(&portals[i], count);
        }
    }
    if (boss.phase == 2 || boss.phase == 3 || boss.phase == 4) {
        for (int i = 0; i < BOSSRAYCOUNT; i++) {
            drawRays(&rays[i],count);
        }
    }
    drawMine(count);
    

    
    
    
    
}
//========================BOSSSSSSSSS BULLETS
void initBossBullets() {
    for (int i = 0; i < BOSSBULLETCOUNT; i++) {
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
            shadowOAM[a].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[a].attr1 = (b->col) | ATTR1_TINY;
            shadowOAM[a].attr2 = ATTR2_TILEID(0,
            5) | ATTR2_PALROW(0);
            a++;
        } else if (!(b->color)) {
            shadowOAM[a].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[a].attr1 = (b->col) | ATTR1_TINY;
            shadowOAM[a].attr2 = ATTR2_TILEID(0,
            4) | ATTR2_PALROW(0);
            a++;
        } else if (b->color == 2) {
            shadowOAM[a].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[a].attr1 = (b->col) | ATTR1_TINY;
            shadowOAM[a].attr2 = ATTR2_TILEID(0,
            8) | ATTR2_PALROW(0);
            a++;
        }
    } else {
            shadowOAM[a].attr0 =ATTR0_HIDE;
            a++;
    }
    count = a;
}
//==================== BOSSS WAVES================
void initWaves() {
    for (int i = 0; i < BOSSWAVECOUNT; i++) {

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
            shadowOAM[(a)].attr0 = (b->row) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[(a)].attr1 = (b->col + (32 * i)) | ATTR1_MEDIUM;
            shadowOAM[(a)].attr2 = ATTR2_TILEID(6,
            j) | ATTR2_PALROW(0);
            a++;
            x++;
        }
            shadowOAM[(a)].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[(a)].attr1 = (b->col + (32 * x)) | ATTR1_SMALL;
            shadowOAM[(a)].attr2 = ATTR2_TILEID(4,
            j) | ATTR2_PALROW(0);
            a++;

    } else {
        shadowOAM[a].attr0 =ATTR0_HIDE;
        a += 8;
    }
    count = a;
}
//===========BOSS RAYS======================================
void initRays() {
    for (int i = 0; i < BOSSRAYCOUNT; i++) {
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
    //IF its supposed to be a beam that goes top to bottom
    if (d->vert) {
        //If beam is charging/showing indicator
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
                shadowOAM[a].attr0 = (d->row) | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[a].attr1 = (d->col + (32 * i)) | ATTR1_MEDIUM;
                shadowOAM[a].attr2 = ATTR2_TILEID(4 + (i * 4),
                j) | ATTR2_PALROW(0);
                a++;
            }

        //If beam is in its firing state and needs to draw a blast going across whole screen (top to bottom)
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
                shadowOAM[a].attr0 = (d->row + (64 * i)) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[a].attr1 = (d->col) | ATTR1_LARGE;
                shadowOAM[a].attr2 = ATTR2_TILEID(x,
                y) | ATTR2_PALROW(0);
                a++;
            }

        }
    //HORIZONTAL LASERS
    } else {
        //these account for beams that go LEFT TO RIGHT
        //If beam is charging/showing indicator
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
                shadowOAM[a].attr0 = (d->row + (32 * i)) | ATTR0_4BPP | ATTR0_TALL;
                shadowOAM[a].attr1 = (d->col) | ATTR1_MEDIUM;
                shadowOAM[a].attr2 = ATTR2_TILEID(j,
                (14 + (4 * i))) | ATTR2_PALROW(0);
                a++;
            }

        //If beam is in its firing state and needs to draw a blast going across whole screen (left to right)
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
                shadowOAM[a].attr0 = (d->row) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[a].attr1 = (d->col  + (64 * i)) | ATTR1_LARGE;
                shadowOAM[a].attr2 = ATTR2_TILEID(x,
                y) | ATTR2_PALROW(0);
                a++;
            }

        }
    }
} else {
        for (int i = 0; i < 4; i++) {
            shadowOAM[a].attr0 = ATTR0_HIDE;
            a++;
        }
    }
count = a;
}

//==========================PORTAL METHODS================================
void initPortals() {
    for (int i = 0; i < PORTALCOUNT; i++) {
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
                    shadowOAM[a].attr0 = (b->row) | ATTR0_4BPP | ATTR0_WIDE;
                    shadowOAM[a].attr1 = (b->col + (32 * i)) | ATTR1_MEDIUM;
                    shadowOAM[a].attr2 = ATTR2_TILEID(j + (i * 4),
                    14) | ATTR2_PALROW(0);
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
                    shadowOAM[a].attr0 = (b->row + (32 * i)) | ATTR0_4BPP | ATTR0_TALL;
                    shadowOAM[a].attr1 = (b->col) | ATTR1_MEDIUM;
                    shadowOAM[a].attr2 = ATTR2_TILEID(j,
                    (16 + (4 * i))) | ATTR2_PALROW(0);
                    a++;
                }
        }
    } else {
        for (int i = 0; i < 2; i++) {
            shadowOAM[a].attr0 = ATTR0_HIDE;
            a++;
        }
    }
    count = a;
    
}
//===================== MINE METHODS
void initMine() {
    mine.width = 32;
    mine.height = 32;
    mine.active = 0;
    mine.row = SCREENWIDTH /2;
    mine.col = SCREENHEIGHT/2;
    mine.moveSpeed = 1;
    mine.T = 0;
}

void drawMine(int a) {
    if (mine.active) {
        shadowOAM[a].attr0 = (mine.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[a].attr1 = (mine.col) | ATTR1_MEDIUM;
        shadowOAM[a].attr2 = ATTR2_TILEID(0,
        24) | ATTR2_PALROW(0);
        a++;
    }
    count = a;
}




