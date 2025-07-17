SMODS.Atlas{
	key = "Tarots",
	path = "Tarots.png",
	px = 71,
	py = 95,
}
SMODS.Consumable {
    key = 'arson',
    set = 'Tarot',
    atlas = "Tarots",
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 3, mod_conv = 'm_para_ashen' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}