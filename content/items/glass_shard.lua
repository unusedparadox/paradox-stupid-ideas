PSI.Item{
    key = "glass_shard",
    badge_colour = HEX('ccfdff'),
    badge_text_colour = G.C.BLACK,
    autogen_consumable = true,
    pos = { x = 5, y = 1 },
    config = {extra = {
        xmult = 1.5,
        numerator = 1,
        odds = 6
    }},
    calculate = function(self, card, context, item)
        if context.post_joker then
            if SMODS.pseudorandom_probability(item, 'i_para_glass_shard', item.ability.extra.numerator, item.ability.extra.odds, 'i_para_glass_shard') then
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = function()
                        PSI.remove_item(card)
                        play_sound('glass'..math.random(1, 6), math.random()*0.2 + 0.9,0.5)
                        play_sound('generic1', math.random()*0.2 + 0.9,0.5)
                        return true
                    end
                }))
                return {xmult = item.ability.extra.xmult, message = "Shattered!"}
            end
            return {xmult = item.ability.extra.xmult}
        end
    end,
    loc_vars = function(self, info_queue, card, item)
        local num, denom = SMODS.get_probability_vars(item, item.ability.extra.numerator, item.ability.extra.odds, 'i_para_glass_shard')
        return {vars = {item.ability.extra.xmult, num, denom}}
    end,
    collection_loc_vars = function(self, info_queue, card, item)
        local num, denom = SMODS.get_probability_vars(self, self.config.extra.numerator, self.config.extra.odds, 'i_para_glass_shard')
        return {vars = {self.config.extra.xmult, num, denom}}
    end
}