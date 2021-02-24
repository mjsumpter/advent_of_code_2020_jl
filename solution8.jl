using Pipe:@pipe

function find_loop(dirs, bool_repeat = false)
    acc = 0
    repeat = false
    i = 1
    while true
        inst, d, comp = dirs[i][1], dirs[i][2], dirs[i][3]

        if i == length(dirs)
            break
        end

        if comp == 1
            repeat = true
            break
        else
            dirs[i][3] = 1
        end
        if inst == "acc"
            acc += d
            i += 1
            continue
        elseif inst == "nop"
            i += 1
            continue
        else
            i += d
        end
    end
    
    bool_repeat ? repeat : println(acc)
end

function find_loop2(dirs) 
     jmps = []
     nops = []

     found = nothing

     for (i,x) in enumerate(dirs)
        if dirs[i][1] == "jmp"
            push!(jmps, i)
        elseif dirs[i][1] == "nop"
            push!(nops, i)
        end
     end

     for i in nops
        test = deepcopy(dirs)
        test[i][1] = "jmp"
        find_loop(test, true) ? continue : (found = i; break)
     end

     if found !== nothing
        dirs[found][1] = "jmp"
        find_loop(dirs)
        return
     end

     for i in jmps
        test = deepcopy(dirs)
        test[i][1] = "nop"
        find_loop(test, true) ? continue : (found = i; break)
     end
     
     if found !== nothing
        dirs[found][1] = "nop"
        find_loop(dirs)
        return
    else
        println("Uh Oh")
     end


 end


 dirs = @pipe ("input/input8.txt" |> readlines |> map(x -> split(x, " "),_ ) 
 |> [[x[1], parse(Int, x[2]), 0] for x in _  ])


find_loop(deepcopy(dirs))

find_loop2(deepcopy(dirs))