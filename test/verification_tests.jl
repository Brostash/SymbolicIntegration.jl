using SymbolicIntegration
using Base.Test

@test (@symbol f(x) = x^x + 4*5)
@test (@symbol f(x) = 1)
@test (@symbol f(x) = e)
@test (@symbol f(x) = sin(e))
@test (@symbol f(y) = cos(y)*2)
