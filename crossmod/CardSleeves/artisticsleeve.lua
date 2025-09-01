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
		selection_limit_painted = 4,
        joker_slots_upgraded = -2,
        hand_size_upgraded = -1,
        hand_size_gain = 1,
        selection_limit_gain = 1
	}},
	loc_vars = function(self,info_queue,card)
        local key, vars
        if PSI.get_gameset().unfiltered then
		    if self.get_current_deck_key() == "b_para_artisticdeck" or self.get_current_deck_key() == "b_para_chasmdeck" then
                key = self.key .. "_unfiltered_alt1"
                vars = {self.config.extra.selection_limit_artistic}
		    elseif self.get_current_deck_key() == "b_painted" then
		    	key = self.key .. "_unfiltered_alt2"
		    	vars = {self.config.extra.joker_slots_painted, self.config.extra.selection_limit_painted}
		    else
		    	key = self.key .. "_unfiltered"
		    	vars = {self.config.extra.joker_slots_base, self.config.extra.hand_size_base}
		    end
        else
            if self.get_current_deck_key() == "b_para_artisticdeck" then
		    	key = self.key .. "_upgraded_alt"
		    	vars = {self.config.extra.selection_limit_gain}
            else
                key = self.key .. "_upgraded"
                vars = {self.config.extra.joker_slots_upgraded, self.config.extra.hand_size_upgraded, self.config.extra.hand_size_gain}
            end
        end
		return {key = key, vars = vars}
	end,
    apply = function(self, sleeve)
        if PSI.get_gameset().unfiltered then
		    if self.get_current_deck_key() == "b_para_artisticdeck" then
                PSI.changeselectlimit(sleeve.config.extra.selection_limit_artistic)
		    elseif self.get_current_deck_key() == "b_painted" then
		    	G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_painted
                PSI.changeselectlimit(sleeve.config.extra.selection_limit_painted)
		    else
		    	G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_base
		    	G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size_base
		    end
        else
            if self.get_current_deck_key() ~= "b_para_artisticdeck" then
		        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_upgraded
		        G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size_upgraded
            end
        end
    end,
    calculate = function(self, sleeve, context)
        if context.end_of_round and context.game_over == false and context.beat_boss and PSI.get_gameset().upgraded then
            if self.get_current_deck_key() ~= "b_para_artisticdeck" then
                G.hand:change_size(self.config.extra.hand_size_gain)
            elseif G.GAME.round_resets.ante ~= 1 then
                PSI.changeselectlimit(sleeve.config.extra.selection_limit_gain)
            end
        end
    end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}