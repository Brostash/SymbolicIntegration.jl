using SymbolicIntegration
using Base.Test

for i in [:+,:-,:*,:/,:^,:cos,:sin,:tan]
    @test SymbolicIntegration.is_supported(i)
end

for i in [:%,:!,:csc,:cot,:sec]
    @test !SymbolicIntegration.is_supported(i)
end

@test SymbolicIntegration.is_supported(:e)
