rules = Dict(
    [match(r"(\w+ \w+) bags contain", line).captures[1] => Dict(
      [m.captures[2] => parse(Int, m.captures[1])
        for m in eachmatch(r"(\d+) (\w+ \w+)", line)
      ])
      for line in eachline("./input/input7.txt")
    ])
  
  function addcontainersof!(containers, bag)
    for (color, contents) in rules
      if !in(containers, color) && haskey(contents, bag)
        push!(containers, color)
        addcontainersof!(containers, color)
      end
    end
    containers
  end
  
  length(addcontainersof!(Set(), "shiny gold")) |> println
  
  function contains(bag, multiplier)::Int
    multiplier * (1 + sum([contains(color, count) for (color, count) in rules[bag]]))
  end
  
  contains("shiny gold", 1) - 1 |> println