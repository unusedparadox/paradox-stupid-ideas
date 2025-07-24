SMODS.Joker{ -- Onigiri implementation
	key = 'onigiri',
	config = { extra = {
		hands_left = 5,
		chips = 60,
		mult = 12,
		xmult = 1.6,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 1,
	cost = 3,
	atlas = 'Jokers',
	pos = {x = 6, y = 0},
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.hands_left}}
	end,
	calculate = function(self, card, context)
		local effects = {"chips", "mult", "xmult"}
		local chosen_effect = effects[math.random(#effects)]
		if context.joker_main then
			if chosen_effect == "chips" then
				return {
					chips = card.ability.extra.chips
				}
			elseif chosen_effect == "mult" then
				return {
					mult = card.ability.extra.mult
				}
			elseif chosen_effect == "xmult" then
				return {
					xmult = card.ability.extra.xmult
				}
			end
		elseif context.after and not context.blueprint then
			card.ability.extra.hands_left = card.ability.extra.hands_left - 1
			if card.ability.extra.hands_left <= 0 then
				para_consumefood(card)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.ATTENTION
                }
			else
                return {
                    message = card.ability.extra.hands_left .. '',
                    colour = G.C.ATTENTION
                }
			end
		end
	end
}