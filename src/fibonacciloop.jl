export fibonacciLoop

function fibonacciLoop(loopCount::Int)::BigInt
    local current = BigInt(0)::BigInt
    local next = BigInt(1)::BigInt
    local result = BigInt(0)::BigInt

    for i = 1:loopCount-1
        result = current + next
        current = next
        next = result
    end

    return result
end
