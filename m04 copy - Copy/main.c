
#include "myLib.h"
#include "game.h"
#include "startScreen.h"
#include "lose.h"
#include "pause.h"
#include "YouWin.h"
#include "background.h"
#include "bg2.h"
#include "startscreen2.h"
#include "pause2.h"
#include "sound.h"
#include "gameSong.h"
#include "gameOver.h"
#include "loseSound.h"
#include "menu.h"
#include "instruction.h"
//#include "boss.h"

/*
WORK IN PROGRESS

*FIXED******************************"MAJOR COLLISION ISSUES, only objects with working collision or BOSSBULLETS, but even that is inconsistent"
took me WAYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY to long to figure out what the problem is. turned out that the problem was i had an iq of -30000

To Do List
-FIX THE COLLISION ISSUES SOMEHOW *FIXED*
-finish PHASE 3 (portals)


-Implement PHASE 4
Boss spawns 4 enemies that you have to destroy in a certain amount of time or they explode and you die

                       ████████████████████████████████████████
                       ██                                   ███
                      ███     ╔═══╗             ╬═══╗        ██
                      ███     ║  ╚║             ║   ╚╗       ██
                      ███     ╚═══╝             ╚════╝       ██
                      ███                                    ██
                      ███                                    ██
                      ███                                    ███
                      ███                       ╔════╗       ███
                       ██     ╔════╗            ║    ╚╗       ██
                       ██     ║    ║            ║     ║       ██
                      ███     ║    ║            ║     ║       ██
                      ██      ║════╝            ╚═════╝       ██
                      ███     ║                               ██
                      ███                                     ██
                       ██      ███████                        ██
                      ██████████████████████████████████████████
                      ██████████████████████████████████████████
                      squares in middle represent enemy layout
                      enemies fire bullets away from their center point
-Implement PHASE 5
1 BEAM type 2 fires down middle of screen and another fires across from the left splitting screen into 4 equal quadrants
beams will continue to fire until phase is over (they will be yellow so the only way for the player to traverse them is through dashing through them)
BOSS WILL SPAWN A MINE THAT FOLLOWS THE PLAYER SLOWLY AROUND THE SCREEN, if it touches the player they auto die, Mine is not affected by beams type 2
while this is happening BEAM type 1s(the ones that are the width of the screen and fall downward) will also VERY ocasionally fall

                ███████████████████████████████████████████████
                █                    ░░░░                     ██
                █                    ░░░░                      █
                █                    ░░░░                      █
                █                    ░░░░                      █
                █                    ░░░░                      █
                █                   ░░░░░                      █
                █░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
                █░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
                █░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
                █  ┌───┐     ░░░░   ░░░░░                      ██
                █  │   │             ░░░░                      █
                █  │   │             ░░░░                      █
                █  └───┘             ░░░░                      █
                █         ╬════╗     ░░░░                      █
                █         ║▒▒▒▒║     ░░░░                      █
                █         ║▒▒▒▒║     ░░░░                      █
                █         ╚════╝     ░░░░                      █
                ████████████████████████████████████████████████
                square with single line border = player
                square with double line is the MINE that slowly follows the player

-Implement phase 6 last phase?
background will be swapped to a maze and and collision map will be used to enforce boundaries
when this happens small enemies will spawn within the maze and players bullets will not go through the walls, but they will have to destroy all enemies to make maze dissapear
when the background swaps to the maze boss will start a hard enrage timer where if the player does not kill the enemies in the maze to make it dissapear AND burn rest of boss hp
in time, they die

- HOLY MOLY FIX THE COLLISION(did it!)
-Fix the dang art(Most of it done)
-display lives and dash availability

-possibly second boss. like (7% chance of that happening at this point)

*/



void initialize();

// State Prototypes
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


// States
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

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];


unsigned short vOff;

