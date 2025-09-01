SMODS.Joker{ -- Orange Card implementation
	key = 'orangecard',
	atlas = 'Jokers',
	pos = {x = 1, y = 0},
	config = { extra = {
		xmult_gain = 0.25,
		xmult = 1,
		is_active = true,
	}
	},
	rarity = 2,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	perishable_compat = false,
	cost = 6,
	loc_vars = function(self,info_queue,card)
		local active_msg = localize("para_k_inactive")
		if card.ability.extra.is_active then
			active_msg = localize("para_k_active")
		end
		return {vars = {card.ability.extra.xmult_gain, card.ability.extra.xmult, active_msg}}
	end,
	calculate = function(self,card,context)
		if context.skipping_booster and not context.blueprint and card.ability.extra.is_active then -- Booster Pack is skipped, deactivate the Joker and increase the XMult
			card.ability.extra.is_active = false
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
			return {
				message = localize{type = 'variable', key = 'a_xmult', vars = {to_big(card.ability.extra.xmult)}},
				colour = G.C.MULT
			}
		elseif context.ending_shop and not context.blueprint then -- Reactivate the Joker
			if not card.ability.extra.is_active then
				card.ability.extra.is_active = true
				return {
					message = localize('para_k_reactivated'),
					colour = G.C.ATTENTION
				}
			end
		elseif context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if next(SMODS.find_card("j_red_card", true)) and next(SMODS.find_card("j_para_bluecard", true)) and next(SMODS.find_card("j_para_yellowcard", true)) then
			check_for_unlock({type = 'cardcollector'})
		end
	end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}