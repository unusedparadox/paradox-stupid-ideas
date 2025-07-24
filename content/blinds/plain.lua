SMODS.Blind { -- The Plain
    key = "plain",
    dollars = 5,
    mult = 2,
    atlas = "Blinds",
    pos = { x = 0, y = 0 },
    boss = { min = 6 },
    boss_colour = HEX("cca876"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.before then
                for _, v in ipairs(context.scoring_hand) do
                    if next(SMODS.get_enhancements(v)) then
                        SMODS.debuff_card(v, true, "para_plaindebuff")
                    end
                end
            end
        end
    end,
    disable = function(self)
        for _, v in ipairs(G.playing_cards) do
            if next(SMODS.get_enhancements(v)) then
                SMODS.debuff_card(v, false, "para_plaindebuff")
            end
        end
    end,
    defeat = function(self)
        for _, joker in ipairs(G.playing_cards) do
            joker.ability.para_singular = nil
            SMODS.debuff_card(joker, false, "para_plaindebuff")
        end
    end
}