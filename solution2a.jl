
infile = "input/input2.txt"
pwds = readlines(infile)

final = filter(pwds) do line
            min = parse(Int,split(line, '-')[1])
            max = parse(Int,split(split(line, '-')[2],' ')[1])
            char = split(line, ':')[1][end]
            count = 0
            pwd = strip(split(line, ':')[2], ' ')

            for c in pwd
                if char == c
                    count += 1
                end
            end
            
            if min ≤ count ≤ max
                return true
            else
                return false
            end

        end

print("Answer $(length(final))")