PSI.Items = {}
PSI.Item = SMODS.GameObject:extend {
    obj_table = PSI.Items,
    obj_buffer = {},
    class_prefix = "i",
    should_apply = false,
    config = {},
    rate = 0,
    set = "para_items",
    atlas = "para_Items",

    draw = function(self, card)
        --[[G.shared_stickers[self.key].role.draw_major = card

        local scale_mod = 0.07 + 0.02*math.sin(1.8*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
        local rotate_mod = 0.05*math.sin(1.219*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
        G.shared_stickers[self.key]:draw_shader('dissolve',0, nil, nil, card.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
        G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod)
        if self.shiny then G.shared_stickers[self.key]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center) end]]--
    end,
    inject = function(self)
        self.item_sprite = SMODS.create_sprite(0, 0, G.CARD_W, G.CARD_H, self.atlas, self.pos)
        PSI.shared_items[self.key] = self.item_sprite
        --autocreate consumables. set to a table to overwrite parameters
        if self.autogen_consumable and not self.consumable_generated then
            local consumable_args = {
                key = self.original_key,
                set = "para_item",
                atlas = self.atlas or "para_Items",
                pos = {x = self.pos.x - 2, y = self.pos.y},
                soul_pos = {x = self.pos.x - 1, y = self.pos.y},
                config = {extra = {item = self.key, jokers = 1}},
                loc_txt = {
                    name = "#1#",
                    text = {
                        "Apply {C:attention}#1#",
                        "to #2#{C:attention}#3#{} selected {C:attention}Joker#4#"
                    }
                },
                can_use = function(self, card)
                    return G.jokers and (#G.jokers.highlighted >= 1) and (#G.jokers.highlighted <= card.ability.extra.jokers)
                end,
                loc_vars = function(self,info_queue,card)
                    info_queue[#info_queue + 1] = {set = "para_items", key = card.ability.extra.item,
                    vars = PSI.Items[card.ability.extra.item].collection_loc_vars and PSI.Items[card.ability.extra.item]:collection_loc_vars(info_queue).vars or nil}
                	return {vars = {localize({type = "name_text", set = "para_items", key = card.ability.extra.item}),
                    (card.ability.extra.jokers < 2 and "" or "up to "), card.ability.extra.jokers, card.ability.extra.jokers >= 2 and "s" or ""}}
                end,
                use = function(self, card, area, copier)
                    PSI.apply_item(G.jokers.highlighted[1], card.ability.extra.item)
                end,
            }
            if type(self.autogen_consumable) == "table" then
                consumable_args = SMODS.merge_defaults(self.autogen_consumable, consumable_args)
            end
            local autogenned_consumable = SMODS.Consumable:__call(consumable_args)
            if autogenned_consumable._discovered_unlocked_overwritten then
                autogenned_consumable.discovered, autogenned_consumable.unlocked = autogenned_consumable._d, autogenned_consumable._u
                autogenned_consumable._discovered_unlocked_overwritten = false
            else
                SMODS._save_d_u(autogenned_consumable)
            end
            autogenned_consumable:inject()
            autogenned_consumable:process_loc_text()
            self.consumable_generated = true
        end
    end,

    apply = function(self, card, val)
        if val then
            card.ability.para_item = {
                ability = copy_table(self.config),
                key = self.key
            }
        else card.ability.para_item = nil end
    end,
    order = 0,
}
PSI.shared_items = {}

-- draw items on the joker
SMODS.DrawStep {
    key = 'item',
    order = 61,
    func = function(self)
        if self.ability.para_item then
            local item = PSI.shared_items[self.ability.para_item.key]
            item.role.draw_major = self

            local scale_mod = 0.07 + 0.02*math.sin(1.8*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
            local rotate_mod = 0.05*math.sin(1.219*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
            item:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
            item:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
            if self.shiny then item:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center) end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}

--takes a card and an item/item key to apply on it
PSI.apply_item = function(card, item)
    if card.ability.para_item then PSI.remove_item(card) end
    local itemapplied = item
    if type(item) == "string" then
        itemapplied = PSI.Items[item]
    end
    itemapplied:apply(card, true)
    if itemapplied.on_apply then itemapplied:on_apply(card) end
end
--remove a card's item (if it has one)
PSI.remove_item = function(card)
    local itemremoved = PSI.Items[card.ability.para_item.key]
    itemremoved:apply(card, false)
    if type(itemremoved.on_remove) == "function" then itemremoved:on_remove(card) end
end

-- calculate the item effect on a card
function Card:calculate_item(context)
    local item = PSI.Items[self.ability.para_item.key]
    if item and item.calculate then
        local o = item:calculate(self, context, self.ability.para_item)
        if o then
            if not o.card then o.card = self end
            return o
        end
    end
end

-- Item consumable set & Boosters
SMODS.ConsumableType {
    key = 'para_item',
    primary_colour = HEX('424e54'),
    secondary_colour = HEX('4486bb'),
    collection_rows = { 5, 5 },
    default = 'c_para_glass_shard',
    shop_rate = 0,
}

--items in collection
SMODS.current_mod.custom_collection_tabs = function()
    local amount = #PSI.Item.obj_buffer
    return {
        UIBox_button({
            button = 'your_collection_para_items_notcards',
            id = 'your_collection_para_items_notcards',
            label = { localize('para_ui_items') },
            count = { tally = amount, of = amount },
            minw = 5,
            minh = 1
        })
    }
end
G.FUNCS.your_collection_para_items_notcards = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(PSI.Items, { 6, 5 }, {
            snap_back = true,
            hide_single_page = true,
            collapse_single_page = true,
            center = 'j_joker',
            h_mod = 1.03,
            --back_func = 'your_collection_other_gameobjects',
            modify_card = function(card, center)
                card.ignore_pinned = true
                PSI.apply_item(card, center.key)
            end,
        })
    }
end
function Card:calculate_dollar_bonus_item()
    if not self.ability.para_item then return end
    local obj = PSI.Items[self.ability.para_item.key]
    if obj.calc_dollar_bonus and type(obj.calc_dollar_bonus) == 'function' then
        return obj:calc_dollar_bonus(self, self.ability.para_item)
    end
end