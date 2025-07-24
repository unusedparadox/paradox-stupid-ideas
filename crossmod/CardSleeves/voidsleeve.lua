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