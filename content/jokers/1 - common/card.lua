local c_collection
if PSI.get_gameset().unfiltered then
	c_collection = true
else
	c_collection = false
end
SMODS.Joker{ -- card implementation
    key = "card",
    blueprint_compat = true,
    rarity = 1,
    cost = 1,
	atlas = 'Jokers',
	pools = {["parajoker"] = true},
    pos = { x = 9, y = 1 },
	config = {extra = {
		chips = 1,
		eeechips = 2,
		requirement = 5
	}},
	no_collection = not c_collection,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips}}
	end,
	calculate = function(self, card, context)
		local supercard = (#SMODS.find_card("j_para_card", false) >= card.ability.extra.requirement) and next(SMODS.find_mod("Talisman"))
		if context.joker_main and not supercard then
			return {
				chips = card.ability.extra.chips
			}
		elseif context.joker_main and supercard then
			return {
				eeechips = card.ability.extra.eeechips
			}
		end
	end,
	in_pool = function(self, args)
		return PSI.get_gameset().unfiltered, {allow_duplicates = true}
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}