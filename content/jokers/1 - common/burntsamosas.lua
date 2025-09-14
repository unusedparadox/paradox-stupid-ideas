SMODS.Joker{ -- Burnt Samosas implementation
	key = 'burntsamosas',
	config = { extra = {
		chips = 50,
		chip_loss = 2,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	atlas = 'Jokers',
	pos = {x = 9, y = 0},
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips, card.ability.extra.chip_loss}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		elseif context.end_of_round and context.cardarea == G.jokers then
			if card.ability.extra.chips <= (0 + card.ability.extra.chip_loss) then
				PSI.consumefood(card)
        	    return {
        	        message = localize('k_eaten_ex'),
        	        colour = G.C.ATTENTION
        	    }
			else
				SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "chips",
					scalar_value = "chip_loss",
					operation = "-",
					scaling_message = {
						message = localize{type = 'variable', key = 'a_chips_minus', vars = {to_big(card.ability.extra.chip_loss)}},
						colour = G.C.CHIPS
					}
				})
				return nil, true
			end
		end
	end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}