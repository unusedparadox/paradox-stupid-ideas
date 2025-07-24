SMODS.Joker{ -- no way thats me
	key = 'paradox',
	atlas = 'Jokers_Soul',
	pos = {x = 0, y = 0},
	soul_pos = {x = 0, y = 1},
	cost = 10,
	rarity = "para_prestige",
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
        return {vars = {colours = {HEX("2dcddd"), HEX("262680")}}}
	end,
	calculate = function(self,card,context)
		if context.ending_shop then
			SMODS.add_card({set = "parajoker", edition = "e_negative", key_append = "para_paradox_joker"})
		end
	end,
	in_pool = function(self, args)
		local creationcount = 0
		local isprestige = false
		for _, v in pairs(G.jokers.cards) do
			if (v.config.center.pools or {}).parajoker then
				creationcount = creationcount + 1
				if v.config.center.rarity == "para_prestige" then
					isprestige = true
				end
			end
		end
		return isprestige or (creationcount >= 3), { allow_duplicates = false }
	end
}