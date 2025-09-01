SMODS.Joker{
    key = "the_singular",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	atlas = 'BossJokers',
	pos = { x = 1, y = 0 },
    rarity = "gb_boss",
    dependencies = { "GrabBag" },
    cost = 6,
    config = {extra = {
        xmult = 3
    }},
    loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.xmult}}
	end,
    calculate = function(self, card, context)
        if context.joker_main then
            local unique_cards = {}
            for _, v in ipairs(context.scoring_hand) do
                for _, vv in ipairs(unique_cards) do
                    if PSI.compare_singular(v, vv) then
                        return nil, true
                    end
                end
                unique_cards[#unique_cards+1] = v
            end
            return { xmult = card.ability.extra.xmult }
        end
    end,
    in_pool = function(self, args)
        return gb_is_blind_defeated("bl_para_singular")
    end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}