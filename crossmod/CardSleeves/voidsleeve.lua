CardSleeves.Sleeve {
    key = "voidsleeve",
    atlas = "Sleeves",
    unlocked = true,
    pos = { x = 2, y = 0 },
	config = {extra = {
		joker_slots = 3,
		hands = -3,
		discards = -3,
        joker_slot_gain = 1,
        hand_gain = -1,
		discard_gain = -1
	}},
	loc_vars = function(self,info_queue,card)
        local key, vars
		if PSI.get_gameset().unfiltered then
			if self.get_current_deck_key() == "b_para_voiddeck" or self.get_current_deck_key() == "b_para_chasmdeck" or self.get_current_deck_key() == "b_black" then
        	    key = self.key .. "_unfiltered_alt"
        	    vars = {self.config.extra.joker_slots, self.config.extra.discards}
			else
				key = self.key .. "_unfiltered"
				vars = {self.config.extra.joker_slots, self.config.extra.hands}
			end
		else
			if self.get_current_deck_key() == "b_para_voiddeck" then
        	    key = self.key .. "_upgraded_alt"
        	    vars = {self.config.extra.joker_slot_gain, self.config.extra.discard_gain}
			else
				key = self.key .. "_upgraded"
				vars = {self.config.extra.joker_slot_gain, self.config.extra.hand_gain}
			end
		end
		return {key = key, vars = vars}
	end,
    apply = function(self, sleeve)
		if PSI.get_gameset().unfiltered then
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
			if self.get_current_deck_key() == "b_para_voiddeck" or self.get_current_deck_key() == "b_para_chasmdeck" or self.get_current_deck_key() == "b_black" then
				G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.extra.discards
			else
				G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
			end
		end
    end,
    calculate = function(self, back, context)
        if context.end_of_round and context.game_over == false and context.beat_boss and PSI.get_gameset().upgraded and (G.GAME.round_resets.ante % 2) == 0 then
			if self.get_current_deck_key() == "b_para_voiddeck" then
        	    if G.GAME.round_resets.discards > 1 then
        	        G.GAME.round_resets.discards = G.GAME.round_resets.discards + self.config.extra.discard_gain
        	        ease_discard(self.config.extra.discard_gain)
        	        if G.jokers then
        	            G.jokers.config.card_limit = G.jokers.config.card_limit + self.config.extra.joker_slot_gain
        	        end
        	    end
			else
        	    if G.GAME.round_resets.hands > 1 then
        	        G.GAME.round_resets.hands = G.GAME.round_resets.hands + self.config.extra.hand_gain
        	        ease_hands_played(self.config.extra.hand_gain)
        	        if G.jokers then
        	            G.jokers.config.card_limit = G.jokers.config.card_limit + self.config.extra.joker_slot_gain
        	        end
        	    end
			end
        end
    end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}