SMODS.Joker{ -- Cookie implementation
	key = 'cookie',
	config = { extra = {
		xmult = 2.5,
		xmult_loss = 0.25
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 2,
	cost = 5,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 5, y = 0},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult, card.ability.extra.xmult_loss}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		elseif context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
			if card.ability.extra.xmult <= 1 then
				PSI.consumefood(card)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.ATTENTION
                }
			else
                return {
                    message = localize { type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.xmult_loss } },
                    colour = G.C.MULT
                }
			end
		end
	end
}