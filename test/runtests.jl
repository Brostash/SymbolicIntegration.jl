using SymbolicIntegration
using Base.Test

# write your own tests here
@testset "TestSet" begin
    include("supported_functions_tests.jl")
    include("verification_tests.jl")
end
