PSI.Item{
    key = "trick_die",
    badge_colour = HEX('56a786'),
    autogen_consumable = true,
    pos = { x = 5, y = 2 },
}
local pseudoprob = SMODS.pseudorandom_probability
function SMODS.pseudorandom_probability(trigger_obj, seed, base_numerator, base_denominator, identifier, no_mod)
    local result = pseudoprob(trigger_obj, seed, base_numerator, base_denominator, identifier, no_mod)
    if not result and type(trigger_obj.ability) == "table" and type(trigger_obj.ability.para_item) == "table"
    and trigger_obj.ability.para_item.key == "i_para_trick_die" then
        local numerator, denominator = SMODS.get_probability_vars(trigger_obj, base_numerator, base_denominator, identifier or seed, true, no_mod)
        local result2 = pseudorandom(seed) < numerator / denominator
        SMODS.post_prob = SMODS.post_prob or {}
        SMODS.post_prob[#SMODS.post_prob+1] = {pseudorandom_result = true, result = result2, trigger_obj = trigger_obj, numerator = numerator, denominator = denominator, identifier = identifier or seed}
        return result2
    end
    return result
end