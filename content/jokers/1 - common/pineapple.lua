SMODS.Joker{ -- Pineapple implementation.
	key = 'pineapple',
	config = { extra = {
		xmult = 3,
		mult = 30,
		mult_loss = 5
	}},
	atlas = 'Jokers',
	pos = {x = 4, y = 0},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 1,
	cost = 2,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		if PSI.get_gameset().unfiltered then
			return {key = self.key .. "_unfiltered", vars = {card.ability.extra.xmult}}
		else
			return {key = self.key .. "_upgraded", vars = {card.ability.extra.mult, card.ability.extra.mult_loss}}
		end
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if PSI.get_gameset().unfiltered then
				return {
					xmult = card.ability.extra.xmult
				}
			else
				return {
					mult = card.ability.extra.mult
				}
			end
        elseif context.end_of_round then
			if PSI.get_gameset().unfiltered and not context.game_over then
				G.PROFILES[G.SETTINGS.profile].pineappledeath = true
				check_for_unlock({type = 'deathbypineapple'})
            	G.STATE = G.STATES.GAME_OVER
            	G.STATE_COMPLETE = false
			elseif context.cardarea == G.jokers then
				card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
				if card.ability.extra.mult <= 0 then
					PSI.consumefood(card)
        	   		return {
        	   		    message = localize('k_eaten_ex'),
        	   		    colour = G.C.ATTENTION
        	   		}
				end
        	end
        end
	end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
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
local effectcalc = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
	if (key == 'x_mult' or key == 'xmult' or key == 'Xmult' or key == 'x_mult_mod' or key == 'Xmult_mod') and amount ~= 1 and next(SMODS.find_card("j_para_pineapple")) and PSI.get_gameset().upgraded then
		return true
	end
	return effectcalc(effect, scored_card, key, amount, from_edition)
end