SMODS.Back{
    key = "artisticdeck",
    unlocked = false,
	config = {extra = {
		joker_slots_unfiltered = -5,
		hand_size_unfiltered = 10,
        joker_slots_upgraded = -2,
        hand_size_upgraded = -1,
        hand_size_gain = 1
	}},
	atlas = 'Backs',
	pos = {x = 7, y = 0},
	loc_vars = function(self,info_queue,card)
        if PSI.get_gameset().unfiltered then
		    return {key = self.key .. "_unfiltered", vars = {self.config.extra.joker_slots_unfiltered, self.config.extra.hand_size_unfiltered}}
        else
            return {key = self.key .. "_upgraded", vars = {self.config.extra.joker_slots_upgraded, self.config.extra.hand_size_upgraded, self.config.extra.hand_size_gain}}
        end
	end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_painted'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_painted' }
        end
        local key = self.key
        if PSI.get_gameset().upgraded then
            key = key .. "_upgraded"
        else
            key = key .. "_unfiltered"
        end
        return { key = key, vars = { other_name } }
    end,
    apply = function(self, back)
        if PSI.get_gameset().upgraded then
		    G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_upgraded
		    G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size_upgraded
        else
    		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots_unfiltered
		    G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size_unfiltered
        end
    end,
    calculate = function(self, back, context)
        if context.end_of_round and context.game_over == false and context.beat_boss and PSI.get_gameset().upgraded then
            G.hand:change_size(self.config.extra.hand_size_gain)
        end
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_painted') > 7
    end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	}
}
local oldenegativegetweight = G.P_CENTERS.e_negative.get_weight
G.P_CENTERS.e_negative.get_weight = function(self)
    local weight = oldenegativegetweight(self)
    if G.GAME.selected_back.effect.center.key == "b_para_artisticdeck" then
        if PSI.get_gameset().unfiltered then
	    	weight = weight * 15
        else
            weight = weight * 3
        end
    end
    return weight
end