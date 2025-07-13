---@diagnostic disable: duplicate-set-field
----------------------------------------------
------------MOD CODE -------------------------
to_big = to_big or function(x) return x end -- Talisman is optional now
-- Hook buying checks
local para_buycheck = G.FUNCS.can_buy
G.FUNCS.can_buy = function(e)
    if next(SMODS.find_card("j_para_green_credit_card", false)) then
        e.config.colour = G.C.ORANGE
        e.config.button = 'buy_from_shop'
    	if e.config.ref_parent and e.config.ref_parent.children.buy_and_use then
    	  if e.config.ref_parent.children.buy_and_use.states.visible then
    	    e.UIBox.alignment.offset.y = -0.6
    	  else
    	    e.UIBox.alignment.offset.y = 0
    	  end
    	end
	else 
		return para_buycheck(e)
	end
end
local para_redeemcheck = G.FUNCS.can_redeem
G.FUNCS.can_redeem = function(e)
	if next(SMODS.find_card("j_para_green_credit_card", false)) then
		e.config.colour = G.C.GREEN
    	e.config.button = 'use_card'
	else
		return para_redeemcheck(e)
	end
end
local para_opencheck = G.FUNCS.can_open
G.FUNCS.can_open = function(e)
	if next(SMODS.find_card("j_para_green_credit_card", false)) then
		e.config.colour = G.C.GREEN
    	e.config.button = 'use_card'
	else
		return para_opencheck(e)
	end
end
-- Hooking the Jimbo quip upon run loss
local para_jimbotalk_old = Card_Character.add_speech_bubble
Card_Character.add_speech_bubble = function(self, arg1, arg2, arg3)
	if G.PROFILES[G.SETTINGS.profile].pineappledeath then
		para_jimbotalk_old(self, 'pineapple', nil, {quip = true})
	else
		para_jimbotalk_old(self, arg1, arg2, arg3)
	end
end
-- Hooking new runs
local para_newrun_old = Game.start_run
Game.start_run = function(self, ...)
 	G.PROFILES[G.SETTINGS.profile].pineappledeath = false
 	return para_newrun_old(self, ...)
end
-- Hooking run loss
local para_youlost_old = Game.update_game_over
Game.update_game_over = function(self, dt)
	if not G.STATE_COMPLETE then
		para_youlost_old(self, dt)
		if G.PROFILES[G.SETTINGS.profile].pineappledeath and G.GAME.round_resets.ante > G.GAME.win_ante then
    	    local Jimbo = nil
    	    G.E_MANAGER:add_event(Event({
    	        trigger = 'after',
    	        delay = 2.5,
    	        blocking = false,
    	        func = (function()
    	            if G.OVERLAY_MENU and G.OVERLAY_MENU:get_UIE_by_ID('jimbo_spot') then 
    	                Jimbo = Card_Character({x = 0, y = 5})
    	                local spot = G.OVERLAY_MENU:get_UIE_by_ID('jimbo_spot')
    	                spot.config.object:remove()
    	                spot.config.object = Jimbo
    	                Jimbo.ui_object_updated = true
    	                para_jimbotalk_old(Jimbo, 'pineapple', nil, {quip = true})
    	                Jimbo:say_stuff(5)
    	                end
    	            return true
            	end)
        	}))
		end
		G.STATE_COMPLETE = true
	end
end
-- Hooks are over

-- Defining ObjectTypes
-- Food jokers: (ty cardsauce for doing all the work for me)
table.contains = function(table, element)
    if table and type(table) == "table" then
        for _, value in pairs(table) do
            if value == element then
                return true
            end
        end
        return false
    end
