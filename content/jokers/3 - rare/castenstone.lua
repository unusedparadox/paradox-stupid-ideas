SMODS.Joker{
	key = "castenstone",
	atlas = 'Jokers',
	pos = {x = 5, y = 2},
	config = { extra = {
		chips = 0,
		chip_gain = 12,
	}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips, card.ability.extra.chip_gain}}
	end,
	pools = { ["parajoker"] = true },
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.modify_scoring_hand and not context.blueprint and context.in_scoring then
			local splash_before, splash_after, s_index, c_index = false, false, nil, nil
			for i = 1, #G.jokers.cards do
            	if G.jokers.cards[i].config.center.key == "j_para_castenstone" then c_index = i
				elseif G.jokers.cards[i].config.center.key == "j_splash" and not s_index then s_index = i end
        	end
			if s_index and c_index and s_index < c_index then splash_before = true end
			if s_index and c_index and s_index > c_index then splash_after = true end
			if splash_before or SMODS.in_scoring(context.other_card, context.scoring_hand) then
				SMODS.scale_card(context.other_card, {
					ref_table = card.ability.extra,
					ref_value = "chips",
					scalar_value = "chip_gain",
					scaling_message = {
						message = localize("k_upgrade_ex"),
						colour = G.C.CHIPS
					}
				})
				if not splash_after then
					return {
						remove_from_hand = true
					}
				end
				return nil, true
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
			return nil, true
		elseif context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}