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
        if context.end_of_round and context.main_eval then
            SMODS.scale_card{
                card = card,
                ref_table = item.ability.extra,
                ref_value = "value_mult",
                scalar = item.ability.extra.value_increase,
                message = localize{type='variable',key="para_a_x_generic",vars={item.ability.extra.value_increase}},
                color = G.C.DARK_EDITION
            }
        end
    end,
    loc_vars = function(self, info_queue, card, item)
        return {vars = {item.ability.extra.value_mult, item.ability.extra.value_increase}}
    end,
    collection_loc_vars = function(self, info_queue, card, item)
        return {vars = {self.config.extra.value_mult, self.config.extra.value_increase}}
    end
}