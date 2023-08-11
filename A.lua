if Fluxus and not delta then
    print("F X")
end
if delta then
    local AntiCrackTool = 0;
    local RS = ""
    while true do 
        if AntiCrackTool > 500 then
            break
        end
        if AntiCrackTool == 89 then
            RS = tostring(function()
            end)
        end
        tostring(function()
        end)
        AntiCrackTool = AntiCrackTool + 1
    end
    local FunctionList = {
        {
            f = pcall,
            r = "missing argument #1",
            c = true,
            s = false
        },
        {
            f = xpcall,
            r = "attempt to call a boolean value",
            c = true,
            s = false
        },
        {
            f = request,
            r = 'invalid argument #1 (Expected Table)',
            c = true,
            s = false
        },
        {
            f = game:GetService("RbxAnalyticsService").GetClientId,
            r = "Expected ':' not '.' calling member function GetClientId",
            c = true,
            s = false
        },
        {
            f = getconstants,
            r = 'attempt to call a table value',
            c = true,
            s = false
        },
        {
            f = Random,
            r = 'attempt to call a table value',
            c = true,
            s = false,           
        },
        {
            f = Random.new,
            r = 'attempt to call a Random value',
            c = true,
            s = false,
            a = {
                1
            }
        },
        {
            f = string.byte,
            r = "missing argument #1 to 'byte' (string expected)",
            c = true,
            s = false
        },
        {
            f = string.sub,
            r = "missing argument #1 to 'sub' (string expected)",
            c = true,
            s = false
        },
        {
            f = string.gsub,
            r = "missing argument #1 to 'gsub' (string expected)",
            c = true,
            s = false
        },
        {
            f = function()
            end,
            r = nil,
            c = false,
            s = true
        },
        {
            f = function()
                return RS
            end,
            r = RS,
            c = false,
            s = true
        },
        {
            f = function()
                return false
            end,
            r = false,
            c = false,
            s = true
        },
        {
            f = function()
                return true
            end,
            r = true,
            c = false,
            s = true
        }
    } 
    local FunctionIncrement = 1;
    local LocalEnv = getfenv()
    local allChecksPassed = false; 
    while true do 
        if not FunctionList[FunctionIncrement] and (FunctionIncrement == #FunctionList + 1) then 
            allChecksPassed = true
            break;
        end
        local Function = FunctionList[FunctionIncrement]["f"]
        local Return = FunctionList[FunctionIncrement]["r"]
        local toBeCalled = FunctionList[FunctionIncrement]["c"]
        local willBeSuccessful = FunctionList[FunctionIncrement]["s"]
        local Args = FunctionList[FunctionIncrement]["a"]
        if Args then
            local functionCalled = false;
            setfenv(0, {
                tostring = function()
                    print(1)
                end
            })
            xpcall(Function(unpack(Args)), function(s)
                functionCalled = true
                if s and s ~= Return then 
                    print(s)
                    print(Return)
                end
            end)
            setfenv(0, LocalEnv)
            if not functionCalled and toBeCalled then 
                while true do end
            end
            functionCalled = false
            setfenv(0, {
                tostring = function()
                    print(2)
                end
            })
            local Success, Data = pcall(Function(unpack(Args))) 
            if (not willBeSuccessful == Success) or willBeSuccessful ~= Success then
                while true do end
            end
            setfenv(0, LocalEnv)
            if Data ~= Return then
                print(Data)
                print(Return)
            end
        else
            local functionCalled = false;
            setfenv(0, {
                tostring = function()
                    print(3)
                end
            })
            xpcall(Function, function(s)
                functionCalled = true
                if s and s ~= Return then
                    print(s)
                    print(Return)
                end
            end)
            setfenv(0, LocalEnv)
            if not functionCalled and toBeCalled then
                print(functionCalled)
            end
            functionCalled = false
            setfenv(0, {
                tostring = function()
                    print(4)
                end
            })
            local Success, Data = pcall(Function)
            if (not willBeSuccessful == Success) or willBeSuccessful ~= Success then
                print(5)
            end
            setfenv(0, LocalEnv)
            if Data ~= Return then
                print(Data)
                print(Return)
            end
        end
        FunctionIncrement = FunctionIncrement + 1
    end
end
print("Delta X")
