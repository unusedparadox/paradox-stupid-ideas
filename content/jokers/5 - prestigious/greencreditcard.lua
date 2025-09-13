local gcc_cost, gcc_rarity, gcc_collection
if PSI.get_gameset().unfiltered then
	gcc_cost = 10
	gcc_rarity = "para_prestige"
	gcc_collection = true
else
	gcc_cost = 1
	gcc_rarity = 1
	gcc_collection = false
end
SMODS.Joker{ -- Green Credit Card implementation
    key = "green_credit_card",
    blueprint_compat = false,
    rarity = gcc_rarity,
    cost = gcc_cost,
	pools = {["parajoker"] = true},
	atlas = 'Jokers',
    pos = { x = 8, y = 1 },
	no_collection = not gcc_collection,
	config = { extra = { bankrupt_at = 20, og_effect = "unfiltered" } },
	in_pool = function(self, args)
		if PSI.get_gameset().unfiltered then
			return next(SMODS.find_card("j_credit_card", false)) and to_big(((G.GAME.dollars + (G.GAME.dollar_buffer or 0))) < to_big(0)), { allow_duplicates = false }
		else
			return SMODS.showman("j_para_green_credit_card") and SMODS.showman("j_credit_card"), {allow_duplicates = false}
		end
	end,
	loc_vars = function(self,info_queue,card)
		if PSI.get_gameset().unfiltered then
			return {key = self.key .. "_unfiltered"}
		else
			return {key = self.key .. "_upgraded", vars = {card.ability.extra.bankrupt_at}}
		end
	end,
    add_to_deck = function(self, card, from_debuff)
        if PSI.get_gameset().upgraded then
			card.ability.extra.og_effect = "upgraded"
			G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
		end
    end,
    remove_from_deck = function(self, card, from_debuff)
		if PSI.get_gameset().upgraded and card.ability.extra.og_effect == "upgraded" then
        	G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
		end
	end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}
local para_buycheck = G.FUNCS.can_buy
G.FUNCS.can_buy = function(e)
    if next(SMODS.find_card("j_para_green_credit_card", false)) and PSI.get_gameset().unfiltered then
        e.config.colour = G.C.ORANGE
        e.config.button = 'buy_from_shop'
    	if e.config.ref_parent and e.config.ref_parent.children.buy_and_use then
    	  if e.config.ref_parent.children.buy_and_use.states.visible then
    	    e.UIBox.alignment.offset.y = -0.6
    	  else
    	    e.UIBox.alignment.offset.y = 0
    	  end
    	end
	else 
		return para_buycheck(e)
	end
end
local para_redeemcheck = G.FUNCS.can_redeem
G.FUNCS.can_redeem = function(e)
	if next(SMODS.find_card("j_para_green_credit_card", false)) and PSI.get_gameset().unfiltered then
		e.config.colour = G.C.GREEN
    	e.config.button = 'use_card'
	else
		return para_redeemcheck(e)
	end
end
local para_opencheck = G.FUNCS.can_open
G.FUNCS.can_open = function(e)
	if next(SMODS.find_card("j_para_green_credit_card", false)) and PSI.get_gameset().unfiltered then
		e.config.colour = G.C.GREEN
    	e.config.button = 'use_card'
	else
		return para_opencheck(e)
	end
end
local para_rerollcheck = G.FUNCS.can_reroll
G.FUNCS.can_reroll = function(e)
    if G.GAME.modifiers.disable_rerolls then
        e.nodes = {}
    end
    if next(SMODS.find_card("j_para_green_credit_card", false)) and PSI.get_gameset().unfiltered then
        e.config.colour = G.C.GREEN
        e.config.button = 'reroll_shop'
    else
		return para_rerollcheck(e)
    end
end