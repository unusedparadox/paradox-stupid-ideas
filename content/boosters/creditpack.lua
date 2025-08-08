SMODS.Booster{
	key = 'creditpack',
	config = {extra = 1, choose = 1},
	atlas = 'Boosters',
	pos = { x = 2, y = 0 },
	create_card = function(self, card)
		return SMODS.create_card({area = G.pack_cards, no_edition = true, key = 'j_credit_card', key_append = "para_creditpack_card"})
	end,
	weight = 1,
	cost = 1,
	group_key = 'groupcreditpack',
	in_pool = function(self, args)
		return PSI.gameset.unfiltered, { allow_duplicates = false }
	end
}