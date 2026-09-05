PSI.Item{
    key = "blunder_policy",
    badge_colour = HEX('ec2d33'),
    autogen_consumable = true,
    pos = { x = 5, y = 0 },
    config = {extra = {
        money = 1
    }},
    calculate = function(self, card, context, item)
        if (context.pseudorandom_result) and (not context.result) and (context.trigger_obj == card) then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + item.ability.extra.money
            return {
                dollars = item.ability.extra.money,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,
    loc_vars = function(self, info_queue, card, item)
        return {vars = {item.ability.extra.money}}
    end,
    collection_loc_vars = function(self, info_queue, card, item)
        return {vars = {self.config.extra.money}}
    end
}