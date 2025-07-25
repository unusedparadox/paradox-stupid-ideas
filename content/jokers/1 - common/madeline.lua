SMODS.Joker{ -- Madeline implementation
	key = 'madeline',
	config = { extra = {
		mult = 3,
		cards = 100,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 1,
	cost = 3,
	atlas = 'Jokers',
	pos = {x = 2, y = 1},
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.mult, card.ability.extra.cards}}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and card.ability.extra.cards > 0 then
			card.ability.extra.cards = card.ability.extra.cards - 1
			return {
				mult = card.ability.extra.mult
			}
		elseif context.after and card.ability.extra.cards <= 0 and not context.blueprint then
			PSI.consumefood(card)
            return {
                message = localize('k_eaten_ex'),
                colour = G.C.ATTENTION
            }
		end
	end
}