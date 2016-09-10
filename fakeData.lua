--
-- Global Lua definitions
------------------------------------------------------------
--
math.randomseed( os.time() * os.time() )
--
-- Number Rounding
function round(val, decimal)
    local exp = decimal and 10^decimal or 1
    return math.ceil(val * exp - 0.5) / exp
end
--
-- Gaussian Random Number (Box-Muller)
function gaussian()
    local S,v1,v2,x = 0,0,0,0
    while S>=1 or S==0 do
        v1 = 2*math.random() - 1
        v2 = 2*math.random() - 1
        S = v1*v1 + v2*v2
    end
    --x = v2 * math.sqrt(-2*math.log(S)/S)
    y = v1 * math.sqrt(-2*math.log(S)/S)
    return y
end
--
-- Random Value
-- 2\pi\sqrt{\frac{l}{g\cos(\theta/2)}}
function printPeriod(length,angle,sigma)
    period = 2 * math.pi * math.sqrt(length / (9.80665 * math.cos(math.pi*angle/360) ) )
    var = sigma*gaussian() / period
    return tex.print( string.format("%0.2f", round(period + var,2)) )
end
--
-- End Of File
--
