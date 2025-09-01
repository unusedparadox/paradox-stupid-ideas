SMODS.Joker{ -- Jackenstein
	key = 'jackenstein',
	config = { extra = {
		xmult = 3,
		xmult_loss = 0.25,
		xmult_reset = 3,
		min = 1,
	}},
	pools = { ["parajoker"] = true },
	rarity = 2,
	cost = 5,
	atlas = 'Jokers',
	pos = {x = 7, y = 1},
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult, card.ability.extra.xmult_loss, card.ability.extra.xmult_reset, card.ability.extra.min}}
	end,
 	calculate = function(self, card, context)
        if context.before and not context.blueprint then
			if card.ability.extra.xmult > card.ability.extra.min then
				card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
	      		return {
    	  		    message = localize{type = 'variable', key = 'a_xmult_minus', vars = {to_big(card.ability.extra.xmult_loss)}},
        		    colour = G.C.MULT
          		}
			else
				play_sound("para_yourtakingtoolong", 1, 1)
				return {
					message = localize("k_para_takingtoolong"),
					colour = G.C.RED
				}
			end
		elseif context.pre_discard and not context.blueprint then
			if card.ability.extra.xmult > card.ability.extra.min then
				card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
	      		return {
    	  		    message = localize{type = 'variable', key = 'a_xmult_minus', vars = {to_big(card.ability.extra.xmult_loss)}},
        		    colour = G.C.MULT
          		}
			else
				play_sound("para_yourtakingtoolong", 1, 1)
				return {
					message = localize("k_para_takingtoolong"),
					colour = G.C.RED
				}
			end
		elseif context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		elseif context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.blind.boss then
                card.ability.extra.xmult = card.ability.extra.xmult_reset
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
		end
    end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}
SMODS.Sound{
	key = "yourtakingtoolong",
	path = {
 		['default'] = 'yourtakingtoolong.ogg',
	 	['en-us'] = 'yourtakingtoolong.ogg',
	}
}