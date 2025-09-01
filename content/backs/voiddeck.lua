SMODS.Back{
    key = "voiddeck",
    unlocked = false,
	config = {extra = {
		joker_slots = 3,
		hands = -3,
        joker_slot_gain = 1,
        hand_gain = -1,
	}},
	atlas = 'Backs',
	pos = {x = 5, y = 0},
	loc_vars = function(self,info_queue,card)
        if PSI.get_gameset().unfiltered then
		    return {key = self.key .. "_unfiltered", vars = {self.config.extra.joker_slots, self.config.extra.hands}}
        else
            return {key = self.key .. "_upgraded", vars = {self.config.extra.joker_slot_gain, self.config.extra.hand_gain}}
        end
	end,
    apply = function(self, back)
        if PSI.get_gameset().unfiltered then
		    G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
		    G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
        end
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_black') > 7
    end,
    calculate = function(self, back, context)
        if context.end_of_round and context.game_over == false and context.beat_boss and PSI.get_gameset().upgraded and (G.GAME.round_resets.ante % 2) == 0 then
            if G.GAME.round_resets.hands > 1 then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + self.config.extra.hand_gain
                ease_hands_played(self.config.extra.hand_gain)
                if G.jokers then
                    G.jokers.config.card_limit = G.jokers.config.card_limit + self.config.extra.joker_slot_gain
                end
            end
        end
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_black'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_black' }
        end

        return { vars = { other_name } }
    end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}