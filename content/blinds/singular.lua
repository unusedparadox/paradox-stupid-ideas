SMODS.Blind { -- The Singular
    key = "singular",
    dollars = 5,
    mult = 2,
    atlas = "Blinds",
    pos = { x = 0, y = 1 },
    boss = { min = 9 },
    boss_colour = HEX("aa3eb0"),
    recalc_debuff = function(self, card, from_blind)
        local identicards = {}
        for _, v in ipairs(G.playing_cards) do
            v:set_debuff(false)
            if PSI.compare_singular(v, card) then
                identicards[#identicards+1] = v
            end
        end
        if #identicards >= 2 then
            for _, v in ipairs(identicards) do
                v:set_debuff(true)
            end
            return true
        end
    end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}