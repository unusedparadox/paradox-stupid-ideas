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