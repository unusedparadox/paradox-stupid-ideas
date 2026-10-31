PSI.Item{
    key = "lizard_tail",
    badge_colour = HEX('56a786'),
    badge_text_colour = G.C.BLACK,
    autogen_consumable = true,
    pos = { x = 8, y = 2 },
    calculate = function(self, card, context, item)
        if context.joker_type_destroyed and context.card == card then
            return {
                no_destroy = true,
                func = function()
                    PSI.remove_item(card)
                end,
                message = localize("k_para_shed")
            }
        end
    end,
}