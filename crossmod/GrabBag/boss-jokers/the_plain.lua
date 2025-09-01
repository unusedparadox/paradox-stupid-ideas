SMODS.Joker{
    key = "the_plain",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	atlas = 'BossJokers',
	pos = { x = 0, y = 0 },
    rarity = "gb_boss",
    dependencies = { "GrabBag" },
    cost = 6,
    config = {extra = {
        chips = 10,
        mult = 2
    }},
    loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chips, card.ability.extra.mult}}
	end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if next(SMODS.get_enhancements(context.other_card)) then
                local message_color = G.C.ATTENTION
                local cleared = false
                if context.other_card.ability.perma_bonus ~= 0 then
                    cleared = true
                    context.other_card.ability.perma_bonus = 0
                    if context.other_card.ability.perma_mult == 0 then
                        message_color = G.C.CHIPS
                    else
                        context.other_card.ability.perma_mult = 0
                    end
                elseif context.other_card.ability.perma_mult ~= 0 then
                    cleared = true
                    if context.other_card.ability.perma_bonus == 0 then
                        message_color = G.C.MULT
                    else
                        context.other_card.ability.perma_bonus = 0
                    end
                end
                if cleared then
                    return {
                        message = localize('k_para_cleared'),
                        colour = message_color
                    }
                end
            else
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chips
                context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.ATTENTION
                }
            end
        end
    end,
    in_pool = function(self, args)
        return gb_is_blind_defeated("bl_para_plain")
    end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}