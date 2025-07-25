SMODS.Joker{
	key = "endlessinferno",
	atlas = 'Jokers',
	pos = {x = 8, y = 2},
	config = { extra = {
		xchips_gain = 0.25,
	}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xchips_gain}}
	end,
	pools = { ["parajoker"] = true },
	rarity = "gb_shattered",
	cost = 8,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.before then
            for _, v in ipairs(context.scoring_hand) do
                v:set_ability(G.P_CENTERS["m_para_ashen"])
                v.ability.perma_x_chips = v.ability.perma_x_chips + card.ability.extra.xchips_gain
                v:juice_up()
            end
        end
	end
}
GB.G.SHATTERED_TABLE[#GB.G.SHATTERED_TABLE + 1] = {"j_para_ashenjoker", "j_para_endlessinferno"}