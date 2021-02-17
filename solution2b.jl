
infile = "input/input2.txt"
pwds = readlines(infile)

final = filter(pwds) do line
            idx1 = parse(Int,split(line, '-')[1])
            idx2 = parse(Int,split(split(line, '-')[2],' ')[1])
            char = split(line, ':')[1][end]

            pwd = strip(split(line, ':')[2], ' ')

            if pwd[idx1] == char
                if pwd[idx2] == char
                    return false
                end
                return true
            elseif pwd[idx2] == char
                return true
            else
                return false
            end
            
        end

print("Answer $(length(final))")