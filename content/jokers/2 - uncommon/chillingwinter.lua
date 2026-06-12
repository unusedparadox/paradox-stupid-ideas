SMODS.Joker{
	key = 'chillingwinter',
	config = { extra = {
        xchips_gain = 0.5,
        xchips = 1
	}
	},
	pools = { ["parajoker"] = true },
	rarity = 2,
	cost = 7,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 6, y = 3},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xchips_gain, card.ability.extra.xchips}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
            return {xchips = card.ability.extra.xchips}
        elseif context.end_of_round and context.main_eval and context.beat_boss then
			SMODS.scale_card(card, {
				ref_table = card.ability.extra,
				ref_value = "xchips",
				scalar_value = "xchips_gain",
				scaling_message = {
					message = localize{type = 'variable', key = 'a_xchips', vars = {to_big(card.ability.extra.xchips + card.ability.extra.xchips_gain)}},
					colour = G.C.CHIPS
				}
			})
        elseif ((context.selling_card and context.card ~= card) or
		context.remove_playing_cards or
		context.joker_type_destroyed and context.card ~= card) and
		card.ability.extra.xchips ~= 1 then
            card.ability.extra.xchips = 1
            return {
                message = localize("k_reset")
            }
		end
	end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}