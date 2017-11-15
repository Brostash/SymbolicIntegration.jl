immutable SymbolicFunction
    simple::Bool
    val::Int64

    constant::Bool
    factor::Nullable{SymbolicFunction}

    func::Nullable{Symbol}
    args::Nullable{Array{SymbolicFunction,1}}
    variable::Nullable{Symbol}

    SymbolicFunction(a::Bool, b::Number, c::Bool, d::Nullable, e::Nullable, f::Nullable{Array{SymbolicFunction,1}}, g::Nullable) = new(a,b,c,d,e,f,g)
    function SymbolicFunction{T<:Number}(ex::T)
        SymbolicFunction(true,ex,true,Nullable{SymbolicFunction}(),Nullable{Symbol}(),Nullable{Array{SymbolicFunction,1}}(),Nullable{Symbol}())
    end
end
