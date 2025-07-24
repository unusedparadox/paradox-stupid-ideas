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
local oldenegativegetweight = G.P_CENTERS.e_negative.get_weight
SMODS.Edition:take_ownership('e_negative', {
    get_weight = function(self)
        local weight = oldenegativegetweight(self)
        if G.GAME.selected_back.effect.center.key == "b_para_artisticdeck" then
			weight = weight * 15
        end
        return weight
    end
}, true)