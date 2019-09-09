export fibonacciRecursive

function fibonacciRecursive(count::Int)::BigInt
    return calculate(count, 1, BigInt(1), BigInt(0))
end

function calculate(count::Int, current::Int, currentValue::BigInt, previusValue::BigInt)::BigInt

local result::BigInt = currentValue + previusValue

current += 1

if count == current
    return result
else
    return calculate(count, current, result, currentValue)
end

end
