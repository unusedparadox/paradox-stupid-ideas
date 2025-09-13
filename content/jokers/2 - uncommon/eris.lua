SMODS.Joker{
	key = 'eris',
	atlas = 'Jokers',
	pos = {x = 3, y = 3},
	cost = 7,
	rarity = 2,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		if PSI.get_infobox_settings().extra then
			info_queue[#info_queue + 1] = { set = "Other", key = "para_explain_suit_Clubs"}
		end
		info_queue[#info_queue+1] = G.P_CENTERS["m_stone"]
	end,
	calculate = function(self,card,context)
        if context.before then
            local transformed = false
			for _, v in ipairs(context.full_hand) do
				if SMODS.has_enhancement(v, "m_stone") then
					juice_card(v)
                    local valid_cards = {}
                    for _, vv in ipairs(G.deck.cards) do
                        if not vv:is_suit("Clubs") then
                            valid_cards[#valid_cards+1] = vv
                            transformed = true
                        end
                    end
                    SMODS.change_base(pseudorandom_element(valid_cards, "j_para_eris"), "Clubs")
				end
			end
			if transformed then
				return {
					message = localize("para_k_transformed"),
					colour = G.C.SUITS.Clubs,
				}
			end
        end
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	},
	pronouns = "any_all"
}
local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
    if SMODS.has_enhancement(self, "m_stone") and suit == "Clubs" and next(SMODS.find_card("j_para_eris")) then
        return true
    end
    return ret
end