
graph = {
    'A': [('B', 1), ('C', 4)],
    'B': [('D', 2), ('E', 5)],
    'C': [('F', 3)],
    'D': [('G', 3)],
    'E': [('G', 2)],
    'F': [('G', 2)],
    'G': []
}

h = {'A': 6, 'B': 5, 'C': 4, 'D': 3, 'E': 2, 'F': 2, 'G': 0}

open_list = [(h['A'], 0, 'A', ['A'])]
visited = set()

while open_list:
    open_list.sort()
    f, g, node, path = open_list.pop(0)

    if node == 'G':
        print("Path:", path)
        print("Cost:", g)
        break

    if node in visited:
        continue

    visited.add(node)

    for neighbor, cost in graph[node]:
        if neighbor not in visited:
            new_g = g + cost
            new_f = new_g + h[neighbor]
            open_list.append((new_f, new_g, neighbor, path + [neighbor]))
