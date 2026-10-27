PSI.Item{
    key = "pyrite_ring",
    badge_colour = HEX('bd9f6c'),
    autogen_consumable = true,
    pos = { x = 8, y = 1 },
    config = {extra = {
        bonus_value = 5
    }},
    on_apply = function(self, card, item)
        card.ability.extra_value = (card.ability.extra_value or 0) + item.ability.extra.bonus_value
        card:set_cost()
    end,
    on_remove = function(self, card, item)
        card.ability.extra_value = (card.ability.extra_value or 0) - item.ability.extra.bonus_value
        card:set_cost()
    end,
    loc_vars = function(self, info_queue, card, item)
        return {vars = {item.ability.extra.bonus_value}}
    end,
    collection_loc_vars = function(self, info_queue, card, item)
        return {vars = {self.config.extra.bonus_value}}
    end
}