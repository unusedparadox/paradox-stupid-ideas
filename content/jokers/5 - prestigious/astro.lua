PSI.astro_list = {
	Vanilla = {},
	paradox_ideas = {["j_para_astro"] = true, ["j_para_astro_unfiltered"] = true},
	funnycats = {['j_funnycats_cat_astro'] = true, ['j_funnycats_glorpsto'] = true},
	starspace = {['j_star_astro'] = true, ['j_star_scrap'] = true, ['j_star_glorp'] = true}
}
local detect_astro = function(joker)
	local joker_source = joker.config.center.original_mod
	if joker_source then
		joker_source = joker_source.get_id
	else
		joker_source = "Vanilla"
	end
	if PSI.astro_list[joker_source] then
		return PSI.astro_list[joker_source][joker.config.center.key]
	end
	if string.match(string.lower(G.localization.descriptions.Joker[joker.config.center.key].name), "astro") then
		local _, endIndex = string.find(string.lower(G.localization.descriptions.Joker[joker.config.center.key].name), "astro")
		if string.sub(string.lower(G.localization.descriptions.Joker[joker.config.center.key].name), endIndex, endIndex + 2) == "nom" then
			return false
		else
			return true
		end
	else
		return false
	end
end
SMODS.Joker{ -- < • Astro :3c • > implementation
	key = 'astro_unfiltered',
	pools = {["parajoker"] = true},
	config = { extra = {
		echips = 1,
		echips_gain = 0.1,
		numerator_planet = 1,
		denominator_planet = 3,
		nine_counter = 25,
		nine_requirement = 25,
		planet_retrigger = 0,
		planet_retrigger_growth = 1,
		x_probability = 1,
		x_probability_growth = 0.5,
		xchips = 1,
		xchips_gain = 0.25,
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
		if PSI.get_infobox_settings().extra then
			info_queue[#info_queue + 1] = { set = "Other", key = "para_explain_suit_Spades"}
			info_queue[#info_queue + 1] = { set = "Other", key = "para_planets_explain"}
		end
		info_queue[#info_queue + 1] = G.P_CENTERS["m_lucky"]
		info_queue[#info_queue + 1] = { set = "Other", key = "para_astro_joker_classify"}
		if PSI.get_infobox_settings().extra and G.GAME.current_round.para_astro_card and G.GAME.current_round.para_astro_card.suit ~= "Spades" then
			info_queue[#info_queue + 1] = { set = "Other", key = "para_explain_suit_"..G.GAME.current_round.para_astro_card.suit}
		end
		local suit = (G.GAME.current_round.para_astro_card or {}).suit or 'Spades'
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator_planet, card.ability.extra.denominator_planet, 'para_astro_unfiltered_planets')
		local time = localize("para_times")
		if card.ability.extra.planet_retrigger == 1 then time = localize("para_time") end
		return {vars = {card.ability.extra.echips, card.ability.extra.echips_gain, new_numerator, new_denominator,
		card.ability.extra.planet_retrigger, time, card.ability.extra.planet_retrigger_growth, card.ability.extra.nine_requirement,
		card.ability.extra.nine_counter, card.ability.extra.x_probability, card.ability.extra.x_probability_growth, card.ability.extra.xchips,
		card.ability.extra.xchips_gain, localize(suit, 'suits_plural'), colours = {G.C.SUITS[suit]}}}
	end,
	no_collection = PSI.get_gameset().upgraded,
	calculate = function(self, card, context)
		if context.joker_main and context.scoring_name == "Flush" and card.ability.extra.echips ~= 1 then -- Scores the exponential chips.
			if next(SMODS.find_mod("Talisman")) and Talisman then
				return {
					echips = card.ability.extra.echips
				}
			else
				return PSI.echips_return(card.ability.extra.echips)
			end
		elseif context.before and not context.blueprint then -- Checks for spades to scale the exponential chips and the random suit to scale the xchips.
			local scaled = false
			local extra = nil
			for _, v in pairs(context.scoring_hand) do
				if v:is_suit("Spades") then
					card.ability.extra.echips = card.ability.extra.echips + card.ability.extra.echips_gain
					juice_card(v)
					scaled = true
				end
			end
			if next(context.poker_hands["Flush"]) then -- Check for Flush.
				local req = SMODS.four_fingers("Flush") -- Check how many cards are required for a Flush
				local count = 0
				for _, v in ipairs(context.scoring_hand) do
					if v:is_suit(G.GAME.current_round.para_astro_card.suit) then
						count = count + 1
					end
				end
				if count >= req then -- Scale and set the extra table if hand contains a Flush and at least the requirement for a flush of the given suit.
					card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_gain
					extra = {
						message = localize({type = "variable", key = "a_xchips", vars = {number_format(to_big(card.ability.extra.xchips))}}),
						colour = G.C.CHIPS
					}
				end
			end
			if scaled then -- Shows the scaling message if exponential chips were scaled
				return {
					message = localize({type = "variable", key = "pow_chips", vars = {number_format(to_big(card.ability.extra.echips))}}),
					colour = G.C.DARK_EDITION,
					message_card = card,
					extra = extra
				}
			end
			if extra then
				return extra
			end
		elseif context.using_consumeable and context.consumeable.ability.set == "Planet" then -- Check if a planet is used.
			if SMODS.pseudorandom_probability(card, 'para_astro_unfiltered_planets', card.ability.extra.numerator_planet, card.ability.extra.denominator_planet, 'para_astro_unfiltered_planets') then -- Check the 1 in 3 chance.
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
		elseif context.other_joker and card.ability.extra.xchips ~= 1 and detect_astro(context.other_joker) then -- Check for Astro and apply xchips.
			return {
				xchips = card.ability.extra.xchips
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
		return next(SMODS.find_card("j_para_card", true)) and spade_count > 15 and PSI.get_gameset().unfiltered, { allow_duplicates = false }
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	},
	pronouns = "he_him"
}
function PSI.reset_astro_suit()
    G.GAME.current_round.para_astro_card = G.GAME.current_round.para_astro_card or { suit = 'Spades' }
    local astro_suits = {}
    for _, v in ipairs({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
        if v ~= G.GAME.current_round.para_astro_card.suit then astro_suits[#astro_suits + 1] = v end
    end
    local astro_card = pseudorandom_element(astro_suits, 'para_astro_unfiltered_suit' .. G.GAME.round_resets.ante)
    G.GAME.current_round.para_astro_card.suit = astro_card
end
function SMODS.current_mod.reset_game_globals(run_start)
    PSI.reset_astro_suit()
end