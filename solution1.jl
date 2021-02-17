using Combinatorics

function expense_calc(expense_file::String, num_of_nums::Int, sum_goal::Int=2020)::Int
    expenses = parse.(Int, readlines(expense_file))
    combos = collect(combinations(expenses, num_of_nums))
    chosen_expense = filter(x -> sum(x) == 2020, combos)[1]
    return prod(chosen_expense)
end

expense_file = "./input1.txt"
println("Answer 1: $(expense_calc(expense_file, 2))")
println("Answer 2: $(expense_calc(expense_file, 3))")