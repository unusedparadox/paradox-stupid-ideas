SMODS.Joker{ -- NFT Joker implementation
	key = 'nft',
	config = { extra = {
		scam = 125,
		min = 0
	}
	},
	pools = {["parajoker"] = true},
	rarity = "para_nft",
	atlas = 'Jokers',
	pos = {x = 3, y = 1},
	cost = 1000,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.scam, card.ability.extra.min}}
	end,
	in_pool = function(self, args)
		return args and args.source == 'sho'
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and card.sell_cost > card.ability.extra.min then
			card.ability.extra_value = card.ability.extra_value - card.ability.extra.scam
			card:set_cost()
			if card.sell_cost < card.ability.extra.min then
				card.sell_cost = card.ability.extra.min
				card.ability.extra_value = 0
			end
            return {
                message = localize('para_k_l'),
                colour = G.C.ATTENTION
            }
		end
	end
}