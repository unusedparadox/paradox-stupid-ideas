SMODS.Joker{ -- Green Credit Card implementation
    key = "green_credit_card",
    blueprint_compat = false,
    rarity = "para_prestige",
    cost = 10,
	pools = {["parajoker"] = true},
	atlas = 'Jokers',
    pos = { x = 8, y = 1 },
	in_pool = function(self, args)
		return next(SMODS.find_card("j_credit_card", false)) and to_big(((G.GAME.dollars + (G.GAME.dollar_buffer or 0))) < to_big(0)), { allow_duplicates = false }
	end
}
local para_buycheck = G.FUNCS.can_buy
G.FUNCS.can_buy = function(e)
    if next(SMODS.find_card("j_para_green_credit_card", false)) then
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
	if next(SMODS.find_card("j_para_green_credit_card", false)) then
		e.config.colour = G.C.GREEN
    	e.config.button = 'use_card'
	else
		return para_redeemcheck(e)
	end
end
local para_opencheck = G.FUNCS.can_open
G.FUNCS.can_open = function(e)
	if next(SMODS.find_card("j_para_green_credit_card", false)) then
		e.config.colour = G.C.GREEN
    	e.config.button = 'use_card'
	else
		return para_opencheck(e)
	end
end