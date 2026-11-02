PSI.Item{
    key = "shadow_crystal",
    badge_colour = G.C.DARK_EDITION,
    autogen_consumable = {
        set = "Spectral",
        hidden = true,
        soul_set = "para_item",
        soul_pos = {x = 1, y = 3, draw = function(self, scale_mod, rotate_mod)
            self.children.floating_sprite:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
        end}
    },
    pos = { x = 2, y = 3 },
    config = {extra = {
        value_mult = 1,
        value_increase = 0.25
    }},
    no_sprite = true,
    calculate = function(self, card, context, item)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = item.ability.extra,
                ref_value = "value_mult",
                scalar_value = "value_increase",
                message_key = "para_a_x_generic",
                para_pass_new_value = true,
                message_colour = G.C.DARK_EDITION
            })
        end
    end,
    loc_vars = function(self, info_queue, card, item)
        return {vars = {item.ability.extra.value_mult, item.ability.extra.value_increase}}
    end,
    collection_loc_vars = function(self, info_queue, card, item)
        return {vars = {self.config.extra.value_mult, self.config.extra.value_increase}}
    end
}
-- Check scoring parameters along with this table
PSI.scoring_effects = {
    score = true,
    h_score = true,
    xscore = true,
    x_score = true,
    h_x_score = true,
    h_xscore = true,
    eq_chips = true,
    Eq_chips_mod = true,
    eq_mult = true,
    Eq_mult_mod = true,
    base_mult = true,
    base_chips = true,
    divide_mult = true,
    divide_chips = true,
    subtract_mult = true,
    subtract_chips = true,
    -- in case i change my mind about blind size being counted
    --[[blind_size = true,
    blindsize = true,
    h_blind_size = true,
    h_blindsize = true,
    xblind_size = true,
    x_blind_size = true,
    xblindsize = true,
    h_x_blind_size = true,
    h_xblind_size = true,
    h_x_blindsize = true,
    h_xblindsize = true,]]--
}
PSI.monetary_effects = {
    p_dollars = true,
    dollars = true,
    h_dollars = true
}
local calcjoker = Card.calculate_joker
function Card:calculate_joker(context)
    local ret, ret2 = calcjoker(self, context)
    local newret = ret
    if type(ret) == "table" and self.ability and self.ability.para_item and self.ability.para_item.key == "i_para_shadow_crystal" then
        for k, v in pairs(ret) do
            if SMODS.Scoring_Parameter_Calculation[k] or PSI.scoring_effects[k] or PSI.monetary_effects[k] then
                if string.sub(k, -4) == "_mod" then -- for vanilla jokers
                    newret.message = nil
                    newret[string.sub(k, 1, -5)] = v * self.ability.para_item.ability.extra.value_mult
                    newret[k] = nil
                else
                    newret[k] = v * self.ability.para_item.ability.extra.value_mult
                end
            end
        end
    end
    return newret, ret2
end
local calcdollarbonus = Card.calculate_dollar_bonus
function Card:calculate_dollar_bonus()
    local ret = calcdollarbonus(self)
    if ret and self.ability and self.ability.para_item and self.ability.para_item.key == "i_para_shadow_crystal" then
        ret = ret * self.ability.para_item.ability.extra.value_mult
    end
    return ret
end