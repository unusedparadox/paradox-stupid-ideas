SMODS.Joker{ -- < • Astro :3c • > implementation
	key = 'astro',
	pools = {["parajoker"] = true},
	atlas = 'Jokers',
	pos = {x = 4, y = 3},
	cost = 6,
	rarity = 2,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
		if PSI.get_infobox_settings().extra then
			info_queue[#info_queue + 1] = { set = "Other", key = "para_explain_suit_Spades"}
		end
	end,
	calculate = function(self, card, context)
		if context.before and not context.blueprint then
			if context.scoring_name == "Flush" then
				G.E_MANAGER:add_event(Event({
        		    trigger = 'after',
        		    delay = 0.4,
        		    func = function()
        		        play_sound('tarot1')
        		        card:juice_up(0.3, 0.5)
        		        return true
        		    end
        		}))
        		for i = 1, #context.scoring_hand do
        		    local percent = 1.15 - (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
        		    G.E_MANAGER:add_event(Event({
        		        trigger = 'after',
        		        delay = 0.15,
        		        func = function()
        		            context.scoring_hand[i]:flip()
        		            play_sound('card1', percent)
        		            context.scoring_hand[i]:juice_up(0.3, 0.3)
        		            return true
        		        end
        		    }))
        		end
        		delay(0.2)
        		for i = 1, #context.scoring_hand do
        		    G.E_MANAGER:add_event(Event({
        		        trigger = 'after',
        		        delay = 0.1,
        		        func = function()
        		            SMODS.change_base(context.scoring_hand[i], "Spades")
        		            return true
        		        end
        		    }))
        		end
        		for i = 1, #context.scoring_hand do
        		    local percent = 0.85 + (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
        		    G.E_MANAGER:add_event(Event({
        		        trigger = 'after',
        		        delay = 0.15,
        		        func = function()
        		            context.scoring_hand[i]:flip()
        		            play_sound('tarot2', percent, 0.6)
        		            context.scoring_hand[i]:juice_up(0.3, 0.3)
        		            return true
        		        end
        		    }))
        		end
        		delay(0.5)
				return {
					message = localize("para_k_transformed"),
					colour = G.C.SUITS.Spades
				}
			end
		end
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	},
	pronouns = "he_him"
}