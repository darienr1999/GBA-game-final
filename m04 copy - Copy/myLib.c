#include "myLib.h"
 
// The start of the video memory
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// The shadowOAM
OBJ_ATTR shadowOAM[128];

// Set a pixel on the screen in Mode 3
void setPixel3(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int col, int row, unsigned char colorIndex) {
    unsigned short pixelData = videoBuffer[OFFSET(col, row, SCREENWIDTH) / 2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= (colorIndex << 8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[OFFSET(col, row, SCREENWIDTH) / 2] = pixelData;
}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(col, row+r, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
    }
}

// Draw a rectangle at the specified location and size in Mode 4
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int i = 0; i < height; i++) {
        if ((!(col & 1)) && (!(width & 1))) {
            // even column, even width
            DMANow(3, &pixelData, &videoBuffer[OFFSET(col, row + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | (width / 2));
        } else if ((!(col & 1)) && (width & 1)) {
            // even column, odd width
            if (!(width - 1 <= 0)) {
                // DMA only if number of transfers is > 0
                DMANow(3, &pixelData, &videoBuffer[OFFSET(col, row + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | ((width - 1) / 2));
            }
            setPixel4(col + width - 1, row + i, colorIndex);
        } else if ((col & 1) && (width & 1)) {
            // odd column, odd width
            if (!(width - 1 <= 0)) {
                // DMA only if number of transfers is > 0
                DMANow(3, &pixelData, &videoBuffer[OFFSET(col + 1, row + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | ((width - 1) / 2));
            }
            setPixel4(col, row + i, colorIndex);
        } else if ((col & 1) && (!(width & 1))) {
            // odd column, even width
            if (!(width - 2 <= 0)) {
                // DMA only if number of transfers is > 0
                DMANow(3, &pixelData, &videoBuffer[OFFSET(col + 1, row + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | ((width - 2) / 2));
            }
            setPixel4(col + width - 1, row + i, colorIndex);
            setPixel4(col, row + i, colorIndex);
        }
    }
}

// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT) / 2);
}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int col, int row, int height, int width, const unsigned short *image) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(0, r, width)], &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], width);
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int col, int row, int height, int width, const unsigned short *image) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[OFFSET(0, i, width / 2)], &videoBuffer[OFFSET(col, row + i, SCREENWIDTH) / 2], width / 2);
    }

}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {
    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT / 2);
}

// Pause code execution until vertical blank begins
void waitForVBlank() {
    while(SCANLINECOUNTER > 160);
    while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}

void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}