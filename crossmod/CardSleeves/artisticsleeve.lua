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