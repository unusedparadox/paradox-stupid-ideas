SMODS.Joker{ -- Fish Head implementation
	key = 'fishhead',
	config = { extra = {
		money = 20,
		threshold = 4,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 3,
	cost = 9,
	atlas = 'Jokers',
	pos = {x = 1, y = 1},
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.money, card.ability.extra.threshold}}
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			local money_minus = to_big(0) - math.max(0, (to_big(G.GAME.dollars) + (to_big(G.GAME.dollar_buffer) or to_big(0)) - to_big(card.ability.extra.threshold)))
			card.ability.extra.money = to_big(card.ability.extra.money) + to_big(money_minus)
			if to_big(card.ability.extra.money) <= to_big(0) then
				PSI.consumefood(card)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.ATTENTION
                }
			elseif to_big(money_minus) < to_big(0) then
				return {
					message = localize({type = "variable", key = "money_loss", vars = {number_format(to_big(0)-to_big(money_minus))}}),
					colour = G.C.RED
				}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		return card.ability.extra.money
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}