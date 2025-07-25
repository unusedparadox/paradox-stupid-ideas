if next(SMODS.find_mod("Talisman")) and Talisman then
SMODS.Joker{ -- < • Astro :3c • > implementation
	key = 'astro',
	pools = {["parajoker"] = true},
	config = { extra = {
		eechips = 1,
		eechips_gain = 0.1,
		numerator_planet = 1,
		denominator_planet = 3,
		nine_counter = 25,
		nine_requirement = 25,
		planet_retrigger = 0,
		planet_retrigger_growth = 1,
		x_probability = 1,
		x_probability_growth = 0.5,
		odds = true -- grab bag compat
	}},
	atlas = 'Jokers_Soul',
	pos = {x = 1, y = 0},
	soul_pos = {x = 1, y = 1},
	cost = 10,
	rarity = "para_prestige",
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue + 1] = G.P_CENTERS["m_lucky"]
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator_planet, card.ability.extra.denominator_planet, 'para_astro_planets')
		return {vars = {card.ability.extra.eechips, card.ability.extra.eechips_gain, new_numerator, new_denominator,
		card.ability.extra.planet_retrigger, card.ability.extra.planet_retrigger_growth, card.ability.extra.nine_requirement,
		card.ability.extra.nine_counter, card.ability.extra.x_probability, card.ability.extra.x_probability_growth}}
	end,
	calculate = function(self, card, context)
		if context.joker_main and context.scoring_name == "Flush" then -- Scores the tetrational chips.
			return {
				eechips = card.ability.extra.eechips
			}
		elseif context.before and not context.blueprint then -- Checks for spades to scale the tetrational chips.
			local scaled = false 
			for _, v in pairs(context.scoring_hand) do
				if v:is_suit("Spades") then
					card.ability.extra.eechips = card.ability.extra.eechips + card.ability.extra.eechips_gain
					juice_card(v)
					scaled = true
				end
			end
			if scaled then -- Shows the scaling message if tetrational chips were scaled
				return {
					message = localize({type = "variable", key = "powpow_chips", vars = {number_format(to_big(card.ability.extra.eechips))}}),
					colour = G.C.DARK_EDITION,
					message_card = card
				}
			end
		elseif context.using_consumeable and context.consumeable.ability.set == "Planet" then -- Check if a planet is used.
			if SMODS.pseudorandom_probability(card, 'para_astro_planets', card.ability.extra.numerator_planet, card.ability.extra.denominator_planet, 'para_astro_planets') then -- Check the 1 in 3 chance.
				for i = 1, card.ability.extra.planet_retrigger do
					context.consumeable:use_consumeable(context.consumeable)
				end
			end
		elseif context.individual and context.cardarea == G.play and not context.blueprint then
			if context.other_card:get_id() == 9 then -- Check for triggered nines
				card.ability.extra.nine_counter = card.ability.extra.nine_counter - 1
				if card.ability.extra.nine_counter == 0 then
					card.ability.extra.nine_counter = card.ability.extra.nine_requirement
					card.ability.extra.planet_retrigger = card.ability.extra.planet_retrigger + card.ability.extra.planet_retrigger_growth
        			return {
        			    message = localize('k_upgrade_ex'),
        			    colour = G.C.SECONDARY_SET.PLANET,
        		    	message_card = card
        			}
				end
			end
			if SMODS.has_enhancement(context.other_card, 'm_lucky') then -- Check for Lucky Cards
				card.ability.extra.x_probability = card.ability.extra.x_probability + card.ability.extra.x_probability_growth
    			return {
    			    message = localize('k_upgrade_ex'),
        		    colour = G.C.GREEN
        		}
			end
		elseif context.mod_probability and not context.blueprint then -- apply xprobability
			return {
				numerator = context.numerator * card.ability.extra.x_probability
			}
		end
	end,
	in_pool = function(self, args)
		local spade_count = 0
		for _, v in ipairs(G.playing_cards) do
			if v:is_suit("Spades") then
				spade_count = spade_count + 1
			end
		end
		return next(SMODS.find_card("j_para_card", true)) and spade_count > 15, { allow_duplicates = false }
	end
}
end