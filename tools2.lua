-- tools tab
setDefaultTab("Others")

function getFirstNumberInText(text)
    local n = nil
    if string.match(text, "%d+") then n = tonumber(string.match(text, "%d+")) end
    return n
end

local toSay = '';

onTalk(function(name, level, mode, text, channelId, pos)
    if name ~= 'Dederin' then return; end

    if text:lower():find('caso tenha') then
        toSay = getFirstNumberInText(text)
    end
end);

macro(100, "ASD", function()
    local findNpc = getCreatureByName('Dederin');
    if findNpc and getDistanceBetween(pos(), findNpc:getPosition()) <= 3 then
        say('hi')
        delay(1000)
        say('new city')
        delay(1000)
        if toSay ~= '' then
            NPC.say(toSay)
            toSay = '';
        end
    end
end);





