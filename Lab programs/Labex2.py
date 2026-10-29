
from collections import deque

def water_jug(capacity1, capacity2, target):
    visited = set()
    queue = deque([(0, 0, [])])

    while queue:
        x, y, path = queue.popleft()

        if (x, y) in visited:
            continue

        visited.add((x, y))
        path = path + [(x, y)]

        if x == target or y == target:
            print("Solution found:")
            for state in path:
                print(state)
            return

        next_states = [
            (capacity1, y),  # Fill jug 1
            (x, capacity2),  # Fill jug 2
            (0, y),          # Empty jug 1
            (x, 0),          # Empty jug 2
            (x - min(x, capacity2 - y), 
             y + min(x, capacity2 - y)),  # Pour jug 1 into jug 2
            (x + min(y, capacity1 - x), 
             y - min(y, capacity1 - x))   # Pour jug 2 into jug 1
        ]

        for state in next_states:
            if state not in visited:
                queue.append((state[0], state[1], path))

    print("No solution exists.")

# Main program
jug1 = 4
jug2 = 3
target = 2

water_jug(jug1, jug2, target)
