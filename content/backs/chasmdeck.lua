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
local oldenegativegetweight = G.P_CENTERS.e_negative.get_weight
SMODS.Edition:take_ownership('e_negative', {
    get_weight = function(self)
        local weight = oldenegativegetweight(self)
		if G.GAME.selected_back.effect.center.key == "b_para_chasmdeck" then
			weight = weight * 25
		end
        return weight
    end
}, true)