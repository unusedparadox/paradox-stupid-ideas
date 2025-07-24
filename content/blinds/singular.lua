local debuff_dupes = function(card, sellkey)
    if card.config.center.key == "j_blueprint" or card.config.center.key == "j_brainstorm" then
        card.ability.para_singular = true
        SMODS.debuff_card(card, true, "para_singulardebuff")
    end
    local jimbos = SMODS.find_card(card.config.center.key, true)
    if #jimbos > 1 and (not ((#jimbos == 2) and (card.config.center.key == sellkey))) and card.config.center.key ~= "j_chicot" then
        card.ability.para_singular = true
        SMODS.debuff_card(card, true, "para_singulardebuff")
    end
end
SMODS.Blind { -- The Singular
    key = "singular",
    dollars = 5,
    mult = 2,
    atlas = "Blinds",
    pos = { x = 0, y = 1 },
    boss = { min = 9 },
    boss_colour = HEX("aa3eb0"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_card and context.debuff_card.area == G.jokers then
                    debuff_dupes(context.debuff_card, nil)
            elseif context.selling_card then
                for _, joker in ipairs(G.jokers.cards) do
                    joker.ability.para_singular = nil
                    SMODS.debuff_card(joker, false, "para_singulardebuff")
                    debuff_dupes(joker, context.card.config.center.key)
                end
            elseif context.card_added then
                for _, joker in ipairs(G.jokers.cards) do
                    joker.ability.para_singular = nil
                    SMODS.debuff_card(joker, false, "para_singulardebuff")
                    debuff_dupes(joker, nil)
                end
            end
        end
    end,
    disable = function(self)
        for _, joker in ipairs(G.jokers.cards) do
            joker.ability.para_singular = nil
            SMODS.debuff_card(joker, false, "para_singulardebuff")
        end
    end,
    defeat = function(self)
        for _, joker in ipairs(G.jokers.cards) do
            joker.ability.para_singular = nil
            SMODS.debuff_card(joker, false, "para_singulardebuff")
        end
    end
}
-- Getting Matador to work with The Singular. This doesn't work with Cryptid value manipulation but hell if I care
SMODS.Joker:take_ownership("matador", {
	calculate = function(self, card, context)
		local triggered = false
        for k, v in pairs(G.jokers.cards) do
            if v.ability and v.ability.para_singular then
                triggered = true
            end
        end
        if context.debuffed_hand or context.joker_main then
            if G.GAME.blind.triggered or triggered then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + 8
                return {
                    dollars = 8,
                    func = function() -- This is for timing purposes, it runs after the dollar manipulation
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
		end
    end
}, true)