SMODS.Joker{
	key = "threepartplan",
	atlas = 'Jokers',
	pos = {x = 3, y = 2},
	pools = { ["parajoker"] = true },
	config = { extra = {
		numerator = 1,
		denominator = 4,
		odds = true -- hiya grab bag nice to see you
	}},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = G.P_CENTERS["m_glass"]
		local new_numerator, new_denominator = SMODS.get_probability_vars(card,
		card.ability.extra.numerator, card.ability.extra.denominator, 'para_threepartplan')
		return {vars = {new_numerator, new_denominator}}
	end,
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if context.before then
			local transformed = false
			for _, v in ipairs(context.scoring_hand) do
				if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.numerator,
				card.ability.extra.denominator, 'para_threepartplan') then
					v:set_ability(G.P_CENTERS["m_glass"])
					v:juice_up()
					transformed = true
				end
			end
			if transformed then
				return {
					message = localize("para_k_transformed")
				}
			end
        elseif context.remove_playing_cards then
			local glass = false
            for _, removed_card in ipairs(context.removed) do
                if SMODS.has_enhancement(removed_card, 'm_glass') then
					glass = true
					G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            		local copy_card = copy_card(removed_card, nil, nil, G.playing_card)
					local rank = pseudorandom_element(SMODS.Ranks, pseudoseed("para_threepartplan_ranks")).key
					local suit = pseudorandom_element(SMODS.Suits, pseudoseed("para_threepartplan_suits")).key
					assert(SMODS.change_base(copy_card, suit, rank))
            		copy_card:add_to_deck()
            		G.deck.config.card_limit = G.deck.config.card_limit + 1
            		table.insert(G.playing_cards, copy_card)
            		G.deck:emplace(copy_card)
            		copy_card.states.visible = nil

            		G.E_MANAGER:add_event(Event({
            		    func = function()
            		        copy_card:start_materialize()
            		        return true
            		    end
            		}))
    		        G.E_MANAGER:add_event(Event({
        	            func = function()
        	                SMODS.calculate_context({ playing_card_added = true, cards = { copy_card } })
        	                return true
        		        end
           		    }))
				end
            end
			if glass then
        		return {
        		    message = localize('k_copied_ex'),
        		    colour = G.C.ATTENTION
        		}
			end
		end
	end
}