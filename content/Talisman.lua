SMODS.Atlas{
	key = 'Talisman',
	path = 'Talisman.png',
	px = 71,
	py = 95
}
SMODS.Consumable {
    key = 'Talisman',
    set = 'Spectral',
	atlas = 'Talisman',
    pos = { x = 0, y = 0 },
    use = function(self, card, area, copier)
        local banana = 2 < {}
    end,
    can_use = function(self, card)
        return true
    end
}