local is_dupes = function()
    if G.jokers and G.jokers.cards then
        for _, card in ipairs(G.jokers.cards) do
            local jimbos = SMODS.find_card(card.config.center.key, true)
            if #jimbos > 1 then
                return true
            end
        end
    end
    return false
end
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
        local message = localize("para_k_active")
        if is_dupes() then message = localize("para_k_inactive") end
		return {vars = {card.ability.extra.xmult, message}}
	end,
    calculate = function(self, card, context)
        if context.joker_main and not is_dupes() then
            return { xmult = card.ability.extra.xmult }
        end
    end,
    in_pool = function(self, args)
        return gb_is_blind_defeated("bl_para_singular")
    end
}