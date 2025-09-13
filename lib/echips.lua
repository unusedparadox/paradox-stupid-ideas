SMODS.Sound({
	key = "echips",
	path = "ExponentialChips.wav"
})
PSI.echips_return = function(echips)
	return {
		xchips = (hand_chips ^ (echips - 1)),
		colour = G.C.DARK_EDITION,
		message = localize({type = "variable", key = "pow_chips", vars = {number_format(to_big(echips))}}),
		remove_default_message = true,
		sound = "para_echips"
	}
end