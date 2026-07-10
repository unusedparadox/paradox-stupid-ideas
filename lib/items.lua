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
    end,

    apply = function(self, card, val)
        if val then
            card.ability.para_item = {
                ability = copy_table(self.config),
                key = self.key
            }
        else card.ability.para_item = nil end
    end
}
PSI.shared_items = {}
--Automatically generates consumables for your items if autogen_consumable is true. Set to a table to overwrite consumable defaults.
function PSI.Item:__call(o)
    local ret = SMODS.GameObject:__call(o)
    if ret.autogen_consumable then
        local consumable_args = {
            key = o.key,
            set = "para_Item",
            atlas = o.atlas,
            pos = {x = o.pos.x - 2, y = o.pos.y},
            soul_pos = {x = o.pos.x - 1, y = o.pos.y},
            config = {item = ret.key},
            can_use = function(self, card)
                return G.jokers and (#G.jokers.highlighted == 1)
            end,
            use = function(self, card, area, copier)
                PSI.apply_item(G.jokers.highlighted[1], self.ability.item)
            end,
        }
        if type(ret.autogen_consumable) == "table" then
            consumable_args = SMODS.merge_defaults(ret.autogen_consumable, consumable_args)
        end
        SMODS.Consumable:__call(consumable_args)
    end
    return ret
end

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

-- no loc_txt. im not adding it nobody should be using it anyways
G.localization.descriptions.para_items = {}

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
        local o = item.calculate(self.ability.para_item, self, context)
        if o then
            if not o.card then o.card = self end
            return o
        end
    end
end

-- Item consumable set & Boosters
SMODS.ConsumableType {
    key = 'para_Item',
    primary_colour = HEX('424e54'),
    secondary_colour = HEX('4486bb'),
    collection_rows = { 5, 5 },
    default = 'c_para_pyrite_ring',
    shop_rate = 0,
}

PSI.Item{
    key = "glass_shard",
    badge_colour = HEX('c75985'),
    pos = { x = 5, y = 1 },
    config = {extra = {
        xmult = 1.5,
        numerator = 1,
        odds = 6
    }},
    calculate = function(self, card, context)
        if context.post_joker then
            if SMODS.pseudorandom_probability(self, 'i_para_glass_shard', self.ability.extra.numerator, self.ability.extra.odds, 'i_para_glass_shard') then
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = function()
                        PSI.remove_item(card)
                        play_sound('glass'..math.random(1, 6), math.random()*0.2 + 0.9,0.5)
                        play_sound('generic1', math.random()*0.2 + 0.9,0.5)
                        return true
                    end
                }))
                return {xmult = self.ability.extra.xmult, message = "Shattered!"}
            end
            return {xmult = self.ability.extra.xmult}
        end
    end,
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(self, self.ability.extra.numerator, self.ability.extra.odds, 'i_para_glass_shard')
        return {vars = {self.ability.extra.xmult, num, denom}}
    end
}