SMODS.Atlas{
	key = "Boosters",
	path = "Boosters.png",
	px = 71,
	py = 95,
}
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
	group_key = 'groupcreditpack'
}
SMODS.Booster{
	key = 'foodpack',
	config = {extra = 3, choose = 1},
	atlas = 'Boosters',
	pos = { x = 1, y = 0 },
	no_collection = true,
	create_card = function(self, card)
		return SMODS.create_card({set = "Food", area = G.pack_cards, skip_materialize = true, key_append = "para_foodpack_card"})
	end,
	weight = 0,
	cost = 0,
	group_key = 'groupfoodpack',
	in_pool = function(self, args)
		return false
	end
}