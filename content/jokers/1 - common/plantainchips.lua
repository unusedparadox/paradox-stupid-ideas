SMODS.Joker{ -- Plantain Chips implementation
	key = 'plantainchips',
	config = { extra = {
		xchips = 2,
		xchips_loss = 0.1
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
		return {vars = {card.ability.extra.xchips, card.ability.extra.xchips_loss}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips
			}
		elseif context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.xchips = card.ability.extra.xchips - card.ability.extra.xchips_loss
			if card.ability.extra.xchips <= 1 then
				PSI.consumefood(card)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.ATTENTION
                }
			else
                return {
                    message = localize { type = 'variable', key = 'a_xchips_minus', vars = { card.ability.extra.xchips_loss } },
                    colour = G.C.CHIPS
                }
			end
		end
	end
}