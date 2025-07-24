SMODS.Joker{ -- mmm yummy pancake
	key = 'pancake',
	atlas = 'Jokers',
	pos = {x = 0, y = 2},
	cost = 3,
	rarity = 1,
	config = {extra = {
		mult = 15,
		mult_loss = 3
	}},
	pools = { ["Food"] = true, ["parajoker"] = true },
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult, card.ability.extra.mult_loss}}
	end,
	calculate = function(self,card,context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
			if card.ability.extra.mult <= 0 then
				para_consumefood(card)
           		return {
           		    message = localize('k_eaten_ex'),
           		    colour = G.C.ATTENTION
           		}
			else
				return {
					message = localize{type = 'variable', key = 'a_mult_minus', vars = {to_big(card.ability.extra.mult_loss)}},
					colour = G.C.MULT
				}
			end
		elseif context.other_joker and (context.other_joker.config.center.pools or {}).Food then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}