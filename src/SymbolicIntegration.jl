module SymbolicIntegration
    export(@mymacro)
    supp_operations = Set([:sin,:+,:*,:-,:/])
    supp_symbols = Set([:e])


    function verify_decl(xp)
        println("verify decl")
        try
            xp.head
        catch
            error("'$xp' is not in the proper form")
        end
        if xp.head != :call
            error("'$xp' is not in the proper form")
        elseif length(xp.args) != 2
            error("Expression '$xp' has $(length(xp.args) - 1) parameters. We do not current support above single variable. Try something like f(x)")
        elseif typeof(xp.args[1]) != Symbol
            error("Expression argument '1 : $(xp.args[1])' is not a Symbol")
        elseif  typeof(xp.args[2]) != Symbol
            error("Expression argument '2 : $(xp.args[1])' is not a Symbol")
        end
        return xp.args[2]
    end

    function verify_function(xp,var::Symbol)
        println("verify function")
        if (typeof(xp) <: Symbol)
            if (xp != var) && (!contains(==,supp_symbols,xp))
                error("Expression contains the symbol '$xp', which is not a supported constant or the current variable")
            end
        elseif !(typeof(xp) <: Number)
            if !(typeof(xp) <: Expr)
                error("Function result '$xp' not of type Expression or Number")
            elseif !contains(==,supp_operations,xp.args[1])
                error("Function '$(xp.args[1])' is not a currently supported function")
            elseif length(xp.args) < 2
                error("Function '$(xp.args[1])' has no arguments")
            end
            for i = 2:length(xp.args)
                verify_function(xp.args[i],var)
            end
        end
    end

    function verify(f)
        try
            if (f.head != :(=))
                error("Expression is not a function assignment. Is instead $(f.head)")
            elseif (length(f.args) != 2)
                error("Expression has arguments of length $(length(f.args)). Instead of 2")
            end
        catch
            error("Expression has no assignment/head. Try using an '='")
        end

        var = verify_decl(f.args[1])
        verify_function(f.args[2].args[2],var)
    end

    macro mymacro(n)
        verify(n)
    end

end # module
