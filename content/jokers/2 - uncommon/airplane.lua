SMODS.Joker{ -- Airplane implementation
	key = 'airplane',
	config = { extra = {
		rerolls = 1
	}},
	rarity = 2,
	cost = 9,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'Jokers',
	pos = {x = 5, y = 1},
	loc_vars = function(self,info_queue,card)
        local vouchers = 0
        for k, _ in pairs(G.GAME.used_vouchers) do
            if not next(G.P_CENTERS[k].requires or {}) then
                vouchers = vouchers + 1
            end
        end
		local messagea = ""
		local messageb = ""
		if vouchers == 1 then
			messagea = localize("airplane_a1")
			messageb = localize("airplane_b1")
		else
			messagea = localize("airplane_a2")
			messageb = localize("airplane_b2")
		end
		return {vars = {card.ability.extra.rerolls, card.ability.extra.rerolls * vouchers, messagea, messageb}}
	end,
 	calculate = function(self, card, context)
		if context.buying_card and context.card.ability.set == "Voucher" and not next(context.card.config.center.requires or {}) then
			SMODS.change_free_rerolls(card.ability.extra.rerolls)
		end
    end,
    add_to_deck = function(self, card, from_debuff)
        local vouchers = 0
        for k, _ in pairs(G.GAME.used_vouchers) do
            if not next(G.P_CENTERS[k].requires or {}) then
                vouchers = vouchers + 1
            end
        end
        SMODS.change_free_rerolls(card.ability.extra.rerolls * vouchers)
    end,
    remove_from_deck = function(self, card, from_debuff)
        local vouchers = 0
        for k, _ in pairs(G.GAME.used_vouchers) do
            if not next(G.P_CENTERS[k].requires or {}) then
                vouchers = vouchers + 1
            end
        end
        SMODS.change_free_rerolls(-card.ability.extra.rerolls * vouchers)
    end
}