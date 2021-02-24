using Combinatorics
using Pipe:@pipe

function find_first_invalid(nums)
    i = 1
    acceptable = nums[i:24+i]

    found = false

    while !found
        combos = collect(combinations(acceptable,2))
        num_interest = nums[25+i]

        if num_interest in map(x -> sum(x), combos)
            i += 1
            acceptable = nums[i:24+i]
            continue
        else
            return num_interest
        end
    end

    
end

function find_contiguous(nums, num)
    beg_i = 1
    end_i = copy(beg_i)
    count = 0

    while true
        sum_i = sum(nums[beg_i:end_i])
        if sum_i == num
            return (nums[beg_i] + nums[end_i])
        elseif sum_i < num
            end_i += 1
            continue
        else
            beg_i += 1
            end_i = copy(beg_i)
            continue
        end
    end

end

input = @pipe readlines("input/input9.txt") |> map(x -> parse(Int,x), _)

num = find_first_invalid(input)
println("Part 1: $num")

sum_num = find_contiguous(input, num)
println("Part 2: $sum_num")