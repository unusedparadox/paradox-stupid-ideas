PSI.Item{
    key = "hundred_ton_weight",
    badge_colour = HEX('3e4b4d'),
    autogen_consumable = true,
    pos = { x = 2, y = 0 },
    config = {extra = {
        scale_mult = 1.5
    }},
    calculate = function(self, card, context, item)
        if context.scaling_card and context.card == card then
            if ((context.scalar > 0) ~= (context.operation == "-")) and not (context.message_key and string.find(context.message_key, "minus")) then
                return {
                    override_scalar = context.scalar * item.ability.extra.scale_mult,
                    post = {
                        message = localize("k_para_lifted")
                    }
                }
            end
        end
    end,
    loc_vars = function(self, info_queue, card, item)
        return {vars = {item.ability.extra.scale_mult}}
    end,
    collection_loc_vars = function(self, info_queue, card, item)
        return {vars = {self.config.extra.scale_mult}}
    end
}