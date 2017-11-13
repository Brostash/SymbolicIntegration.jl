using SymbolicIntegration
using Base.Test

@test SymbolicIntegration.is_supported(:+) == true
