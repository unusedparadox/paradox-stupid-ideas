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
            if context.debuff_card and context.debuff_card.area ~= G.jokers and next(SMODS.get_enhancements(context.debuff_card)) then
                return {
                    debuff = true
                }
            end
        end
    end,    
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}