end
G.foodjokers = {
	-- Balatro (Vanilla)
	['j_gros_michel'] = true,
	['j_ice_cream'] = true,
	['j_cavendish'] = true,
	['j_turtle_bean'] = true,
	['j_popcorn'] = true,
	['j_ramen'] = true, 
	['j_selzer'] = true,
	['j_diet_cola'] = true, 
	['j_egg'] = true, 
	-- Cardsauce
	['j_csau_meat'] = true, 
	['j_csau_fantabulous'] = true,
	['j_csau_crudeoil'] = true,
	['j_csau_grannycream'] = true,
	['j_csau_toeofsatan'] = true,
	['j_csau_chips'] = true,
	['j_csau_mug'] = true,
	-- Cryptid
	['j_cry_pickle'] = true,
	['j_cry_chili_pepper'] = true,
	['j_cry_tropical_smoothie'] = true,
	['j_cry_cotton_candy'] = true,
	['j_cry_wrapped'] = true,
	['j_cry_candy_cane'] = true,
	['j_cry_candy_buttons'] = true,
	['j_cry_jawbreaker'] = true,
	['j_cry_mellowcreme'] = true,
	['j_cry_brittle'] = true,
	['j_cry_caramel'] = true,
	['j_cry_oldcandy'] = true,
	-- Neato's Jokers
	['j_neat_icecreamsandwich'] = true,
	['j_neat_frostedprimerib'] = true,
	['j_neat_bananastand'] = true,
	-- Extra Credit
	['j_ExtraCredit_badapple'] = true,
	['j_ExtraCredit_espresso'] = true,
	['j_ExtraCredit_ambrosia'] = true,
	['j_ExtraCredit_candynecklace'] = true,
	['j_ExtraCredit_compost'] = true,
	['j_ExtraCredit_starfruit'] = true,
	-- Bunco
	['j_bunc_starfruit'] = true,
	-- Ortalab
	['j_ortalab_taliaferro'] = true,
	['j_ortalab_sunnyside'] = true,
	['j_ortalab_hot_chocolate'] = true,
	['j_ortalab_royal_gala'] = true,
	['j_ortalab_fine_wine'] = true,
	['j_ortalab_mystery_soda'] = true,
	['j_ortalab_popcorn_bag'] = true,
	['j_ortalab_salad'] = true,
	-- Paperback
	['j_paperback_apple'] = true,
	['j_paperback_joker_cookie'] = true,
	['j_paperback_nachos'] = true,
	['j_paperback_crispy_taco'] = true,
	['j_paperback_soft_taco'] = true,
	['j_paperback_complete_breakfast'] = true,
	['j_paperback_ghost_cola'] = true,
	['j_paperback_b_soda'] = true,
	['j_paperback_ice_cube'] = true,
	['j_paperback_cream_liqueur'] = true,
	['j_paperback_champagne'] = true,
	['j_paperback_coffee'] = true,
	['j_paperback_matcha'] = true,
	['j_paperback_epic_sauce'] = true,
	['j_paperback_dreamsicle'] = true,
	['j_paperback_cakepop'] = true,
	['j_paperback_caramel_apple'] = true,
	['j_paperback_charred_marshmallow'] = true,
	['j_paperback_rock_candy'] = true,
	['j_paperback_tanghulu'] = true,
	-- Buffoonery
	['j_buf_gfondue'] = true,
	['j_buf_camarosa'] = true,
	-- Aikoyori's Shenanigans
	['j_akyrs_eat_pant'] = true, 
	-- Prism
	['j_prism_pizza_cap'] = true,
	['j_prism_pizza_mar'] = true,
	['j_prism_pizza_for'] = true,
	['j_prism_pizza_ruc'] = true,
	['j_prism_pizza_haw'] = true,
	['j_prism_pizza_det'] = true,
	['j_prism_cookie'] = true,
	['j_prism_whiskey'] = true,
	-- JoeyJokers
	['j_joey_vegemite'] = true,
	-- Plantain
	['j_pl_plantain'] = true,
	['j_pl_apple_pie'] = true,
	['j_pl_grape_soda'] = true,
	['j_pl_raw_meat'] = true,
	-- Grab Bag
	['j_gb_hot_potato'] = true,
	['j_gb_double_gulp'] = true,
	['j_gb_golden_cookie'] = true,
	-- Lucky Rabbit
	['j_fmod_blue_angel_mushroom'] = true,
	['j_fmod_pub_burger'] = true,
}

