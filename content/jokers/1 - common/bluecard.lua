SMODS.Joker{ -- Blue Card implementation
	key = 'bluecard',
	atlas = 'Jokers',
	pos = {x = 0, y = 0},
	config = { extra = {
		chip_gain = 10,
		chips = 0
	}
	},
	rarity = 1,
	blueprint_compat = true,
	perishable_compat = false,
	cost = 4,
	pools = {["parajoker"] = true},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chip_gain, card.ability.extra.chips}}
	end,
	calculate = function(self,card,context)
		if context.open_booster and not context.blueprint then 
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
			return {
				message = localize{type = 'variable', key = 'a_chips', vars = {to_big(card.ability.extra.chip_gain)}},
				colour = G.C.CHIPS
			}
		elseif context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if next(SMODS.find_card("j_red_card", true)) and next(SMODS.find_card("j_para_orangecard", true)) and next(SMODS.find_card("j_para_yellowcard", true)) then
			check_for_unlock({type = 'cardcollector'})
		end
	end
}