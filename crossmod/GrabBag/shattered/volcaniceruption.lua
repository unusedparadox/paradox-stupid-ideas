SMODS.Joker{
	key = "volcaniceruption",
	atlas = 'Jokers',
	pos = {x = 7, y = 2},
	config = { extra = {
		xchips = 1,
		xchip_gain = 0.1,
	}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xchips, card.ability.extra.xchip_gain}}
	end,
	pools = { ["parajoker"] = true },
	rarity = "gb_shattered",
	cost = 8,
	dependencies = { "GrabBag" },
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.modify_scoring_hand and not context.blueprint and context.in_scoring then
			local splash_after, s_index, c_index = false, nil, nil
			for i = 1, #G.jokers.cards do
            	if G.jokers.cards[i].config.center.key == "j_para_castenstone" then c_index = i
				elseif G.jokers.cards[i].config.center.key == "j_splash" and not s_index then s_index = i end
        	end
			if s_index and c_index and s_index > c_index then splash_after = true end
			card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchip_gain
			if not splash_after then
				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.CHIPS,
					remove_from_hand = true
				}
			else
				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.CHIPS
				}	
			end
		elseif context.modify_scoring_hand and not context.blueprint then
			local splash_after, s_index, c_index = false, nil, nil
			for i = 1, #G.jokers.cards do
            	if G.jokers.cards[i].config.center.key == "j_para_castenstone" then c_index = i
				elseif G.jokers.cards[i].config.center.key == "j_splash" then s_index = i end
        	end
			if s_index and c_index and s_index > c_index then splash_after = true end
			if not splash_after then
				return {
					remove_from_hand = true
				}
			end
		elseif context.joker_main then
			return {
				xchips = card.ability.extra.xchips
			}
		end
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}
GB_SHATTERED_TABLE["j_para_castenstone"] = "j_para_volcaniceruption"