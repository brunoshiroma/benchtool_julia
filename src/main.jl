println("INIT")
push!(LOAD_PATH, "$(homedir())/wordspace/benchtool_julia")

include("module.jl")

loopCount = Int(10)::Int

if length(ARGS) > 0
    loopCount = Int( parse(Int, ARGS[1]))
end

println(@time benchtool_julia.fibonacciLoop(loopCount))
