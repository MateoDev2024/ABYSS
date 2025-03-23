local Safeguard = {}

function Safeguard.SafeWrap(Func)
    if type(Func) ~= "function" then return false, "Invalid function argument." end
    local Success, Error = pcall(Func)
    return Success, Error
end

function Safeguard.SafeDefine(Name, Value)
    if type(Name) ~= "string" or Name == "" then return false, "Invalid variable name." end
    rawset(_G, Name, Value)
    return true
end

function Safeguard.SafeCall(Func, ...)
    if type(Func) ~= "function" then return false, "Invalid function argument." end
    local Arguments = { pcall(Func, ...) }
    local Success = table.remove(Arguments, 1)
    return Success, table.unpack(Arguments)
end

function Safeguard.SafeGet(Name)
    if type(Name) ~= "string" then return nil end
    return rawget(_G, Name)
end

return Safeguard
