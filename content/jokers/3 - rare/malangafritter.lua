local edition = 'e_polychrome'
if PSI.gameset.unfiltered then
	edition = "e_negative"
end
SMODS.Joker{ -- Malanga Fritter implementation
	key = 'malangafritter',
	config = { extra = {
		hands = 5
	}},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 3,
	cost = 7,
	atlas = 'Jokers',
	pos = {x = 8, y = 0},
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = G.P_CENTERS[edition]
		return {vars = {card.ability.extra.hands}}
	end,
 	calculate = function(self, card, context)
        if context.before and not context.blueprint then
			if not context.full_hand[1].edition then
				context.full_hand[1]:set_edition(edition)
				card.ability.extra.hands = card.ability.extra.hands - 1
          		return {
          		    message = localize('para_k_transformed'),
          		    colour = G.C.ATTENTION
          		}
			end
		elseif context.after and card.ability.extra.hands <= 0 and not context.blueprint then
			PSI.consumefood(card)
            return {
                message = localize('k_eaten_ex'),
                colour = G.C.ATTENTION
            }
		end
    end
}