SMODS.Joker{ -- Tower implementation
	key = 'tower',
	config = { extra = {
		money = 20,
		triggered = false
	}},
	rarity = 1,
	cost = 11,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'Jokers',
	pos = {x = 6, y = 1},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = G.P_CENTERS.j_ring_master
		return {vars = {card.ability.extra.money}}
	end,
 	calculate = function(self, card, context)
        if context.starting_shop then
			card.ability.extra.triggered = false
		end
    end,
	calc_dollar_bonus = function(self, card)
		local towers = SMODS.find_card("j_para_tower", false)
		local give_money = #towers >= 2
		if give_money then
			for i,v in ipairs(towers) do
				if v.ability.extra.triggered then
					give_money = false
					break
				end
			end
		end
		if give_money then
			card.ability.extra.triggered = true
			return card.ability.extra.money
		else
			return nil
		end
	end,
	in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end
}