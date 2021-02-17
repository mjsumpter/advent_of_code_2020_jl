lines = readlines("input/input3.txt")

function count_trees(line)
    
    slope_x = line[1]
    slope_y = line[2]

    x = 1
    trees = 0

    
    for (idx, line) in enumerate(lines)

        if slope_y % 2 == 0 && idx % 2 == 0
            continue
        end

        if line[x] == '#'
            trees += 1
        end
        x += slope_x
        if x ≥ 32
            x = (x % 32) + 1
        end
    end

    return trees

end

slope_list = [
    [1,1],
    [3,1],
    [5,1],
    [7,1],
    [1,2]
]

tree_counts = map(count_trees, slope_list)

println("Final Answer: $(prod(tree_counts))")