push!(LOAD_PATH, "$(homedir())/wordspace/benchtool_julia")

include("module.jl")

loopCount = Int(10)::Int
benchType = Int(1)::Int
repeatCount = Int(5)::Int
global totalMs = Int(0)::Int
global lastResult = BigInt(0)::BigInt
global count = Int(0)::Int

if length(ARGS) >= 2
    loopCount = Int( parse(Int, ARGS[2]))
    benchType = Int( parse(Int, ARGS[1]))
    if length(ARGS) >= 3
        repeatCount = Int( parse(Int, ARGS[3]))
    end
else
    println("usage julia src/main.jl 1 10 [5]")
    exit(1)
end

results = Array{Tuple{BigInt, Int}}(undef, 0)

for i = 1:repeatCount

    if benchType == 1
        execTime = @timed result = benchtool_julia.fibonacciLoop(loopCount)
        push!(results, (execTime[1], trunc(Int, execTime[2] * 1000 )))
    elseif benchType == 2
        execTime = @timed benchtool_julia.fibonacciRecursive(loopCount)
        push!(results, (execTime[1], trunc(Int, execTime[2] * 1000)))
    end
end

foreach( function(result::Tuple{BigInt, Int})
    if count > 0
        if lastResult != result[1]
            throw("Results dont match")
        end
    end
    global totalMs += result[2]
    global lastResult = result[1]
    global count += 1
end
, results)

meanMs = trunc(Int, totalMs / repeatCount)

print("$meanMs $lastResult")
