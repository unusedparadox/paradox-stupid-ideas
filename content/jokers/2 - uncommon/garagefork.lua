SMODS.Joker{
	key = 'garagefork',
	config = { extra = {
		numerator = 1,
		denominator = 6,
        odds = true -- grab bag
	}
	},
	pools = { ["parajoker"] = true },
	rarity = 2,
	cost = 7,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'Jokers',
	pos = {x = 1, y = 2},
	loc_vars = function(self,info_queue,card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card,
		card.ability.extra.numerator, card.ability.extra.denominator, 'para_garagefork')
		return {vars = {new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.open_booster and context.card.config.center.kind == "Celestial" then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then break
				elseif G.jokers.cards[i].config.center.key == "j_para_garagefork" then return end
            end
			G.FUNCS.draw_from_deck_to_hand()
		end
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}
-- Hook card creation to check for Arcana or Celestial packs
local createcardold = create_card
create_card = function(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local spect_fork
    if key_append == "ar1" or key_append == "pl1" then
        for _, v in ipairs(SMODS.find_card("j_para_garagefork", false)) do
            if SMODS.pseudorandom_probability(v, 'para_garagefork', v.ability.extra.numerator,
            v.ability.extra.denominator, 'para_garagefork') then
                spect_fork = true
                break
            end
        end
    end
    if spect_fork then
        return createcardold("Spectral", area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    else
        return createcardold(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    end
end