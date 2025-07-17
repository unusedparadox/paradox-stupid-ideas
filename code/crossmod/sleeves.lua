SMODS.Atlas{
    key = "Sleeves",
    path = 'Sleeves.png',
	px = 73,
	py = 95
}
CardSleeves.Sleeve {
    key = "yurisleeve",
    atlas = "Sleeves",
    unlocked = true,
    pos = { x = 0, y = 0 },
	config = {extra = {
		joker_slots = -1,
		hands = -1,
	}},
	loc_vars = function(self, info_queue, card)
        local key, vars
        if self.get_current_deck_key() == "b_para_yurideck" then
            key = self.key .. "_alt"
            vars = { self.config.extra.joker_slots }
        else
            key = self.key
            vars = {self.config.extra.joker_slots, self.config.extra.hands}
        end
		return {key = key, vars = vars}
	end,
	apply = function(self, sleeve)
		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
		local edition = "e_base"
		if self.get_current_deck_key() == "b_para_yurideck" then edition = "e_negative" end
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_blueprint',
					edition = edition,
					stickers = {"eternal"}
				})
                card:add_to_deck()
                G.jokers:emplace(card)
				card:set_edition(nil, true, true)
				local card2 = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_brainstorm',
					edition = edition,
					stickers = {"eternal"}
				})
                card2:add_to_deck()
                G.jokers:emplace(card2)
				card2:set_edition(nil, true, true)
				return true
			end
        }))
		if self.get_current_deck_key() ~= "b_para_yurideck" then
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
		end
	end
}
CardSleeves.Sleeve {
    key = "voidsleeve",
    atlas = "Sleeves",
    unlocked = true,
    pos = { x = 2, y = 0 },
	config = {extra = {
		joker_slots = 3,
		hands = -3,
		discards = -3,
	}},
	loc_vars = function(self,info_queue,card)
        local key, vars
		if self.get_current_deck_key() == "b_para_voiddeck" or self.get_current_deck_key() == "b_para_chasmdeck" or self.get_current_deck_key() == "b_black" then
            key = self.key .. "_alt"
            vars = {self.config.extra.joker_slots, self.config.extra.discards}
		else
			key = self.key
			vars = {self.config.extra.joker_slots, self.config.extra.hands}
		end
		return {key = key, vars = vars}
	end,
    apply = function(self, sleeve)
		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
		if self.get_current_deck_key() == "b_para_voiddeck" or self.get_current_deck_key() == "b_para_chasmdeck" or self.get_current_deck_key() == "b_black" then
			G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.extra.discards
		else
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
		end
    end,
}
CardSleeves.Sleeve {
    key = "chasmsleeve",
    atlas = "Sleeves",
    unlocked = true,
    pos = { x = 1, y = 0 },
	config = {extra = {
		joker_slots_base = -5,
		joker_slots_painted = -4,
		joker_slots_black = -6,
		hands = -3,
		hand_size_base = 16,
		hand_size_void = 22,
		hand_size_black = 18,
		discards = -3,
		selection_limit_base = 3,
		selection_limit_painted = 7,
	}},
	loc_vars = function(self,info_queue,card)
        local key, vars
		if self.get_current_deck_key() == "b_para_chasmdeck" then
            key = self.key .. "_alt1"
            vars = {self.config.extra.discards, self.config.extra.selection_limit_base}
		elseif self.get_current_deck_key() == "b_para_voiddeck" then
			key = self.key .. "_alt2"
			vars = {self.config.extra.discards, self.config.extra.hand_size_void}
		elseif self.get_current_deck_key() == "b_black" then
			key = self.key .. "_alt3"
			vars = {self.config.extra.joker_slots_black, self.config.extra.discards, self.config.extra.hand_size_black}
		elseif self.get_current_deck_key() == "b_painted" then
			key = self.key .. "_alt4"
			vars = {self.config.extra.joker_slots_painted, self.config.extra.hands, self.config.extra.selection_limit_painted}
		elseif self.get_current_deck_key() == "b_para_artisticdeck" then
			key = self.key .. "_alt5"
			vars = {self.config.extra.hands, self.config.extra.selection_limit_base}
		else
			key = self.key
			vars = {self.config.extra.joker_slots_base, self.config.extra.hands, self.config.extra.hand_size_base}
		end
		return {key = key, vars = vars}
	end,
    apply = function(self, sleeve)
		if self.get_current_deck_key() == "b_para_chasmdeck" then
			G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.extra.discards
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = (function()
                    G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + sleeve.config.extra.selection_limit_base
                    if SMODS.change_play_limit and SMODS.change_discard_limit then
                        -- future proofing?
                        SMODS.change_play_limit(sleeve.config.extra.selection_limit_base)
                        SMODS.change_discard_limit(sleeve.config.extra.selection_limit_base)
                    end
                    return true
                end)
            }))
		elseif self.get_current_deck_key() == "b_para_voiddeck" then
			G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.extra.discards
			G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size_void
		elseif self.get_current_deck_key() == "b_black" then
			G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.extra.discards
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_black
			G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size_black
		elseif self.get_current_deck_key() == "b_painted" then
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_painted
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
			G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.extra.discards
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = (function()
                    G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + sleeve.config.extra.selection_limit_painted
                    if SMODS.change_play_limit and SMODS.change_discard_limit then
                        -- future proofing?
                        SMODS.change_play_limit(sleeve.config.extra.selection_limit_painted)
                        SMODS.change_discard_limit(sleeve.config.extra.selection_limit_painted)
                    end
                    return true
                end)
            }))
		elseif self.get_current_deck_key() == "b_para_artisticdeck" then
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = (function()
                    G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + sleeve.config.extra.selection_limit_base
                    if SMODS.change_play_limit and SMODS.change_discard_limit then
                        -- future proofing?
                        SMODS.change_play_limit(sleeve.config.extra.selection_limit_base)
                        SMODS.change_discard_limit(sleeve.config.extra.selection_limit_base)
                    end
                    return true
                end)
            }))
		else
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_base
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
			G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size_base
		end
    end,
}
CardSleeves.Sleeve {
    key = "artisticsleeve",
    atlas = "Sleeves",
    unlocked = true,
    pos = { x = 3, y = 0 },
	config = {extra = {
		joker_slots_base = -5,
		hand_size_base = 10,
		joker_slots_painted = -4,
		selection_limit_artistic = 5,
		selection_limit_painted = 4
	}},
	loc_vars = function(self,info_queue,card)
        local key, vars
		if self.get_current_deck_key() == "b_para_artisticdeck" or self.get_current_deck_key() == "b_para_chasmdeck" then
            key = self.key .. "_alt1"
            vars = {self.config.extra.selection_limit_artistic}
		elseif self.get_current_deck_key() == "b_painted" then
			key = self.key .. "_alt2"
			vars = {self.config.extra.joker_slots_painted, self.config.extra.selection_limit_painted}
		else
			key = self.key
			vars = {self.config.extra.joker_slots_base, self.config.extra.hand_size_base}
		end
		return {key = key, vars = vars}
	end,
    apply = function(self, sleeve)
		if self.get_current_deck_key() == "b_para_artisticdeck" then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = (function()
                    G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + sleeve.config.extra.selection_limit_artistic
                    if SMODS.change_play_limit and SMODS.change_discard_limit then
                        -- future proofing?
                        SMODS.change_play_limit(sleeve.config.extra.selection_limit_artistic)
                        SMODS.change_discard_limit(sleeve.config.extra.selection_limit_artistic)
                    end
                    return true
                end)
            }))
		elseif self.get_current_deck_key() == "b_painted" then
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_painted
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = (function()
                    G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + sleeve.config.extra.selection_limit_painted
                    if SMODS.change_play_limit and SMODS.change_discard_limit then
                        -- future proofing?
                        SMODS.change_play_limit(sleeve.config.extra.selection_limit_painted)
                        SMODS.change_discard_limit(sleeve.config.extra.selection_limit_painted)
                    end
                    return true
                end)
            }))
		else
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_base
			G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size_base
		end
    end,
}
-- Slightly modify Black and Painted sleeves
local black_sleeve = CardSleeves.Sleeve:get_obj("sleeve_casl_black")
local black_sleeve_loc_vars_ref = black_sleeve.loc_vars
black_sleeve.loc_vars = function(self)
	local key, vars
	if self.get_current_deck_key() == "b_para_voiddeck" or self.get_current_deck_key() == "b_para_chasmdeck" then
        key = self.key .. "_alt"
        self.config = { discards = -1, joker_slot = 1 }
        vars = { self.config.joker_slot, -self.config.discards }
		return {key = key, vars = vars}
	else
		return black_sleeve_loc_vars_ref(self)
	end
end
local painted_sleeve = CardSleeves.Sleeve:get_obj("sleeve_casl_painted")
local painted_sleeve_loc_vars_ref = painted_sleeve.loc_vars
painted_sleeve.loc_vars = function(self)
	local key, vars
	if self.get_current_deck_key() == "b_para_artisticdeck" or self.get_current_deck_key() == "b_para_chasmdeck" then
        key = self.key .. "_alt"
        self.config = { selection_size = 1, joker_slot = -1 }
        vars = { self.config.selection_size, self.config.joker_slot }
		return {key = key, vars = vars}
	else
		return painted_sleeve_loc_vars_ref(self)
	end
end