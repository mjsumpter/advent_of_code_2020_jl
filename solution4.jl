text = open(f ->read(f, String), "input/input4.txt")

passports = split(text, "\n\n")

function valid_passports(text)

    count = 0

    for passport in passports
        entries = split(passport, (' ', '\n'))
        tags = map(x -> split(x,':')[1], entries)

        if length(tags) == 8
            count += 1
        elseif length(tags) == 7
            if "cid" ∉ tags
                count += 1
            end
        end
    end
    return count
end

function valid_passports2(text)

    count = 0

    for passport in passports
        test = nothing
        test2 = nothing
        entries = split(passport, (' ', '\n'))
        filter!(e->e!="", entries)
        #println(entries)
        tags = Dict(map(x -> split(x,':'), entries))

        if length(tags) < 7
            continue
        end
        if length(tags) == 7
            if "cid" in keys(tags)
                continue
            end
        end
        
        if length(tags["byr"]) != 4 || !(1920 ≤ parse(Int,tags["byr"]) ≤ 2002)
            continue
        end
        if length(tags["iyr"]) != 4 || !(2010 ≤ parse(Int,tags["iyr"]) ≤ 2020)
            continue
        end
        if length(tags["eyr"]) != 4 || !(2020 ≤ parse(Int,tags["eyr"]) ≤ 2030)
            continue
        end
        unit = length(tags["hgt"]) > 2 ? SubString(tags["hgt"], length(tags["hgt"])-1, length(tags["hgt"])) : false
        if unit == false || unit ∉ ["cm", "in"]
            continue
        else
            num = parse(Int,SubString(tags["hgt"], 1, length(tags["hgt"])-2))
            if (unit == "cm" && !(150 ≤ num ≤ 193))
                continue
            elseif (unit == "in" && !(59 ≤ num ≤ 76))
                continue
            end
        end
        test2 = tags["hcl"]
        col = SubString(tags["hcl"], 2, length(tags["hcl"]))
        test = tags["hcl"]
        if tags["hcl"][1] != '#' || length(col) != 6 || (6 != length(filter( x-> (x isa Number || x isa Char) , col)))
            continue
        end
        if tags["ecl"] ∉ ["amb","blu","brn","gry","grn", "hzl", "oth"]
            continue
        end
        try
            if length(tags["pid"]) != 9 || (9 != length(filter(x -> parse(Int,x) isa Number, tags["pid"])))
                continue
            end
        catch
            continue
        end
            

        count += 1
    end
    return count
end

println("Answer1: $(valid_passports(passports))")
println("Answer2: $(valid_passports2(passports))")