local function inject(self)
	for k, v in pairs(G.foodjokers) do
		if G.P_CENTERS[k] or SMODS.Centers[k] then
			local center = G.P_CENTERS[k] or SMODS.Centers[k]
			if not table.contains(self, center) then
				self:inject_card(center)
			end
		end
	end
end
if not SMODS.ObjectTypes.Food then
	SMODS.ObjectType({
		key = "Food",
		default = "j_reserved_parking",
		cards = {},
		inject = function(self)
			SMODS.ObjectType.inject(self)
			inject(self)
		end,
	})
else
	local inj_ref = SMODS.ObjectTypes.Food.inject
	SMODS.ObjectType:take_ownership("Food", {
		inject = function(self)
			inj_ref(self)
			inject(self)
		end
	})
end
SMODS.ObjectType{
	key = "parajoker",
	default = "j_para_bluecard"
}
-- End ObjectType definitions
-- Defining useful functions:
para_consumefood = function(card)
	G.E_MANAGER:add_event(Event({
    	func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({
            	trigger = 'after',
            	delay = 0.3,
            	blockable = false,
                func = function()
                	card:remove()
                    return true
                end
            }))
        	return true
    	end
    }))
end
-- End function definitions
-- Create "fake madness" for the yaoi deck
SMODS.Joker{
	key = "fakemadness",
	no_collection = true,
	in_pool = function(self, args)
		return false
	end
}
-- Getting Matador to work with The Singular
SMODS.Joker:take_ownership("matador", {
	calculate = function(self, card, context)
		local triggered = false
        for k, v in pairs(G.jokers.cards) do
            if v.ability and v.ability.para_singular then
                triggered = true
            end
        end
        if context.debuffed_hand or context.joker_main then
            if G.GAME.blind.triggered or triggered then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + 8
                return {
                    dollars = 8,
                    func = function() -- This is for timing purposes, it runs after the dollar manipulation
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
		end
    end
}, true)
-- Increase negative chance for Artistic Deck and Chasm Deck
local oldenegativegetweight = G.P_CENTERS.e_negative.get_weight
SMODS.Edition:take_ownership('e_negative', {
    get_weight = function(self)
        local weight = oldenegativegetweight(self)
        if G.GAME.selected_back.effect.center.key == "b_para_artisticdeck" then
			weight = weight * 15
		elseif G.GAME.selected_back.effect.center.key == "b_para_chasmdeck" then
			weight = weight * 25
		end
        return weight
    end
}, true)
-- Take ownership of Red Card for the achievement
SMODS.Joker:take_ownership("red_card", {
	add_to_deck = function(self, card, from_debuff)
		if next(SMODS.find_card("j_para_yellowcard", true)) and next(SMODS.find_card("j_para_orangecard", true)) and next(SMODS.find_card("j_para_bluecard", true)) then
			check_for_unlock({type = 'cardcollector'})
		end
	end
}, true)
-- Load files
-- im the woker baby
assert(SMODS.load_file("code/rarities.lua"))()
assert(SMODS.load_file("code/jokers.lua"))()
assert(SMODS.load_file("code/backs.lua"))()
assert(SMODS.load_file("code/achievements.lua"))()
assert(SMODS.load_file("code/boosters.lua"))()
--assert(SMODS.load_file("code/stakes.lua"))()
if next(SMODS.find_mod("ChDp")) then -- all my damn challenges need this thing
	assert(SMODS.load_file("code/challenges.lua"))()
end
assert(SMODS.load_file("code/blinds.lua"))()
assert(SMODS.load_file("code/tags.lua"))()
----------------------------------------------
------------MOD CODE END----------------------