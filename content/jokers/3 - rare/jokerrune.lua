local dr_collection
if PSI.get_gameset().unfiltered then
	dr_collection = true
else
	dr_collection = false
end
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
	no_collection = not dr_collection,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult_gain, card.ability.extra.xmult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end,
	in_pool = function(self, args)
		return PSI.get_gameset().unfiltered, {allow_duplicates = false}
	end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}