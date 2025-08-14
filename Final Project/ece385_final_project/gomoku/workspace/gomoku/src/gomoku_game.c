#include "gomoku_game.h"

// if the game ends, end_flag is high
static int end_flag = 1;

/*
 * In sv files, color_mapper will check hdmi_ctrl->VRAM[260], if it's 0, then we print menu
 * else, we print game board.
 */
void game_loop(uint8_t keycode){
	// if game is end
	if(end_flag){
        // if((keycode != 0x2C) && (keycode != 0x13) && (keycode != 0x0C)){
        //     return;
        // }
        if(keycode == 0x00){
            return;
        }
		// clear the game board
		for(int x = 0; x < ROWS * COLUMNS; x++){
			hdmi_ctrl->VRAM[x] = 0;
		}
        
		// if user press P, human vs human mode
		if(keycode == 0x13){
			hdmi_ctrl->VRAM[260] = 1;
			end_flag = 0;
		// if user press I, human vs AI mode
		}else if(keycode == 0x0C){
			hdmi_ctrl->VRAM[260] = 2;
			end_flag = 0;
		}

	}else{
		if(hdmi_ctrl->VRAM[260] == 1){
			game_keyboard(keycode);
		}else if(hdmi_ctrl->VRAM[260] == 2){
			game_ai(keycode);
		}
	}

}

// main game loop for mouse, similar to game_loop
void game_loop_mouse(int Xdispl, int Ydispl, int mouse_clicked){
	// if game is end
	if(end_flag){
		// clear the game board
		for(int x = 0; x < ROWS * COLUMNS; x++){
			hdmi_ctrl->VRAM[x] = 0;
		}
		// if user press P, human vs human mode
		if(mouse_clicked == 1){
			hdmi_ctrl->VRAM[260] = 1;
			end_flag = 0;
		// if user press I, human vs AI mode
		}else if(mouse_clicked == 2){
			hdmi_ctrl->VRAM[260] = 2;
			end_flag = 0;
		}

	}else{
		if(hdmi_ctrl->VRAM[260] == 1){
			game_mouse(Xdispl, Ydispl, mouse_clicked);
		}else if(hdmi_ctrl->VRAM[260] == 2){
			game_ai_mouse(Xdispl, Ydispl, mouse_clicked);
		}
	}

}

/*
 * Gomoku game logic for keyboard
 * Highlight current position that cursor is, and change cursor position based
 * on WASD keycode. Finally, place chess if user press enter and check wining.
 */
