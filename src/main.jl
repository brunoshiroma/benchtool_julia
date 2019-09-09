push!(LOAD_PATH, "$(homedir())/wordspace/benchtool_julia")

include("module.jl")

loopCount = Int(10)::Int
benchType = Int(1)::Int

if length(ARGS) >= 2
    loopCount = Int( parse(Int, ARGS[2]))
    benchType = Int( parse(Int, ARGS[1]))
else
    println("usage julia src/main.jl 1 10")
    exit(1)
end

if benchType == 1
println(@time benchtool_julia.fibonacciLoop(loopCount))
elseif benchType == 2
println(@time benchtool_julia.fibonacciRecursive(loopCount))
end
