function alpha_int(alph::Char)
    return (Int(alph) % Int('a')) + 1
end

function mapper(alph)

end

function main()

    input = readlines("input/input6.txt")

    groups = []
    a_counter = round.(Int,zeros(1,26))
    for line in input
        
        if line != ""
            nums = map(alpha_int, collect(line))
            for num in nums
                a_counter[num] = a_counter[num] == 1 ? a_counter[num] : a_counter[num] + 1
            end
        else
            push!(groups, sum(a_counter))
            a_counter = round.(Int,zeros(1,26))
        end
    end
    push!(groups, sum(a_counter))
    println("Answer 1: $(sum(groups))")

end

function main2()

    input = readlines("input/input6.txt")

    groups = []
    a_counter = round.(Int,zeros(1,26))
    counter = 0

    for line in input
        if line != ""
            counter += 1
            nums = map(alpha_int, collect(line))
            for num in nums
                a_counter[num] += 1
            end
        else
            push!(groups, length(filter(x -> x == counter, a_counter)))
            a_counter = round.(Int,zeros(1,26))
            counter = 0
        end
    end
    push!(groups, length(filter(x -> x == counter, a_counter)))
    println("Answer2: $(sum(groups))")

end

main()
main2()