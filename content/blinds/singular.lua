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