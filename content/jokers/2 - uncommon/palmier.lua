SMODS.Joker{ -- Palmier implementation
	key = 'palmier',
	config = { extra = {
		chips = 150,
		chip_loss = 10,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 2,
	cost = 7,
	atlas = 'Jokers',
	pos = {x = 0, y = 1},
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips, card.ability.extra.chip_loss}}
	end,
 	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and card.ability.extra.chips > 0 and not context.blueprint then
            context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chip_loss
			card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_loss
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
		elseif context.after and card.ability.extra.chips <= 0 and not context.blueprint then
			para_consumefood(card)
            return {
                message = localize('k_eaten_ex'),
                colour = G.C.ATTENTION
            }
		elseif context.joker_main and not context.blueprint and card.ability.extra.chips > 0 then
            return {
                chips = card.ability.extra.chips
            }
		end
    end
}