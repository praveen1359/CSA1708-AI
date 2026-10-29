
from itertools import permutations

cost = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

n = len(cost)
cities = list(range(1, n))
min_cost = float('inf')
best_path = []

for path in permutations(cities):
    route = [0] + list(path) + [0]
    total = 0

    for i in range(len(route) - 1):
        total += cost[route[i]][route[i + 1]]

    if total < min_cost:
        min_cost = total
        best_path = route

print("Shortest path:", best_path)
print("Minimum cost:", min_cost)
