supp_operations = Set([:sin,:+,:*,:-,:/])
supp_symbols = Set([:e])




"""
Checks if value is in current list of supported operations.
"""
function is_supported_operation(xp)
    return contains(==,supp_operations,xp)
end

"""
Checks if value is in current list of supported symbols.
"""
function is_supported_symbol(xp)
    return contains(==,supp_symbols,xp)
end

"""
Checks if value is in current list of supported symbols or operations.
"""
function is_supported(xp)
    return is_supported_symbol(xp) || is_supported_operation(xp);
end
