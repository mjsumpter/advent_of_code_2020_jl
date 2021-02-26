function count_chain(ads)
    nums = diff(ads)
    ones = count(m -> m == 1, nums)
    twos = count(n -> n == 3, nums)
    return ones*twos
end

# Solution 2 not my own...a learning experience
function tribonacci(n)
    n ≤ 1 && return 1
    n == 2 && return 2
    tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
end

input = parse.(Int, readlines("input/input10.txt")) |> sort
input = vcat(0, input, input[end] + 3)

println("Answer 1: $(count_chain(input))")

new_input = split(join(string.(diff(input))), '3', keepempty=false)
println("Answer 2: $(prod(tribonacci.(length.(new_input))))")