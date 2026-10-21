
import heapq

# Goal state
GOAL = (1, 2, 3,
        4, 5, 6,
        7, 8, 0)

# Manhattan distance heuristic
def heuristic(state):
    distance = 0

    for i, tile in enumerate(state):
        if tile != 0:
            goal_index = GOAL.index(tile)

            x1, y1 = divmod(i, 3)
            x2, y2 = divmod(goal_index, 3)

            distance += abs(x1 - x2) + abs(y1 - y2)

    return distance


# Generate possible next states
def get_neighbors(state):
    neighbors = []
    zero = state.index(0)
    row, col = divmod(zero, 3)

    moves = [
        (-1, 0),  # Up
        (1, 0),   # Down
        (0, -1),  # Left
        (0, 1)    # Right
    ]

    for dr, dc in moves:
        new_row = row + dr
        new_col = col + dc

        if 0 <= new_row < 3 and 0 <= new_col < 3:
            new_pos = new_row * 3 + new_col

            new_state = list(state)
            new_state[zero], new_state[new_pos] = (
                new_state[new_pos], new_state[zero]
            )

            neighbors.append(tuple(new_state))

    return neighbors


# Check whether the puzzle is solvable
def is_solvable(state):
    tiles = [x for x in state if x != 0]
    inversions = 0

    for i in range(len(tiles)):
        for j in range(i + 1, len(tiles)):
            if tiles[i] > tiles[j]:
                inversions += 1

    return inversions % 2 == 0


# A* search algorithm
def solve(start):
    if not is_solvable(start):
        print("Puzzle is not solvable.")
        return

    pq = []
    heapq.heappush(pq, (heuristic(start), 0, start))

    parent = {start: None}
    cost = {start: 0}

    while pq:
        f, g, current = heapq.heappop(pq)

        if current == GOAL:
            path = []
            while current is not None:
                path.append(current)
                current = parent[current]

            path.reverse()

            print("Solution found!")
            print("Number of moves:", len(path) - 1)

            for step, state in enumerate(path):
                print(f"\nStep {step}:")
                for i in range(0, 9, 3):
                    print(state[i:i + 3])

            return

        if g != cost[current]:
            continue

        for neighbor in get_neighbors(current):
            new_cost = g + 1

            if neighbor not in cost or new_cost < cost[neighbor]:
                cost[neighbor] = new_cost
                parent[neighbor] = current

                priority = new_cost + heuristic(neighbor)
                heapq.heappush(
                    pq, (priority, new_cost, neighbor)
                )

    print("No solution found.")


# Main program
print("Enter the initial state (use 0 for the blank):")
start = tuple(map(int, input().split()))

if len(start) != 9 or set(start) != set(range(9)):
    print("Invalid input! Enter each number from 0 to 8 exactly once.")
else:
    solve(start)
