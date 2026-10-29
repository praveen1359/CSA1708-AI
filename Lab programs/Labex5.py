
from collections import deque

def solve():
    start = (3, 3, 1)
    goal = (0, 0, 0)
    moves = [(1, 0), (2, 0), (0, 1), (0, 2), (1, 1)]
    queue = deque([(start, [start])])
    visited = {start}

    while queue:
        state, path = queue.popleft()
        m, c, boat = state

        if state == goal:
            print("Solution found:")
            for step in path:
                print(step)
            return

        for dm, dc in moves:
            if boat == 1:
                new_state = (m - dm, c - dc, 0)
            else:
                new_state = (m + dm, c + dc, 1)

            nm, nc, nb = new_state

            if 0 <= nm <= 3 and 0 <= nc <= 3:
                if (nm == 0 or nm >= nc) and (3 - nm == 0 or 3 - nm >= 3 - nc):
                    if new_state not in visited:
                        visited.add(new_state)
                        queue.append((new_state, path + [new_state]))

    print("No solution found")

solve()
