local para_cost, para_rarity
if PSI.get_gameset().unfiltered then
	para_cost = 10
	para_rarity = "para_prestige"
else
	para_cost = 5
	para_rarity = 2
end
SMODS.Joker{ -- no way thats me
	key = 'paradox',
	atlas = 'Jokers_Soul',
	pos = {x = 0, y = 0},
	soul_pos = {x = 0, y = 1},
	cost = para_cost,
	rarity = para_rarity,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		if PSI.get_gameset().unfiltered then
        	return {key = self.key .. "_unfiltered", vars = {colours = {HEX("2dcddd"), HEX("262680")}}}
		else
			return {key = self.key .. "_upgraded"}
		end
	end,
	calculate = function(self,card,context)
		if context.ending_shop and PSI.get_gameset().unfiltered then
			SMODS.add_card({set = "parajoker", edition = "e_negative", key_append = "para_paradox_joker"})
		elseif context.using_consumeable and context.consumeable.ability.set == "Tarot" and PSI.get_gameset().upgraded and G.hand and #G.hand.cards > 0 then
        	local percent = 1.15 - (1 - 0.999) / (#G.hand.cards - 0.998) * 0.3
        	G.E_MANAGER:add_event(Event({
        	    trigger = 'after',
        	    delay = 0.15,
        	    func = function()
        	        G.hand.cards[1]:flip()
        	        play_sound('card1', percent)
        	        G.hand.cards[1]:juice_up(0.3, 0.3)
        	        return true
        	    end
        	}))
        	delay(0.2)
        	G.E_MANAGER:add_event(Event({
        	    trigger = 'after',
        	    delay = 0.1,
        	    func = function()
        	        SMODS.change_base(G.hand.cards[1], "Hearts")
        	        return true
        	    end
        	}))
        	local percent = 0.85 + (1 - 0.999) / (#G.hand.cards - 0.998) * 0.3
        	G.E_MANAGER:add_event(Event({
        	    trigger = 'after',
        	    delay = 0.15,
        	    func = function()
        	        G.hand.cards[1]:flip()
        	        play_sound('tarot2', percent, 0.6)
        	        G.hand.cards[1]:juice_up(0.3, 0.3)
        	        return true
        	    end
        	}))
        	delay(0.5)
      		return {
      		    message = localize('para_k_transformed'),
        	    colour = G.C.SUITS.Hearts
          	}
		end
	end,
	in_pool = function(self, args)
		local creationcount = 0
		local isprestige = false
		for _, v in pairs(G.jokers.cards) do
			if (v.config.center.pools or {}).parajoker then
				creationcount = creationcount + 1
				if v.config.center.rarity == "para_prestige" then
					isprestige = true
				end
			end
		end
		return isprestige or (creationcount >= 3) or PSI.get_gameset().upgraded, { allow_duplicates = false }
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}