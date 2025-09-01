local astro_cost, astro_rarity
if PSI.get_gameset().unfiltered then
	astro_cost = 10
	astro_rarity = "para_prestige"
else
	astro_cost = 6
	astro_rarity = 2
end
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
	cost = astro_cost,
	rarity = astro_rarity,
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		if PSI.get_gameset().unfiltered then
			info_queue[#info_queue + 1] = G.P_CENTERS["m_lucky"]
			local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator_planet, card.ability.extra.denominator_planet, 'para_astro_planets')
			return {key = self.key .. "_unfiltered", vars = {card.ability.extra.eechips, card.ability.extra.eechips_gain, new_numerator, new_denominator,
			card.ability.extra.planet_retrigger, card.ability.extra.planet_retrigger_growth, card.ability.extra.nine_requirement,
			card.ability.extra.nine_counter, card.ability.extra.x_probability, card.ability.extra.x_probability_growth}}
		else
			return {key = self.key .. "_upgraded"}
		end
	end,
	calculate = function(self, card, context)
		if PSI.get_gameset().unfiltered then
			if context.joker_main and context.scoring_name == "Flush" and card.ability.extra.eechips >= 1 then -- Scores the tetrational chips.
				if next(SMODS.find_mod("Talisman")) and Talisman then
					return {
						eechips = card.ability.extra.eechips
					}
				else
					return {
						xchips = math.huge,
						message = "no talisman, just take the naneinf"
					}
				end
			elseif context.before and not context.blueprint then -- Checks for spades to scale the tetrational chips.
				card.ability.extra.odds = true -- Grab Bag
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
					if card.ability.extra.nine_counter <= 0 then
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
		else
			if context.before and not context.blueprint then
				card.ability.extra.odds = false -- Grab Bag
				if context.scoring_name == "Flush" then
					G.E_MANAGER:add_event(Event({
        			    trigger = 'after',
        			    delay = 0.4,
        			    func = function()
        			        play_sound('tarot1')
        			        card:juice_up(0.3, 0.5)
        			        return true
        			    end
        			}))
        			for i = 1, #context.scoring_hand do
        			    local percent = 1.15 - (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
        			    G.E_MANAGER:add_event(Event({
        			        trigger = 'after',
        			        delay = 0.15,
        			        func = function()
        			            context.scoring_hand[i]:flip()
        			            play_sound('card1', percent)
        			            context.scoring_hand[i]:juice_up(0.3, 0.3)
        			            return true
        			        end
        			    }))
        			end
        			delay(0.2)
        			for i = 1, #context.scoring_hand do
        			    G.E_MANAGER:add_event(Event({
        			        trigger = 'after',
        			        delay = 0.1,
        			        func = function()
        			            SMODS.change_base(context.scoring_hand[i], "Spades")
        			            return true
        			        end
        			    }))
        			end
        			for i = 1, #context.scoring_hand do
        			    local percent = 0.85 + (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
        			    G.E_MANAGER:add_event(Event({
        			        trigger = 'after',
        			        delay = 0.15,
        			        func = function()
        			            context.scoring_hand[i]:flip()
        			            play_sound('tarot2', percent, 0.6)
        			            context.scoring_hand[i]:juice_up(0.3, 0.3)
        			            return true
        			        end
        			    }))
        			end
        			delay(0.5)
					return {
						message = localize("para_k_transformed"),
						colour = G.C.SUITS.Spades
					}
				end
			end
		end
	end,
	in_pool = function(self, args)
		local spade_count = 0
		for _, v in ipairs(G.playing_cards) do
			if v:is_suit("Spades") then
				spade_count = spade_count + 1
			end
		end
		return (next(SMODS.find_card("j_para_card", true)) and spade_count > 15 and next(SMODS.find_mod("Talisman")) and Talisman) or PSI.get_gameset().upgraded, { allow_duplicates = false }
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}