if PSI.get_gameset().unfiltered then
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
		para_credits = {
			["art"] = "Astro",
			["code"] = "UnusedParadox"
		}
	}
end