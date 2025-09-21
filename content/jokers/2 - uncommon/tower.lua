SMODS.Joker{ -- Tower implementation
	key = 'tower',
	config = { extra = {
		money_req = 7,
		money_gain = 1
	}},
	rarity = 2,
	cost = 8,
	pools = {["parajoker"] = true},
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'Jokers',
	pos = {x = 6, y = 1},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.money_gain, card.ability.extra.money_req}}
	end,
	calc_dollar_bonus = function(self, card)
		if (to_big(G.GAME.dollars + (G.GAME.dollar_buffer or 0)) < to_big(0)) and PSI.get_gameset().upgraded then
			return nil
		end
		return math.floor((G.GAME.dollars + (G.GAME.dollar_buffer or 0)) / card.ability.extra.money_req) * card.ability.extra.money_gain
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}