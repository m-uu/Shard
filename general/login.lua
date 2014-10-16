disable_for_gms = 1

local function languagefix (event, player)
	player:RemoveSpell(668, player)
	player:LearnSpell(668, player)
end

local function multiboxing (event, player)
	for k, v in ipairs(GetPlayersInWorld()) do
		if(v:GetPlayerIP() == player:GetPlayerIP()) then -- check areas so we wont spam to the whole world
			if (v:GetName()~=player:GetName()) then
				if v:IsGM() and (disable_for_gms==1) then
					player:SendBroadcastMessage("GM detected. Multibox prevention disabled.")
					v:SendBroadcastMessage("GM detected. Multibox prevention disabled.")
				else
					SendWorldMessage("[Security]: |cffff0000Automatically kicked characters '"..v:GetName().."' and '"..player:GetName().."' for multiboxing.|r")
					v:KickPlayer()
					player:KickPlayer()
				end
			end
		end
	end
end

RegisterPlayerEvent(3, languagefix)
RegisterPlayerEvent(3, multiboxing)
RegisterPlayerEvent(27, languagefix)