void game_keyboard(uint8_t keycode) {
    xil_printf("260: %d \n", hdmi_ctrl->VRAM[260]);
    xil_printf("264: %d \n", hdmi_ctrl->VRAM[264]);
    static int player = 1; // 1 for black, 2 for white
    static int row = 8, col = 8; // starting position
    static int prevRow = 8, prevCol = 8; // previous position

    // highlight the default one
    if (hdmi_ctrl->VRAM[row * 16 + col] == 0) {
        hdmi_ctrl->VRAM[row * 16 + col] = 3;
    }

    // Update the current position based on the keycode
    switch (keycode) {
        case 0x1A: // W
        case 0x52:
            if (row > 0) {
                prevRow = row;
                prevCol = col;
                row--;
            }
            break;
        case 0x16: // S
        case 0x51:
            if (row < 15) {
                prevRow = row;
                prevCol = col;
                row++;
            }
            break;
        case 0x04: // A
        case 0x50:
            if (col > 0) {
                prevRow = row;
                prevCol = col;
                col--;
            }
            break;
        case 0x07: // D
        case 0x4F:
            if (col < 15) {
                prevRow = row;
                prevCol = col;
                col++;
            }
            break;
        case 0x28: // Enter
            if (hdmi_ctrl->VRAM[row * 16 + col] == 3) {
            	// place the chess
                hdmi_ctrl->VRAM[row * 16 + col] = player;
                if (checkWin(row, col, player) != 0) {
                    // Perform any additional actions for game over
                	// sleep(1);
                	end_flag = 1;
                    hdmi_ctrl->VRAM[264] = player;
                } else {
                    // switch player
                    if(player == 1){
                    	player = 2;
                    }else{
                    	player = 1;
                    }
                }
            }
            break;
        default:
            break;
    }
    // remove highlighting
    if(hdmi_ctrl->VRAM[prevRow * 16 + prevCol] >= 3){
    	hdmi_ctrl->VRAM[prevRow * 16 + prevCol] -= 3;
    }
    // highlighting new position
    if (hdmi_ctrl->VRAM[row * 16 + col] < 3) {
        hdmi_ctrl->VRAM[row * 16 + col] += 3;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 * Similar to game_keyboard, but it support mouse. Use a cursorX and cursorY
 * to keep track of cursor position.
 */
void game_mouse(int Xdispl, int Ydispl, int mouse_clicked) {
    static int player = 1; // 1 for black, 2 for white
    static int row = 8, col = 8; // starting position
    static int prevRow = 8, prevCol = 8; // previous position
    static int cursorX = 384, cursorY = 384; // initial cursor position (center of the board)

    // update the cursor position and decrease speed
    cursorX = cursorX + Xdispl;
    cursorY = cursorY + Ydispl;

    // set boundaries for cursor
    if (cursorX < 0){
    	cursorX = 0;
    }
    if (cursorX >= 768){
    	cursorX = 767;
    }
    if (cursorY < 0){
    	cursorY = 0;
    }
    if (cursorY >= 768){
    	cursorY = 767;
    }

    // Calculate the row and column based on the cursor position
    int newRow = cursorY / 48;
    int newCol = cursorX / 48;

    // Update the row and column if they have changed
    if (newRow != row || newCol != col) {
        prevRow = row;
        prevCol = col;
        row = newRow;
        col = newCol;

        // remove highlighting
        if (hdmi_ctrl->VRAM[prevRow * 16 + prevCol] >= 3) {
            hdmi_ctrl->VRAM[prevRow * 16 + prevCol] -= 3;
        }

        // highlighting new position
        if (hdmi_ctrl->VRAM[row * 16 + col] < 3) {
            hdmi_ctrl->VRAM[row * 16 + col] += 3;
        }
    }

    // check for mouse click
    if (mouse_clicked == 1) {
        if (hdmi_ctrl->VRAM[row * 16 + col] == 3) {
            // place the chess piece
            hdmi_ctrl->VRAM[row * 16 + col] = player;
            // if some player wins
            if (checkWin(row, col, player) != 0) {
                // sleep(1);
                end_flag = 1;
                hdmi_ctrl->VRAM[260] = 0;
            } else {
            	// highlight current chess
            	hdmi_ctrl->VRAM[row * 16 + col] += 3;
                // switch player
                if(player == 1){
                	player = 2;
                }else{
                	player = 1;
                }
            }
        }
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 * Check for horizontal, vertical, and diagonal wins
 * Return: 1 --- anyone wins
 * 		   0 --- no wins
 */
int checkWin(int row, int col, int player) {
    int directions[4][2] = {{1, 0}, {0, 1}, {1, 1}, {1, -1}};
    int count, winRow, winCol;

    for (int i = 0; i < 4; i++) {
        count = 1;
        int dRow = directions[i][0], dCol = directions[i][1];

        // Arrays to store winning coordinates
        int winningCoords[5][2];
        winningCoords[0][0] = row;
        winningCoords[0][1] = col;

        // check in the positive direction
        int r = row + dRow, c = col + dCol;
        while (r >= 0 && r < 16 && c >= 0 && c < 16 && hdmi_ctrl->VRAM[r * 16 + c] == player && count < 5) {
            winningCoords[count][0] = r;
            winningCoords[count][1] = c;
            count++;
            r += dRow;
            c += dCol;
        }

        // check in the negative direction
        r = row - dRow;
        c = col - dCol;
        while (r >= 0 && r < 16 && c >= 0 && c < 16 && hdmi_ctrl->VRAM[r * 16 + c] == player && count < 5) {
            winningCoords[count][0] = r;
            winningCoords[count][1] = c;
            count++;
            r -= dRow;
            c -= dCol;
        }

        // check if there are 5 in a row
        if (count >= 5) {
            // highlight the winning sequence
            for (int j = 0; j < 5; j++) {
                winRow = winningCoords[j][0];
                winCol = winningCoords[j][1];
                hdmi_ctrl->VRAM[winRow * 16 + winCol] += 3; 
            }

            return 1;
        }
    }
    // no winner detected
    return 0; 
}

/*
 * Check for horizontal, vertical, and diagonal wins, using board as chessboard
 * Return: 1 --- anyone wins
 * 		   0 --- no wins
 */
int checkWin2(int board[BOARD_SIZE][BOARD_SIZE], int row, int col, int player) {
    int directions[4][2] = {{1, 0}, {0, 1}, {1, 1}, {1, -1}};
    int count, winRow, winCol;

    for (int i = 0; i < 4; i++) {
        count = 1;
        int dRow = directions[i][0], dCol = directions[i][1];

        // Arrays to store winning coordinates
        int winningCoords[5][2];
        winningCoords[0][0] = row;
        winningCoords[0][1] = col;

        // check in the positive direction
        int r = row + dRow, c = col + dCol;
        while (r >= 0 && r < 16 && c >= 0 && c < 16 && board[r][c] == player && count < 5) {
            winningCoords[count][0] = r;
            winningCoords[count][1] = c;
            count++;
            r += dRow;
            c += dCol;
        }

        // check in the negative direction
        r = row - dRow;
        c = col - dCol;
        while (r >= 0 && r < 16 && c >= 0 && c < 16 && board[r][c] == player && count < 5) {
            winningCoords[count][0] = r;
            winningCoords[count][1] = c;
            count++;
            r -= dRow;
            c -= dCol;
        }

        // check if there are 5 in a row
        if (count >= 5) {
            return 1;
        }
    }
    // no winner detected
    return 0; 
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 * Minimax algorithm with alpha beta pruning for the game
 */
int minimax(int board[BOARD_SIZE][BOARD_SIZE], int depth, int alpha, int beta, int maximizingPlayer) {
    if (depth == 0) {
        return evaluate(board);
    }

    if (maximizingPlayer) {
        int maxEval = INT_MIN;
        // Generate all possible moves for WHITE
        for (int i = 0; i < BOARD_SIZE; i++) {
            for (int j = 0; j < BOARD_SIZE; j++) {
                if (board[i][j] == EMPTY) {
                    board[i][j] = WHITE;
                    int eval = minimax(board, depth - 1, alpha, beta, 0);
                    board[i][j] = EMPTY;
                    maxEval = max(maxEval, eval);
                    alpha = max(alpha, eval);
                    if (beta <= alpha)
                        break; // Alpha-Beta Pruning
                }
            }
        }
        return maxEval;
    } else {
        int minEval = INT_MAX;
        // Generate all possible moves for BLACK
        for (int i = 0; i < BOARD_SIZE; i++) {
            for (int j = 0; j < BOARD_SIZE; j++) {
                if (board[i][j] == EMPTY) {
                    board[i][j] = BLACK;  // Assume the opponent places a black piece here
                    int eval = minimax(board, depth - 1, alpha, beta, 1);
                    board[i][j] = EMPTY;  // Undo the move
                    minEval = min(minEval, eval);
                    beta = min(beta, eval);
                    if (beta <= alpha)
                        break; // Alpha-Beta Pruning
                }
            }
            if (beta <= alpha)
                break; // Alpha-Beta Pruning to stop evaluating once the branch is non-optimal
        }
        return minEval;   
    }
}

// std::max
int max(int a, int b){
    if(a < b){
        return b;
    }else{
        return a;
    }
}

// std::min
int min(int a, int b){
    if(a < b){
        return a;
    }else{
        return b;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 * Make AI moves.
 * If the game just started, we don't have much information to calculate the board value,
 * so we just put white chess around the first black chess that human placed. After three
 * moves, we search every position and calculate the corresponding value and maximize it.
 * Input    --- 16*16 game board
 * Output   --- Coordinate to place the chess, enpacked as row * 16 + col, unpacked in game_ai
 */
int ai_move(int board[BOARD_SIZE][BOARD_SIZE]) {
    int bestMove = -1;
    int bestScore = INT_MIN;
    // if all chess has same score, equal_flag = 1
    int equal_flag = 1;

    for (int i = 0; i < BOARD_SIZE; i++) {
        for (int j = 0; j < BOARD_SIZE; j++) {
            if (board[i][j] == EMPTY) {
                // hypothetically put the white chess
                board[i][j] = WHITE;

                // check if we could win
                if(checkWin2(board, i, j, WHITE)){
                    hdmi_ctrl->VRAM[i * BOARD_SIZE + j] = WHITE;
                    checkWin(i, j, WHITE);
                    xil_printf("AI player wins!\n");
                    hdmi_ctrl->VRAM[264] = WHITE;
                    // clear board
                    for(int x = 0; x < 16; x++){
                        for(int y = 0; y < 16; y++){
                             board[x][y] = 0;
                        }
                    }
                    // reset flags
                    end_flag = 1;
                    // sleep(1);
                    bestMove = 3387;

                    return bestMove;
                }
                // evaluate the chess we put
                int score = minimax(board, 0, INT_MIN, INT_MAX, 1);
                xil_printf("Current position: (%d, %d), score: %d \n", i, j, score);

                board[i][j] = EMPTY;
                // maximize the chess
                if (score >= bestScore) {
                    bestScore = score;
                    bestMove = j + i * BOARD_SIZE;
                }
            }
        }
    }

    // if all score is the same 
    if(bestMove == 255){
        for (int i = 0; i < BOARD_SIZE; i++) {
            for (int j = 0; j < BOARD_SIZE; j++) {
                // put white chess close to black chess when bestscore is 0
                if(board[i][j] == BLACK){
                    if(board[i + 1][j - 1] == EMPTY){
                        bestMove = j - 1 + (i + 1) * BOARD_SIZE;
                        return bestMove;
                    }else if(board[i][j - 1] == EMPTY){
                        bestMove = j - 1 + i * BOARD_SIZE;
                        return bestMove;
                    }else if(board[i - 1][j] == EMPTY){
                        bestMove = j + (i - 1) * BOARD_SIZE;
                        return bestMove;
                    }else if(board[i + 1][j + 1] == EMPTY){
                        bestMove = j + 1 + (i + 1) * BOARD_SIZE;
                        return bestMove;
                    }
                }
            }
        }
    }
    xil_printf("Bestmove: (%d, %d), Bestscore: %d \n", bestMove/16, bestMove%16, bestScore);
    return bestMove;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 * Evaluation of current board. There are 6 situations to be detected.
 * Input    --- chess board
 * Output   --- rewards for current chess board    
 *
 * 1.   O O O                       --- open three
 * 2.   X O O O  / O O O X          --- closed three
 * 3.   X O O O X                   --- fully closed three
 * 
 * 4.   O O O O / O O   O           --- open four
 * 5.   X O O O O / O O O O X       --- closed four
 * 6.   X O O O O X                 --- fully closed four
 * 
 * ---- Note that we are not able to detect open four/three patterns with a gap, for exmaple:
 *      O O   O O
 *      However, with minimax algorithm, if black playere is rational, he will place the chess inside the gap
 *      to maximize the rewards. And white player (AI) will take corresponding actions.
 * 
 * ---- I assign different weights to those six situations, since AI are playing white chess, anything benifits for 
 *      white should be +, and anything benifits black is -
 * 
 * ---- Also notice that AI plays after human plays, so black chess have higher priority than white chess. For example,
 *      if black chess has a closed four, it clearly has higher priority than an open/closed four for white.
 *      Based on that, the following are the priorities.
 * 
 *      No.1: Open four (black)             Highest
 *      No.2: Closed four (black) 
 *      No.3: Open four (white)
 *      No.4: Closed four (white) 
 * 
 *      No.5: Open three (black)
 *      No.6: Open three (white)
 *      No.7: Closed three (black) 
 *      No.8: Closed three (white)          Lowest
 *      
 * ---  In addition, fully closed three/four have no threats, in fact, it will highly likely to be a bad move, since it cannot
 *      form any useful patterns. So I assign negative weights to prevent we trying to form closed three/four patterns.
 */
int evaluate(int board[BOARD_SIZE][BOARD_SIZE]) {
    int score = 0;

    // Weights for different patterns
    const int OPEN_THREE_WEIGHT_W = 250;
    const int CLOSED_THREE_WEIGHT_W = 50;
    const int OPEN_FOUR_WEIGHT_W = 2000;
    const int CLOSED_FOUR_WEIGHT_W = 1000;

    // we have to stop black to form open/close four. Hence the weights 
    // for black should be larger than us, as black plays first
    const int OPEN_THREE_WEIGHT_B = 800;
    const int CLOSED_THREE_WEIGHT_B = 200;
    const int OPEN_FOUR_WEIGHT_B = 10000;
    const int CLOSED_FOUR_WEIGHT_B = 8000;

    // Check rows
    for (int i = 0; i < BOARD_SIZE; i++) {
        for (int j = 0; j <= BOARD_SIZE - 4; j++) {
            int count_white = 0;
            int count_black = 0;

            int open_start_black_3 = 1;
            int open_start_white_3 = 1;

            int open_end_black_3 = 1;
            int open_end_white_3 = 1;

            int open_start_black_4 = 1;
            int open_start_white_4 = 1;

            int open_end_black_4 = 1;
            int open_end_white_4 = 1;

            // check if we have fours/threes for both B/W
            if((board[i][j + 1] == WHITE) && (board[i][j + 2] == WHITE)){
                if((board[i][j] == WHITE) && (board[i][j + 3] == WHITE)){
                    count_white = 4;
                }else if (board[i][j] == WHITE){
                    count_white = 3;
                }
            }
            if((board[i][j + 1] == BLACK) && (board[i][j + 2] == BLACK)){
                if((board[i][j] == BLACK) && (board[i][j + 3] == BLACK)){
                    count_black = 4;
                }else if (board[i][j] == BLACK){
                    count_black = 3;
                }
            }
            
        //    // check for O O   O cases
           if((board[i][j] == WHITE) && (board[i][j + 1] == WHITE) && (board[i][j + 2] == EMPTY) && (board[i][j + 3] == WHITE)){
           	    count_white = 3;
                score -= 20;
           }
           if((board[i][j] == BLACK) && (board[i][j + 1] == BLACK) && (board[i][j + 2] == EMPTY) && (board[i][j + 3] == BLACK)){
           	    count_black = 3;
                score -= 20;
           }
           if((board[i][j] == WHITE) && (board[i][j + 1] == EMPTY) && (board[i][j + 2] == WHITE) && (board[i][j + 3] == WHITE)){
           	    count_white = 3;
                score -= 20;
           }
           if((board[i][j] == BLACK) && (board[i][j + 1] == EMPTY) && (board[i][j + 2] == BLACK) && (board[i][j + 3] == BLACK)){
           	    count_black = 3;
                score -= 20;
           }

            // determine if we have open at the left (3&4)
            if ((j > 0) && (board[i][j - 1] == BLACK)){
                open_start_white_3 = 0;
                open_start_white_4 = 0;
            }
            if ((j > 0) && (board[i][j - 1] == WHITE)){
                open_start_black_3 = 0;
                open_start_black_4 = 0;
            }
            
            if((count_black == 3) || (count_white == 3)){
                // determine if we have open at the right for 3
                if (((j + 3) < BOARD_SIZE) && (board[i][j + 3] == BLACK)){
                    open_end_white_3 = 0;
                }
                if (((j + 3) < BOARD_SIZE) && (board[i][j + 3] == WHITE)){
                    open_end_black_3 = 0;
                }
            }
            if((count_black == 4) || (count_white == 4)){
                // determine if we have open at the right for 4
                if (((j + 4 )< BOARD_SIZE) && (board[i][j + 4] == BLACK)){
                    open_end_white_4 = 0;
                }
                if (((j + 4) < BOARD_SIZE) && (board[i][j + 4] == WHITE)){
                    open_end_black_4 = 0;
                }
            }

            // if we have three black in a row 
            if(count_black == 3){
                // fully open
                if(open_start_black_3 && open_end_black_3){
                    score -= OPEN_THREE_WEIGHT_B;
                // fully unopen
                }else if((open_start_black_3 == 0) && (open_end_black_3 == 0)){
                    score -= 0;
                // open at one side
                }else{
                    score -= CLOSED_THREE_WEIGHT_B;
                }
            }
            // if we have three white in a row
            if(count_white == 3){
                // fully open
                if(open_start_white_3 && open_end_white_3){
                    score += OPEN_THREE_WEIGHT_W;
                // fully unopen
                }else if((open_start_white_3 == 0) && (open_end_white_3 == 0)){
                    score -= 5;
                // open at one side
                }else{
                    score += CLOSED_THREE_WEIGHT_W;
                }
            }

            // if we have four black in a row 
            if(count_black == 4){
                // fully open
                if(open_start_black_4 && open_end_black_4){
                    score -= OPEN_FOUR_WEIGHT_B;
                // fully unopen
                }else if((open_start_black_4 == 0) && (open_end_black_4 == 0)){
                    score -= 0;
                // open at one side
                }else{
                    score -= CLOSED_FOUR_WEIGHT_B;
                }
            }
            // if we have four white in a row
            if(count_white == 4){
                // fully open
                if(open_start_white_4 && open_end_white_4){
                    score += OPEN_FOUR_WEIGHT_W;
                // fully unopen
                }else if((open_start_white_4 == 0) && (open_end_white_4 == 0)){
                    score -= 5;
                // open at one side
                }else{
                    score += CLOSED_FOUR_WEIGHT_W;
                }
            }
        }
    }

    // Check columns
    for (int j = 0; j < BOARD_SIZE; j++) {
        for (int i = 0; i <= BOARD_SIZE - 4; i++) {
            int count_white = 0;
            int count_black = 0;

            int open_start_black_3 = 1;
            int open_start_white_3 = 1;

            int open_end_black_3 = 1;
            int open_end_white_3 = 1;

            int open_start_black_4 = 1;
            int open_start_white_4 = 1;

            int open_end_black_4 = 1;
            int open_end_white_4 = 1;

            // check if we have fours/threes for both B/W
            if((board[i + 1][j] == WHITE) && (board[i + 2][j] == WHITE)){
                if((board[i][j] == WHITE) && (board[i + 3][j] == WHITE)){
                    count_white = 4;
                }else if (board[i][j] == WHITE){
                    count_white = 3;
                }
            }
            if((board[i + 1][j] == BLACK) && (board[i + 2][j] == BLACK)){
                if((board[i][j] == BLACK) && (board[i + 3][j] == BLACK)){
                    count_black = 4;
                }else if (board[i][j] == BLACK){
                    count_black = 3;
                }
            }

        //    // check for O O   O cases
           if((board[i][j] == WHITE) && (board[i + 1][j] == WHITE) && (board[i + 2][j] == EMPTY) && (board[i + 3][j] == WHITE)){
           	    count_white = 3;
                score -= 20;
           }
           if((board[i][j] == BLACK) && (board[i + 1][j] == BLACK) && (board[i + 2][j] == EMPTY) && (board[i + 3][j] == BLACK)){
                count_black = 3;
                score -= 20;
           }
           if((board[i][j] == WHITE) && (board[i + 1][j] == EMPTY) && (board[i + 2][j] == WHITE) && (board[i + 3][j] == WHITE)){
           	    count_white = 3;
                score -= 20;
           }
           if((board[i][j] == BLACK) && (board[i + 1][j] == EMPTY) && (board[i + 2][j] == BLACK) && (board[i + 3][j] == BLACK)){
                count_black = 3;
                score -= 20;
           }

            // determine if we have open at the top (3&4)
            if ((i > 0) && (board[i - 1][j] == BLACK)) {
                open_start_white_3 = 0;
                open_start_white_4 = 0;
            }
            if ((i > 0) && (board[i - 1][j] == WHITE)) {
                open_start_black_3 = 0;
                open_start_black_4 = 0;
            }

            if(count_black == 3 || count_white == 3){
                // determine if we have open at the bottom for 3
                if (((i + 3) < BOARD_SIZE) && (board[i + 3][j] == BLACK)) {
                    open_end_white_3 = 0;
                }
                if (((i + 3) < BOARD_SIZE) && (board[i + 3][j] == WHITE)) {
                    open_end_black_3 = 0;
                }
            }
            if(count_black == 4 || count_white == 4){
                // determine if we have open at the bottom for 4
                if (((i + 4) < BOARD_SIZE) && (board[i + 4][j] == BLACK)) {
                    open_end_white_4 = 0;
                }
                if (((i + 4) < BOARD_SIZE) && (board[i + 4][j] == WHITE)) {
                    open_end_black_4 = 0;
                }
            }

            // if we have three black in a row 
            if(count_black == 3){
                // fully open
                if(open_start_black_3 && open_end_black_3){
                    score -= OPEN_THREE_WEIGHT_B;
                // fully unopen
                }else if((open_start_black_3 == 0) && (open_end_black_3 == 0)){
                    score -= 0;
                // open at one side
                }else{
                    score -= CLOSED_THREE_WEIGHT_B;
                }
            }
            // if we have three white in a row
            if(count_white == 3){
                // fully open
                if(open_start_white_3 && open_end_white_3){
                    score += OPEN_THREE_WEIGHT_W;
                // fully unopen
                }else if((open_start_white_3 == 0) && (open_end_white_3 == 0)){
                    score -= 5;
                // open at one side
                }else{
                    score += CLOSED_THREE_WEIGHT_W;
                }
            }

            // if we have four black in a row 
            if(count_black == 4){
                // fully open
                if(open_start_black_4 && open_end_black_4){
                    score -= OPEN_FOUR_WEIGHT_B;
                // fully unopen
                }else if((open_start_black_4 == 0) && (open_end_black_4 == 0)){
                    score -= 0;
                // open at one side
                }else{
                    score -= CLOSED_FOUR_WEIGHT_B;
                }
            }
            // if we have four white in a row
            if(count_white == 4){
                // fully open
                if(open_start_white_4 && open_end_white_4){
                    score += OPEN_FOUR_WEIGHT_W;
                // fully unopen
                }else if((open_start_white_4 == 0) && (open_end_white_4 == 0)){
                    score -= 5;
                // open at one side
                }else{
                    score += CLOSED_FOUR_WEIGHT_W;
                }
            }
        }
    }

    // Check diagonals (top-left to bottom-right)
    for (int i = 0; i <= BOARD_SIZE - 4; i++) {
        for (int j = 0; j <= BOARD_SIZE - 4; j++) {
            int count_white = 0;
            int count_black = 0;

            int open_start_black_3 = 1;
            int open_start_white_3 = 1;

            int open_end_black_3 = 1;
            int open_end_white_3 = 1;

            int open_start_black_4 = 1;
            int open_start_white_4 = 1;

            int open_end_black_4 = 1;
            int open_end_white_4 = 1;

            // check if we have fours/threes for both B/W
            if((board[i + 1][j + 1] == WHITE) && (board[i + 2][j + 2] == WHITE)){
                if((board[i][j] == WHITE) && (board[i + 3][j + 3] == WHITE)){
                    count_white = 4;
                }else if (board[i][j] == WHITE){
                    count_white = 3;
                }
            }
            if((board[i + 1][j + 1] == BLACK) && (board[i + 2][j + 2] == BLACK)){
                if((board[i][j] == BLACK) && (board[i + 3][j + 3] == BLACK)){
                    count_black = 4;
                }else if (board[i][j] == BLACK){
                    count_black = 3;
                }
            }
        //    // check for O O   O cases
           if((board[i][j] == WHITE) && (board[i + 1][j + 1] == WHITE) && (board[i + 2][j + 2] == EMPTY) && (board[i + 3][j + 3] == WHITE)){
           	    count_white = 3;
                score -= 20;
           }
           if((board[i][j] == BLACK) && (board[i + 1][j + 1] == BLACK) && (board[i + 2][j + 2] == EMPTY) && (board[i + 3][j + 3] == BLACK)){
                count_black = 3;
                score -= 20;
           }
           if((board[i][j] == WHITE) && (board[i + 1][j + 1] == EMPTY) && (board[i + 2][j + 2] == WHITE) && (board[i + 3][j + 3] == WHITE)){
           	    count_white = 3;
                score -= 20;
           }
           if((board[i][j] == BLACK) && (board[i + 1][j + 1] == EMPTY) && (board[i + 2][j + 2] == BLACK) && (board[i + 3][j + 3] == BLACK)){
           	    count_black = 3;
                score -= 20;
           }

            // determine if we have open at the top-left (3&4)
            if ((i > 0) && (j > 0) && (board[i - 1][j - 1] == BLACK)) {
                open_start_white_3 = 0;
                open_start_white_4 = 0;
            }
            if ((i > 0) && (j > 0) && (board[i - 1][j - 1] == WHITE)) {
                open_start_black_3 = 0;
                open_start_black_4 = 0;
            }

            if(count_black == 3 || count_white == 3){
                // determine if we have open at the bottom-right for 3
                if (((i + 3) < BOARD_SIZE) && ((j + 3) < BOARD_SIZE) && (board[i + 3][j + 3] == BLACK)) {
                    open_end_white_3 = 0;
                }
                if (((i + 3) < BOARD_SIZE) && ((j + 3) < BOARD_SIZE) && (board[i + 3][j + 3] == WHITE)) {
                    open_end_black_3 = 0;
                }
            }
            if(count_black == 4 || count_white == 4){
                // determine if we have open at the bottom-right for 4
                if (((i + 4) < BOARD_SIZE) && ((j + 4) < BOARD_SIZE) && (board[i + 4][j + 4] == BLACK)) {
                    open_end_white_4 = 0;
                }
                if (((i + 4) < BOARD_SIZE) && ((j + 4) < BOARD_SIZE) && (board[i + 4][j + 4] == WHITE)) {
                    open_end_black_4 = 0;
                }
            }
            
            // if we have three black in a row 
            if(count_black == 3){
                // fully open
                if(open_start_black_3 && open_end_black_3){
                    score -= OPEN_THREE_WEIGHT_B;
                // fully unopen
                }else if((open_start_black_3 == 0) && (open_end_black_3 == 0)){
                    score -= 0;
                // open at one side
                }else{
                    score -= CLOSED_THREE_WEIGHT_B;
                }
            }
            // if we have three white in a row
            if(count_white == 3){
                // fully open
                if(open_start_white_3 && open_end_white_3){
                    score += OPEN_THREE_WEIGHT_W;
                // fully unopen
                }else if((open_start_white_3 == 0) && (open_end_white_3 == 0)){
                    score -= 5;
                // open at one side
                }else{
                    score += CLOSED_THREE_WEIGHT_W;                    
                }
            }

            // if we have four black in a row 
            if(count_black == 4){
                // fully open
                if(open_start_black_4 && open_end_black_4){
                    score -= OPEN_FOUR_WEIGHT_B;
                // fully unopen
                }else if((open_start_black_4 == 0) && (open_end_black_4 == 0)){
                    score -= 0;
                // open at one side
                }else{
                    score -= CLOSED_FOUR_WEIGHT_B;
                }
            }
            // if we have four white in a row
            if(count_white == 4){
                // fully open
                if(open_start_white_4 && open_end_white_4){
                    score += OPEN_FOUR_WEIGHT_W;
                // fully unopen
                }else if((open_start_white_4 == 0) && (open_end_white_4 == 0)){
                    score -= 5;
                // open at one side
                }else{
                    score += CLOSED_FOUR_WEIGHT_W;
                }
            }
        }
    }

    // Check diagonals (top-right to bottom-left)
    for (int i = 0; i <= BOARD_SIZE - 4; i++) {
        for (int j = 3; j < BOARD_SIZE; j++) {
            int count_white = 0;
            int count_black = 0;

            int open_start_black_3 = 1;
            int open_start_white_3 = 1;

            int open_end_black_3 = 1;
            int open_end_white_3 = 1;

            int open_start_black_4 = 1;
            int open_start_white_4 = 1;

            int open_end_black_4 = 1;
            int open_end_white_4 = 1;

            // check if we have fours/threes for both B/W
            if((board[i + 1][j - 1] == WHITE) && (board[i + 2][j - 2] == WHITE)){
                if((board[i][j] == WHITE) && (board[i + 3][j - 3] == WHITE)){
                    count_white = 4;
                }else if (board[i][j] == WHITE){
                    count_white = 3;
                }
            }
            if((board[i + 1][j - 1] == BLACK) && (board[i + 2][j - 2] == BLACK)){
                if((board[i][j] == BLACK) && (board[i + 3][j - 3] == BLACK)){
                    count_black = 4;
                }else if (board[i][j] == BLACK){
                    count_black = 3;
                }
            }

        //    // check for O O   O cases
           if((board[i][j] == WHITE) && (board[i + 1][j - 1] == WHITE) && (board[i + 2][j - 2] == EMPTY) && (board[i + 3][j - 3] == WHITE)){
           	    count_white = 3;
                score -= 20;
           }
           if((board[i][j] == BLACK) && (board[i + 1][j - 1] == BLACK) && (board[i + 2][j - 2] == EMPTY) && (board[i + 3][j - 3] == BLACK)){
           	    count_black = 3;
                score -= 20;
           }
           if((board[i][j] == WHITE) && (board[i + 1][j - 1] == EMPTY) && (board[i + 2][j - 2] == WHITE) && (board[i + 3][j - 3] == WHITE)){
           	    count_white = 3;
                score -= 20;
           }
           if((board[i][j] == BLACK) && (board[i + 1][j - 1] == EMPTY) && (board[i + 2][j - 2] == BLACK) && (board[i + 3][j - 3] == BLACK)){
           	    count_black = 3;
                score -= 20;
           }

            // determine if we have open at the top-right (3&4)
            if ((i > 0) && (j < (BOARD_SIZE - 1)) && (board[i - 1][j + 1] == BLACK)) {
                open_start_white_3 = 0;
                open_start_white_4 = 0;
            }
            if ((i > 0) && (j < (BOARD_SIZE - 1)) && (board[i - 1][j + 1] == WHITE)) {
                open_start_black_3 = 0;
                open_start_black_4 = 0;
            }
            if(count_black == 3 || count_white == 3){
                // determine if we have open at the bottom-left for 3
                if (((i + 3) < BOARD_SIZE) && ((j - 3) >= 0) && (board[i + 3][j - 3] == BLACK)) {
                    open_end_white_3 = 0;
                }
                if (((i + 3) < BOARD_SIZE) && ((j - 3) >= 0) && (board[i + 3][j - 3] == WHITE)) {
                    open_end_black_3 = 0;
                }
            }
            if(count_black == 4 || count_white == 4){
                // determine if we have open at the bottom-left for 4
                if (((i + 4) < BOARD_SIZE) && ((j - 4) >= 0) && (board[i + 4][j - 4] == BLACK)) {
                    open_end_white_4 = 0;
                }
                if (((i + 4) < BOARD_SIZE) && ((j - 4) >= 0) && (board[i + 4][j - 4] == WHITE)) {
                    open_end_black_4 = 0;
                }
            }
            
            // if we have three black in a row 
            if(count_black == 3){
                // fully open
                if(open_start_black_3 && open_end_black_3){
                    score -= OPEN_THREE_WEIGHT_B;
                // fully unopen
                }else if((open_start_black_3 == 0) && (open_end_black_3 == 0)){
                    score -= 0;
                // open at one side
                }else{
                    score -= CLOSED_THREE_WEIGHT_B;
                }
            }
            // if we have three white in a row
            if(count_white == 3){
                // fully open
                if(open_start_white_3 && open_end_white_3){
                    score += OPEN_THREE_WEIGHT_W;
                // fully unopen
                }else if((open_start_white_3 == 0) && (open_end_white_3 == 0)){
                    score -= 5;
                // open at one side
                }else{
                    score += CLOSED_THREE_WEIGHT_W;
                }
            }

            // if we have four black in a row 
            if(count_black == 4){
                // fully open
                if(open_start_black_4 && open_end_black_4){
                    score -= OPEN_FOUR_WEIGHT_B;
                // fully unopen
                }else if((open_start_black_4 == 0) && (open_end_black_4 == 0)){
                    score -= 0;
                // open at one side
                }else{
                    score -= CLOSED_FOUR_WEIGHT_B;
                }
            }
            // if we have four white in a row
            if(count_white == 4){
                // fully open
                if(open_start_white_4 && open_end_white_4){
                    score += OPEN_FOUR_WEIGHT_W;
                // fully unopen
                }else if((open_start_white_4 == 0) && (open_end_white_4 == 0)){
                    score -= 5;
                // open at one side
                }else{
                    score += CLOSED_FOUR_WEIGHT_W;
                }
            }
            
        }
    }
    
    return score;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 * Game logic for Human vs AI, Black for human, white for AI.
 * Almost same as game_keyboard, but after we place chess, AI will place.
 * Use minimax algorithm to place chess
 */
void game_ai(uint8_t keycode) {
    // starting position
    static int row = 8, col = 8; 
    // previous position
    static int prevRow = 8, prevCol = 8; 
    // game board for AI
    static int board[16][16] = {0}; 

    // Update the current position based on the keycode
    switch (keycode) {
        case 0x1A: // W
        case 0x52:
            if (row > 0) {
                prevRow = row;
                prevCol = col;
                row--;
            }
            break;
        case 0x16: // S
        case 0x51:
            if (row < 15) {
                prevRow = row;
                prevCol = col;
                row++;
            }
            break;
        case 0x04: // A
        case 0x50:
            if (col > 0) {
                prevRow = row;
                prevCol = col;
                col--;
            }
            break;
        case 0x07: // D
        case 0x4F:
            if (col < 15) {
                prevRow = row;
                prevCol = col;
                col++;
            }
            break;

        case 0x28: // enter
            if (hdmi_ctrl->VRAM[row * 16 + col] == 3) {
                // place human chess (black)
                hdmi_ctrl->VRAM[row * 16 + col] = BLACK;
                board[row][col] = BLACK;

                if (checkWin(row, col, BLACK) != 0) {
                    // perform any additional actions for game over
                    xil_printf("Human player wins!\n");
                    hdmi_ctrl->VRAM[264] = BLACK;
                    // clear board
                    for(int x = 0; x < 16; x++){
                        for(int y = 0; y < 16; y++){
                            board[x][y] = 0;
                        }
                    }
                    // sleep(1);
                    // reset flag
                    end_flag = 1;
                    return;
                } else {
                    // AI player's turn
                    int temp = ai_move(board);
                    if(temp == 3387){
                        return;
                    }
                    int temp_col = temp % 16;
                    int temp_row = temp / 16;

                    // Update both board with the AI player's move
                    hdmi_ctrl->VRAM[temp_row * 16 + temp_col] = WHITE;
                    board[temp_row][temp_col] = WHITE;
                }
            }
            break;
        default:
            break;
    }

    // remove highlighting
    if(hdmi_ctrl->VRAM[prevRow * 16 + prevCol] >= 3){
    	hdmi_ctrl->VRAM[prevRow * 16 + prevCol] -= 3;
    }
    // highlighting new position
    if (hdmi_ctrl->VRAM[row * 16 + col] < 3) {
        hdmi_ctrl->VRAM[row * 16 + col] += 3;
    }
}

// human vs ai for mouse
void game_ai_mouse(int Xdispl, int Ydispl, int mouse_clicked) {
    static int row = 8, col = 8; // starting position
    static int prevRow = 8, prevCol = 8; // previous position
    static int cursorX = 384, cursorY = 384; // initial cursor position (center of the board)
    // game board for AI
    static int board[16][16] = {0}; 
    // update the cursor position and decrease speed
    cursorX = cursorX + Xdispl;
    cursorY = cursorY + Ydispl;

    // set boundaries for cursor
    if (cursorX < 0){
    	cursorX = 0;
    }
    if (cursorX >= 768){
    	cursorX = 767;
    }
    if (cursorY < 0){
    	cursorY = 0;
    }
    if (cursorY >= 768){
    	cursorY = 767;
    }

    // Calculate the row and column based on the cursor position
    int newRow = cursorY / 48;
    int newCol = cursorX / 48;

    // Update the row and column if they have changed
    if (newRow != row || newCol != col) {
        prevRow = row;
        prevCol = col;
        row = newRow;
        col = newCol;

        // remove highlighting
        if (hdmi_ctrl->VRAM[prevRow * 16 + prevCol] >= 3) {
            hdmi_ctrl->VRAM[prevRow * 16 + prevCol] -= 3;
        }

        // highlighting new position
        if (hdmi_ctrl->VRAM[row * 16 + col] < 3) {
            hdmi_ctrl->VRAM[row * 16 + col] += 3;
        }
    }

    // check for mouse click
    if (mouse_clicked == 1) {
        if (hdmi_ctrl->VRAM[row * 16 + col] == 3) {
            // place the chess piece
            hdmi_ctrl->VRAM[row * 16 + col] = BLACK;
            board[row][col] = BLACK;
            // if some player wins
            if (checkWin(row, col, BLACK) != 0) {
                // clear board
                for(int x = 0; x < 16; x++){
                    for(int y = 0; y < 16; y++){
                        board[x][y] = 0;
                    }
                }
                hdmi_ctrl->VRAM[260] = 0;
                // sleep(1);
                // reset flag
                end_flag = 1;
            } else {
                // AI player's turn
                int temp = ai_move(board);
                int temp_col = temp % 16;
                int temp_row = temp / 16;

                // Update both board with the AI player's move
                hdmi_ctrl->VRAM[temp_row * 16 + temp_col] = WHITE;
                board[temp_row][temp_col] = WHITE;

            }
            hdmi_ctrl->VRAM[row * 16 + col] += 3;
        }
    }
}


