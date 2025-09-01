local prestige_grad = SMODS.Gradient{
    key = "prestige_grad",
    colours = {HEX("D9D61C"), HEX("D9A22B")},
    cycle = 10
}
SMODS.Rarity{
    key = "prestige",
	loc_txt = {},
    badge_colour = prestige_grad,
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.0005,
	get_weight = function(self, weight, object_type)
		if PSI.get_gameset().unfiltered then
			return 0.0005
		else
			return 0
		end
	end
}