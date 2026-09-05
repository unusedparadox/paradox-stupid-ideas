SMODS.Booster {
    key = "item_small_1",
    config = { extra = 3, choose = 1 },
    cost = 4,
    atlas = "Boosters",
    weight = 1.4,
    pos = { x = 0, y = 1 },
    draw_hand = false,
    kind = "para_item",
    group_key = "para_groupitempack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3)
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4486bb"))
        ease_background_colour({ new_colour = HEX('83a8c3'), special_colour = HEX("4486bb"), contrast = 2 })
    end,
    create_card = function(self, card, i)
        return {set = "para_item", skip_materialize = true, area = G.pack_cards, soulable = true, key_append = "para_itempack"}
    end,
}
SMODS.Booster {
    key = "item_small_2",
    config = { extra = 3, choose = 1 },
    cost = 4,
    atlas = "Boosters",
    weight = 1.4,
    pos = { x = 1, y = 1 },
    draw_hand = false,
    kind = "para_item",
    group_key = "para_groupitempack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3)
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4486bb"))
        ease_background_colour({ new_colour = HEX('83a8c3'), special_colour = HEX("4486bb"), contrast = 2 })
    end,
    create_card = function(self, card, i)
        return {set = "para_item", skip_materialize = true, area = G.pack_cards, soulable = true, key_append = "para_itempack"}
    end,
}
SMODS.Booster {
    key = "item_jumbo",
    config = { extra = 5, choose = 1 },
    cost = 6,
    atlas = "Boosters",
    weight = 0.7,
    pos = { x = 2, y = 1 },
    draw_hand = false,
    kind = "para_item",
    group_key = "para_groupitempack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4486bb"))
        ease_background_colour({ new_colour = HEX('83a8c3'), special_colour = HEX("4486bb"), contrast = 2 })
    end,
    create_card = function(self, card, i)
        return {set = "para_item", skip_materialize = true, area = G.pack_cards, soulable = true, key_append = "para_itempack"}
    end,
}
SMODS.Booster {
    key = "item_mega",
    config = { extra = 5, choose = 2 },
    cost = 8,
    atlas = "Boosters",
    weight = 0.175,
    pos = { x = 3, y = 1 },
    draw_hand = false,
    kind = "para_item",
    group_key = "para_groupitempack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4486bb"))
        ease_background_colour({ new_colour = HEX('83a8c3'), special_colour = HEX("4486bb"), contrast = 2 })
    end,
    create_card = function(self, card, i)
        return {set = "para_item", skip_materialize = true, area = G.pack_cards, soulable = true, key_append = "para_itempack"}
    end,
}