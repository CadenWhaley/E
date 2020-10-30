local discordia = require('discordia')
local client = discordia.Client()
local E = io.open("Test.lua"):read()
local tk = 'NzcxNDY0MjQ0MzQzODY1Mzc2.X5sgEA.3_xGyXHsbcCXmIRUzg0Gk2tMOFc'
local pf = '!'

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)


client:on('messageCreate', function(message)
	local content = message.content
    local member = message.member
	local memberid = message.member.id
	
    if content:lower():sub(1,#"!gay") == "!gay" then
        local mentioned = message.mentionedUsers
        if #mentioned == 1 then
            local member = message.guild:getMember(mentioned[1][1])
            message:reply{
                embed = {
                    fields = {
                        {name = "Gay Detected"; value = member.username.." is "..math.random(1,100).."% Gay!"}
                    };
                    color = discordia.Color.fromRGB(255,0,0).value;
                };
            }
        elseif #mentioned == 0 then
            message:reply{
                embed = {
                    fields = {
                        {name = "Gay Detected"; value = message.member.username.." is "..math.random(1,100).."% Gay!"}
                    };
                    color = discordia.Color.fromRGB(255,0,0).value;
                };
            }
        end
    end
end)

client:run("Bot "..tk)