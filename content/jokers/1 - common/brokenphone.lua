SMODS.Joker{
	key = "brokenphone",
	atlas = 'Jokers',
	pos = {x = 4, y = 2},
	pools = { ["parajoker"] = true },
	loc_vars = function(self,info_queue,card)
		if G.STAGE == G.STAGES.RUN then
			local handinfo = PSI.mostplayedhand(false)
			return {vars = {handinfo[1], number_format(handinfo[2] / to_big(2)), number_format(handinfo[3] / to_big(2))}}
		else
			return {vars = {"None", 0, 0}}
		end
	end,
	rarity = 1,
	cost = 3,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if context.joker_main then
			local handinfo = PSI.mostplayedhand(false)
			return {
				chips = handinfo[2] / to_big(2),
				mult = handinfo[3] / to_big(2)
			}
		end
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}