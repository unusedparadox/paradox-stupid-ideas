SMODS.Atlas{ -- Atlas for Backs
	key = 'Backs',
	path = 'Backs.png',
	px = 71,
	py = 95
}
if next(SMODS.find_mod("Talisman")) and Talisman and (Talisman.config_file.score_opt_id >= 2) then
	SMODS.Back{
	    key = "hundreddeck",
	    unlocked = true,
		config = {extra = {
			joker_slots = 100,
			dollars = 100,
			hands = 100,
			discards = 100,
			consumable_slots = 100,
			hand_size = 100,
			winning_ante = 100,
		}},
		atlas = 'Backs',
		pos = {x = 0, y = 0},
		loc_vars = function(self,info_queue,card)
			return {vars = {self.config.extra.joker_slots, self.config.extra.dollars, self.config.extra.hands, self.config.extra.discards, self.config.extra.consumable_slots, self.config.extra.hand_size, self.config.extra.winning_ante}}
		end,
	    apply = function(self, back)
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
			G.GAME.starting_params.dollars = G.GAME.starting_params.dollars + self.config.extra.dollars
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
			G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.extra.discards
			G.GAME.starting_params.consumable_slots = G.GAME.starting_params.consumable_slots + self.config.extra.consumable_slots
			G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size
			G.GAME.win_ante = G.GAME.win_ante + self.config.extra.winning_ante
	    end
	}
end
SMODS.Back{
    key = "bonniedeck",
    unlocked = true,
	config = {extra = {
		food_jokers = 2
	}},
	atlas = 'Backs',
	pos = {x = 1, y = 0},
	loc_vars = function(self,info_queue,card)
		return {vars = {self.config.extra.food_jokers}}
	end,
    apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_para_bonnie',
					edition = e_base,
					no_edition = true,
					stickers = {"eternal"}
				})
                card:add_to_deck()
                G.jokers:emplace(card)
				card:set_edition(nil, true, true)
				for i=1,self.config.extra.food_jokers do
					local card2 = SMODS.create_card({
						set = "Food",
						area = G.jokers,
						key_append = "friend inside me"
					})
                	card2:add_to_deck()
                	G.jokers:emplace(card2)
				end
                return true
                end
            })
		)
    end
}
local unlockednaneinf = true
local unlock_condition_naneinf = function(self, args) return true end
if next(SMODS.find_mod("Talisman")) and Talisman and (Talisman.config_file.score_opt_id >= 2) then
	unlockednaneinf = false
	unlock_condition_naneinf = function(self, args)
		if args.type == "chip_score" and to_big(args.chips) >= to_big(1.8) * (to_big(10) ^ to_big(308)) then
			return true
		end
	end
