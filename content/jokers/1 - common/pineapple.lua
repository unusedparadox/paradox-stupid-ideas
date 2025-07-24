SMODS.Joker{ -- Pineapple implementation.
	key = 'pineapple',
	config = { extra = {
		xmult = 3
	}
	},
	atlas = 'Jokers',
	pos = {x = 4, y = 0},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 1,
	cost = 2,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
        elseif context.end_of_round and not context.game_over then
			G.PROFILES[G.SETTINGS.profile].pineappledeath = true
			check_for_unlock({type = 'deathbypineapple'})
            G.STATE = G.STATES.GAME_OVER
            G.STATE_COMPLETE = false
        end
	end
}
local para_jimbotalk_old = Card_Character.add_speech_bubble
Card_Character.add_speech_bubble = function(self, arg1, arg2, arg3)
	if G.PROFILES[G.SETTINGS.profile].pineappledeath then
		para_jimbotalk_old(self, 'pineapple', nil, {quip = true})
	else
		para_jimbotalk_old(self, arg1, arg2, arg3)
	end
end
-- Hooking new runs
local para_newrun_old = Game.start_run
Game.start_run = function(self, ...)
 	G.PROFILES[G.SETTINGS.profile].pineappledeath = false
 	return para_newrun_old(self, ...)
end
-- Hooking run loss
local para_youlost_old = Game.update_game_over
Game.update_game_over = function(self, dt)
	if not G.STATE_COMPLETE then
		para_youlost_old(self, dt)
		if G.PROFILES[G.SETTINGS.profile].pineappledeath and G.GAME.round_resets.ante > G.GAME.win_ante then
    	    local Jimbo = nil
    	    G.E_MANAGER:add_event(Event({
    	        trigger = 'after',
    	        delay = 2.5,
    	        blocking = false,
    	        func = (function()
    	            if G.OVERLAY_MENU and G.OVERLAY_MENU:get_UIE_by_ID('jimbo_spot') then 
    	                Jimbo = Card_Character({x = 0, y = 5})
    	                local spot = G.OVERLAY_MENU:get_UIE_by_ID('jimbo_spot')
    	                spot.config.object:remove()
    	                spot.config.object = Jimbo
    	                Jimbo.ui_object_updated = true
    	                para_jimbotalk_old(Jimbo, 'pineapple', nil, {quip = true})
    	                Jimbo:say_stuff(5)
    	                end
    	            return true
            	end)
        	}))
		end
		G.STATE_COMPLETE = true
	end
end