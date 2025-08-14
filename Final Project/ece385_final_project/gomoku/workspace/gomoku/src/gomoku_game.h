#ifndef HDMI_TEXT_CONTROLLER_H
#define HDMI_TEXT_CONTROLLER_H

/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"
#include "xparameters.h"
#include "sleep.h"

#define COLUMNS 16
#define ROWS 17
#define BOARD_SIZE 16
#define INT_MIN    -9999999
#define INT_MAX    9999999
#define WHITE      2
#define BLACK      1
#define EMPTY      0

struct TEXT_HDMI_STRUCT {
	/*	VRAM that stores the game board.
	 * 	0 --- empty
	 *	1 --- black
	 * 	2 --- white
	 *  3 --- highlighted empty
	 * 	4 --- highlighted black
     * 	5 --- highlighted white
	 * 
	 * 	Also notice that the board is 16*16, but we define VRAM as 16*17. Hence we could place some game
	 *  info inside the last 16 register.
	 */

	uint8_t VRAM [ROWS*COLUMNS];
};


//you may have to change this line depending on your platform designer
static volatile struct TEXT_HDMI_STRUCT* hdmi_ctrl = XPAR_HDMI_TEXT_CONTROLLER_0_AXI_BASEADDR;


/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a HDMI_TEXT_CONTROLLER register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the HDMI_TEXT_CONTROLLERdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void HDMI_TEXT_CONTROLLER_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define HDMI_TEXT_CONTROLLER_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a HDMI_TEXT_CONTROLLER register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the HDMI_TEXT_CONTROLLER device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 HDMI_TEXT_CONTROLLER_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define HDMI_TEXT_CONTROLLER_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/

// major game loop for keyboard
void game_loop(uint8_t keycode);

// major game loop for mouse
void game_loop_mouse(int Xdispl, int Ydispl, int mouse_clicked);

// major game loop for pvp
void game_keyboard(uint8_t keycode);

// game support for mouse
void game_mouse(int Xdispl, int Ydispl, int mouse_clicked);

// ai generate moves
int ai_move(int board[BOARD_SIZE][BOARD_SIZE]);

// minimax search algorithm
int minimax(int board[BOARD_SIZE][BOARD_SIZE], int depth, int alpha, int beta, int maximizingPlayer);
int max(int a, int b);
int min(int a, int b);

// evaluation function for ai
int evaluate(int board[BOARD_SIZE][BOARD_SIZE]);

// game loop for ai
void game_ai(uint8_t keycode);

// game loop for ai(mouse)
void game_ai_mouse(int Xdispl, int Ydispl, int mouse_clicked);

// check wining and highlight the win 5s
int checkWin(int row, int col, int player);

// check wining and highlight the win 5s
int checkWin2(int board[BOARD_SIZE][BOARD_SIZE], int row, int col, int player);

#endif // HDMI_TEXT_CONTROLLER_H
