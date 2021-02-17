function index(x)
    x + 1
end

function map_seat(str)

    rows = 0:127
    columns = 0:8

    for i in 1:7
        rows = str[i] == 'F' ? rows[1:length(rows) ÷ 2] : rows[length(rows) ÷ 2 + 1:end]
    end

    for i in 8:10
        columns = str[i] == 'L' ? columns[1:length(columns) ÷ 2] : columns[length(columns) ÷ 2 + 1:end]
    end

    return rows[1] * 8 + columns[1]
end

function find_missing_id(ids)
    sorted_ids = sort(ids)
    for i ∈ 1:length(sorted_ids) - 1
        if sorted_ids[i] + 1 ≠ sorted_ids[i + 1]
            return sorted_ids[i] + 1
        end
    end
end

seats = readlines("input/input5.txt")
seat_ids = map(map_seat, seats)

println("Answer 1: $(maximum(seat_ids))")
println("Answer 2: $(find_missing_id(seat_ids))")