int instr = 0;

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
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
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 
    REG_BG0CNT = BG_SIZE_TALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    buttons = BUTTONS;
    oldButtons = 0;

    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(26);

    //initGame();
    //DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen /2);
	//DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    vOff = 0;

    setupSounds();
	setupInterrupts();

    stopSound();
	playSoundA(menu_data, menu_length, 1);
    goToStart();
}
void goToStart() {
    /*
    DMANow(3, startScreenPal, PALETTE, startScreenPalLen/2);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
    DMANow(3, startScreenMap, &SCREENBLOCK[28], startScreenMapLen / 2);
    */
    DMANow(3, startScreen2Pal, PALETTE, startScreen2PalLen/2);
    DMANow(3, startScreen2Tiles, &CHARBLOCK[0], startScreen2TilesLen / 2);
    DMANow(3, startScreen2Map, &SCREENBLOCK[28], startScreen2MapLen / 2);
    //REG_BG0VOFF = 50;


    state = START;

}
void start() {
    if (BUTTON_PRESSED(BUTTON_START) && !(instr)) {
        initGame();
        stopSound();
		playSoundA(gameSong_data, gameSong_length, 1);
        goToGame();
        
    }
    else if (BUTTON_PRESSED(BUTTON_UP) && !(instr)) {
        instr = 1;
        DMANow(3, startScreenPal, PALETTE, startScreenPalLen/2);
        DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
        DMANow(3, startScreenMap, &SCREENBLOCK[28], startScreenMapLen / 2);
    }
    else if (BUTTON_PRESSED(BUTTON_DOWN) && (instr)) {
        instr = 0;
        DMANow(3, startScreen2Pal, PALETTE, startScreen2PalLen/2);
        DMANow(3, startScreen2Tiles, &CHARBLOCK[0], startScreen2TilesLen / 2);
        DMANow(3, startScreen2Map, &SCREENBLOCK[28], startScreen2MapLen / 2);
    }
    else if (BUTTON_PRESSED(BUTTON_START) && (instr)) {
        goToInstruction();
    }
}
void goToGame() {
    /*
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[28], backgroundMapLen / 2);
    */
    DMANow(3, bg2Pal, PALETTE, bg2PalLen / 2);
    DMANow(3, bg2Tiles, &CHARBLOCK[0], bg2TilesLen / 2);
    DMANow(3, bg2Map, &SCREENBLOCK[28], bg2MapLen / 2);

    state = GAME;
}
void game() {
    updateGame();
    vOff--;
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
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
    REG_BG0VOFF = vOff;
    
}
void goToPause() {
    REG_BG0VOFF = 30;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 4 * 128);
    state = PAUSE;
    /*
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2);
    */
    DMANow(3, pause2Pal, PALETTE, pause2PalLen / 2);
    DMANow(3, pause2Tiles, &CHARBLOCK[0], pause2TilesLen / 2);
    DMANow(3, pause2Map, &SCREENBLOCK[28], pause2MapLen / 2);
}
void pause() {
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame();
    }

}
void goToWin() {
    //REG_BG0VOFF = screen;
    vOff = 30;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 4 * 128);
    state = WIN;
    DMANow(3, YouWinPal, PALETTE, YouWinPalLen / 2);
    DMANow(3, YouWinTiles, &CHARBLOCK[0], YouWinTilesLen / 2);
    DMANow(3, YouWinMap, &SCREENBLOCK[28], YouWinMapLen / 2);
   
    
}
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        //vOff = 0;
        REG_BG0VOFF = 0;
        stopSound();
	    playSoundA(menu_data, menu_length, 1);
        goToStart();
    }
}
void goToLose() {
    REG_BG0VOFF = screen + 20;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 4 * 128);
    state = LOSE;
    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);
    
}
void lose() {
    //REG_BG0VOFF = 0;
    //vOff = 0;
    if (BUTTON_PRESSED(BUTTON_START)) {
        REG_BG0VOFF = 0;
        stopSound();
	    playSoundA(menu_data, menu_length, 1);
        goToStart();
    }
}

void goToInstruction() {
    DMANow(3, instructionPal, PALETTE, instructionPalLen/2);
    DMANow(3, instructionTiles, &CHARBLOCK[0], instructionTilesLen / 2);
    DMANow(3, instructionMap, &SCREENBLOCK[28], instructionMapLen / 2);
    state = INSTRUCTION;

}
void instruction() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}