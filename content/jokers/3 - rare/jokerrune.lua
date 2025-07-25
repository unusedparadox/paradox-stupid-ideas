SMODS.Joker{ -- Jokerrune implementation
	key = 'jokerrune',
	config = { extra = {
		xmult_gain = 1,
		xmult = 4
	}},
	atlas = 'Jokers',
	pos = {x = 4, y = 1},
	cost = 5,
	rarity = 3,
	pools = {["parajoker"] = true},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult_gain, card.ability.extra.xmult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end
}