end
SMODS.Back{
    key = "naneinfdeck",
    unlocked = unlockednaneinf,
	atlas = 'Backs',
	pos = {x = 2, y = 0},
	config = {extra = {
		winning_ante = 39
	}},
	loc_vars = function(self,info_queue,card)
		return {vars = {self.config.extra.winning_ante}}
	end,
    apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_baron',
					edition = e_negative,
					stickers = {"eternal"}
				})
                card:add_to_deck()
                G.jokers:emplace(card)
				card:set_edition({ negative = true })
				local card2 = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_mime',
					edition = e_negative,
					stickers = {"eternal"}
				})
                card2:add_to_deck()
                G.jokers:emplace(card2)
				card2:set_edition({ negative = true })
				for k, v in pairs(G.playing_cards) do
					v:set_seal("Red", nil, true)
					v:set_ability(G.P_CENTERS["m_steel"])
					SMODS.change_base(v, nil, "King")
				end
				G.GAME.win_ante = self.config.extra.winning_ante
				return true
			end
        })
		)
    end,
	check_for_unlock = unlock_condition_naneinf
}
SMODS.Back{
	key = "yurideck",
	unlocked = true,
	atlas = "Backs",
	pos = {x = 3, y = 0},
	config = {extra = {
		joker_slots = -1,
		hands = -1,
	}},
	loc_vars = function(self, info_queue, card)
		return {vars = {self.config.extra.joker_slots, self.config.extra.hands}}
	end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_blueprint',
					edition = e_base,
					stickers = {"eternal"}
				})
                card:add_to_deck()
                G.jokers:emplace(card)
				card:set_edition(nil, true, true)
				local card2 = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_brainstorm',
					edition = e_base,
					stickers = {"eternal"}
				})
                card2:add_to_deck()
                G.jokers:emplace(card2)
				card2:set_edition(nil, true, true)
				return true
			end
        }))
		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
		G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
	end
}
SMODS.Back{
	key = "yaoideck",
	unlocked = true,
	atlas = "Backs",
	pos = {x = 6, y = 0},
	config = {extra = {
		joker_slots = -1,
		hands = -1,
	}},
	loc_vars = function(self, info_queue, card)
		return {vars = {self.config.extra.joker_slots, self.config.extra.hands}}
	end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_madness',
					edition = e_base,
					stickers = {"eternal"}
				})
                card:add_to_deck()
                G.jokers:emplace(card)
				card:set_edition(nil, true, true)
				local card2 = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_vagabond',
					edition = e_base,
					stickers = {"eternal"}
				})
                card2:add_to_deck()
                G.jokers:emplace(card2)
				card2:set_edition(nil, true, true)
				return true
			end
        }))
		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
		G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
	end
}
-- Create "fake madness" for the yaoi deck
SMODS.Joker{
	key = "fakemadness",
	no_collection = true,
	in_pool = function(self, args)
		return false
	end
}
-- Bad game design but funny as hell
SMODS.Back{
    key = "artisticdeck",
    unlocked = false,
	config = {extra = {
		joker_slots = -5,
		hand_size = 10
	}},
	atlas = 'Backs',
	pos = {x = 7, y = 0},
	loc_vars = function(self,info_queue,card)
		return {vars = {self.config.extra.joker_slots, self.config.extra.hand_size}}
	end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_painted'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_painted' }
        end

        return { vars = { other_name } }
    end,
    apply = function(self, back)
		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
		G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_painted') > 7
    end
}
SMODS.Back{
    key = "voiddeck",
    unlocked = false,
	config = {extra = {
		joker_slots = 3,
		hands = -3
	}},
	atlas = 'Backs',
	pos = {x = 5, y = 0},
	loc_vars = function(self,info_queue,card)
		return {vars = {self.config.extra.joker_slots, self.config.extra.hands}}
	end,
    apply = function(self, back)
		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
		G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_black') > 7
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_black'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_black' }
        end

        return { vars = { other_name } }
    end,
}
SMODS.Back{
    key = "chasmdeck",
    unlocked = false,
	config = {extra = {
		joker_slots = -5,
		hands = -3,
		hand_size = 16
	}},
	atlas = 'Backs',
	pos = {x = 4, y = 0},
	loc_vars = function(self,info_queue,card)
		return {vars = {self.config.extra.joker_slots, self.config.extra.hands, self.config.extra.hand_size}}
	end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name_a = localize('k_unknown')
		local other_name_b = localize('k_unknown')
        if G.P_CENTERS['b_para_voiddeck'].unlocked then
            other_name_a = localize { type = 'name_text', set = 'Back', key = 'b_para_voiddeck' }
        end
        if G.P_CENTERS['b_para_artisticdeck'].unlocked then
            other_name_b = localize { type = 'name_text', set = 'Back', key = 'b_para_artisticdeck' }
        end
        return { vars = { other_name_a, other_name_b } }
    end,
    apply = function(self, back)
		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
		G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
		G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_para_voiddeck') > 7 and get_deck_win_stake('b_para_artisticdeck') > 7
    end
}
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