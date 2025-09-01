SMODS.Booster{
	key = 'creditpack',
	config = {extra = 1, choose = 1},
	atlas = 'Boosters',
	pos = { x = 2, y = 0 },
	create_card = function(self, card)
		if pseudorandom("para_creditpack") < 0.1 then
			return SMODS.create_card({area = G.pack_cards, no_edition = true, key = 'j_credit_card', key_append = "para_creditpack_card"})
		else
			return SMODS.create_card({area = G.pack_cards, no_edition = true, key = 'j_para_green_credit_card', key_append = "para_creditpack_card"})
		end
	end,
	weight = 1,
	cost = 1,
	group_key = 'groupcreditpack',
	in_pool = function(self, args)
		return PSI.get_gameset().unfiltered, { allow_duplicates = false }
	end,
	para_credits = {
		["art"] = "localthunk",
		["code"] = "UnusedParadox"
	}
}