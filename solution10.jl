function count_chain(ads)
    sort!(ads)

    nums = [ads[1]]

    for (i,x) in enumerate(ads)
        if i == length(ads)
            push!(nums, 3)
        else
            push!(nums, ads[i+1] - ads[i])
        end
    end
    ones = count(m -> m == 1, nums)
    twos = count(n -> n == 3, nums)
    return ones*twos
end

input = parse.(Int, readlines("input/input10.txt"))

println("Answer 1: $(count_chain(input))")