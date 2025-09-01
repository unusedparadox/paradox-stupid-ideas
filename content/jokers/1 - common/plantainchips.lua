SMODS.Joker{ -- Plantain Chips implementation
	key = 'plantainchips',
	config = { extra = {
		chips = 80,
		chips_loss = 20,
		numerator = 1,
		denominator = 3,
		odds = true
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 1,
	cost = 3,
	atlas = 'Jokers',
	pos = {x = 7, y = 0},
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, 'para_plantain')
		return {vars = {card.ability.extra.chips, card.ability.extra.chips_loss, new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		elseif context.end_of_round and context.cardarea == G.jokers then
			if SMODS.pseudorandom_probability(card, 'para_plantain', card.ability.extra.numerator, card.ability.extra.denominator) then
				card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_loss
				if card.ability.extra.chips <= 0 then
					PSI.consumefood(card)
            	    return {
            	        message = localize('k_eaten_ex'),
            	        colour = G.C.ATTENTION
            	    }
				else
            	    return {
            	        message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chips_loss } },
            	        colour = G.C.CHIPS
            	    }
				end
			end
		end
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}