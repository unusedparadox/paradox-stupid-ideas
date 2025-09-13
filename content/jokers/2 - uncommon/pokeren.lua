SMODS.Joker{
	key = 'pokeren',
	atlas = 'Jokers',
	pos = {x = 2, y = 3},
	cost = 7,
	rarity = 2,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
    config = {extra = {
        money_req = 5,
        money_left = 5
    }},
	loc_vars = function(self, info_queue, card)
		if PSI.get_infobox_settings().extra then
			info_queue[#info_queue + 1] = { set = "Other", key = "para_explain_suit_Diamonds"}
		end
        return {vars = {card.ability.extra.money_req, card.ability.extra.money_left}}
	end,
	calculate = function(self,card,context)
        if context.money_altered then
            if context.amount >= 0 then
                card.ability.extra.money_left = card.ability.extra.money_left - context.amount
                local transformed = false
                while card.ability.extra.money_left <= 0 do
                    card.ability.extra.money_left = card.ability.extra.money_left + card.ability.extra.money_req
                    local valid_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not v:is_suit("Diamonds") then
                            valid_cards[#valid_cards+1] = v
                            transformed = true
                        end
                    end
                    local randcard = pseudorandom_element(valid_cards, "j_para_pokeren")
                    if randcard then
                        if randcard.area == G.play or randcard.area == G.hand then
                            local percent = 1.15 - (1 - 0.999) / (1 - 0.998) * 0.3
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.15,
                                func = function()
                                    randcard:flip()
                                    play_sound('card1', percent)
                                    randcard:juice_up(0.3, 0.3)
                                    return true
                                end
                            }))
                            delay(0.2)
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.1,
                                func = function()
                                    SMODS.change_base(randcard, "Diamonds")
                                    return true
                                end
                            }))
                            local percent = 0.85 + (1 - 0.999) / (1 - 0.998) * 0.3
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.15,
                                func = function()
                                    randcard:flip()
                                    play_sound('tarot2', percent, 0.6)
                                    randcard:juice_up(0.3, 0.3)
                                    return true
                                end
                            }))
                        else
                            SMODS.change_base(randcard, "Diamonds")
                        end
                    end
                end
			    if transformed then
		        	return {
		        		message = localize("para_k_transformed"),
		        		colour = G.C.SUITS.Diamonds,
		        	}
			    end
            end
        end
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	},
    pronouns = "she_it"
}