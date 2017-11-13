__precompile__()

module SymbolicIntegration

    export @symbol
# The main module file is for outlining the structure of the package.
# At the top of your package module, you should import your dependencies:

    include("operations_and_constants.jl")
    include("verification.jl")
    include("symbol.jl")

end # module
