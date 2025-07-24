SMODS.Enhancement{
    key = "ashen",
    atlas = "Enhancements",
    pos = { x = 0, y = 0 },
    config = { extra = {
        chip_add = 10,
        numerator = 1,
        denominator = 3,
    }},
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, 'para_ashen_enhance')
		return {vars = {card.ability.extra.chip_add, new_numerator, new_denominator}}
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.play then
            for _, v in ipairs(context.scoring_hand) do
                v.ability.perma_bonus = (v.ability.perma_bonus or 0) + card.ability.extra.chip_add
                v:juice_up()
            end
        elseif context.destroy_card and context.cardarea == G.play and context.destroy_card == card and SMODS.pseudorandom_probability(card, 'para_ashen_enhance', card.ability.extra.numerator, card.ability.extra.denominator) then
            return { remove = true }
        end
    end
}