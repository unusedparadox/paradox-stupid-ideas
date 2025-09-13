SMODS.Joker{ -- no way thats me
	key = 'paradox',
	atlas = 'Jokers',
	pos = {x = 5, y = 3},
	cost = 7,
	rarity = 2,
	pools = {["parajoker"] = true},
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
		if PSI.get_infobox_settings().extra then
			info_queue[#info_queue + 1] = { set = "Other", key = "para_explain_suit_Hearts"}
		end
	end,
	calculate = function(self,card,context)
		if context.using_consumeable and context.consumeable.ability.set == "Tarot" and G.hand and #G.hand.cards > 0 then
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
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	},
	pronouns = "any_all"
}