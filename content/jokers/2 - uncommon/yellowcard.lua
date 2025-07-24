SMODS.Joker{ -- Yellow Card implementation
	key = 'yellowcard',
	atlas = 'Jokers',
	pos = {x = 2, y = 0},
	config = { extra = {
		money = 0,
		money_gain = 1
	}
	},
	rarity = 2,
	pools = {["parajoker"] = true},
	blueprint_compat = false,
	perishable_compat = false,
	cost = 6,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.money, card.ability.extra.money_gain}}
	end,
	calculate = function(self,card,context)
		if context.skipping_booster and not context.blueprint then
			card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_gain
			return {
				message = "+" .. SMODS.signed_dollars(card.ability.extra.money_gain),
				colour = G.C.MONEY
			}
		end
	end,
	calc_dollar_bonus = function(self, card) -- Apparently money isn't in the calculate function. Who knew?
		if card.ability.extra.money == 0 then
			return nil
		else
			return card.ability.extra.money
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if next(SMODS.find_card("j_red_card", true)) and next(SMODS.find_card("j_para_orangecard", true)) and next(SMODS.find_card("j_para_bluecard", true)) then
			check_for_unlock({type = 'cardcollector'})
		end
	end
}