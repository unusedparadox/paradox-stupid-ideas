SMODS.Joker{ -- Ashen Joker
	key = 'ashenjoker',
	atlas = 'Jokers',
	pos = {x = 2, y = 2},
	cost = 6,
	rarity = 2,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	config = {extra = {
		xchips = 1,
		xchips_gain = 0.1
	}},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS["m_para_ashen"]
        return {vars = {card.ability.extra.xchips, card.ability.extra.xchips_gain}}
	end,
	calculate = function(self,card,context)
		if context.before and not context.blueprint then
			local scaled = false
			for _, v in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(v, "m_para_ashen") then
					scaled = true
					SMODS.scale_card(card, {
						ref_table = card.ability.extra,
						ref_value = "xchips",
						scalar_value = "xchips_gain",
						no_message = true
					})
				end
			end
			if scaled then
				return {
                	message = localize{type = 'variable', key = 'a_xchips', vars = {to_big(card.ability.extra.xchips)}},
                	colour = G.C.CHIPS
            	}
			end
		elseif context.joker_main then
			return {
				xchips = card.ability.extra.xchips
			}
		end
	end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_para_ashen') then
                return true
            end
        end
        return false
    end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}