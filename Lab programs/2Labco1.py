
N = 8

def print_solution(board):
    for row in board:
        print(" ".join("Q" if cell else "." for cell in row))

def is_safe(board, row, col):
    # Check the same column in previous rows
    for i in range(row):
        if board[i][col] == 1:
            return False

    # Check upper-left diagonal
    i, j = row - 1, col - 1
    while i >= 0 and j >= 0:
        if board[i][j] == 1:
            return False
        i -= 1
        j -= 1

    # Check upper-right diagonal
    i, j = row - 1, col + 1
    while i >= 0 and j < N:
        if board[i][j] == 1:
            return False
        i -= 1
        j += 1

    return True

def solve_queens(board, row):
    # All 8 queens have been placed
    if row == N:
        return True

    # Try placing a queen in each column
    for col in range(N):
        if is_safe(board, row, col):
            board[row][col] = 1

            if solve_queens(board, row + 1):
                return True

            # Backtrack
            board[row][col] = 0

    return False

# Main program
board = [[0 for _ in range(N)] for _ in range(N)]

if solve_queens(board, 0):
    print("Solution to the 8-Queen problem:")
    print_solution(board)
else:
    print("No solution exists.")
