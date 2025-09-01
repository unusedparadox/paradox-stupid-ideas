if next(SMODS.find_mod("Talisman")) and Talisman and (Talisman.config_file.score_opt_id >= 2) and PSI.get_gameset().unfiltered then
	SMODS.Back{
	    key = "hundreddeck",
	    unlocked = false,
		config = {extra = {
			joker_slots = 100,
			dollars = 100,
			hands = 100,
			discards = 100,
			consumable_slots = 100,
			hand_size = 100,
			winning_ante = 100,
		}},
		atlas = 'Backs',
		pos = {x = 0, y = 0},
		loc_vars = function(self,info_queue,card)
			return {vars = {self.config.extra.joker_slots, self.config.extra.dollars, self.config.extra.hands, self.config.extra.discards, self.config.extra.consumable_slots, self.config.extra.hand_size, self.config.extra.winning_ante}}
		end,
	    locked_loc_vars = function(self, info_queue, card)
	        return { vars = { number_format(100) } }
	    end,
	    apply = function(self, back)
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
			G.GAME.starting_params.dollars = G.GAME.starting_params.dollars + self.config.extra.dollars
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
			G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.extra.discards
			G.GAME.starting_params.consumable_slots = G.GAME.starting_params.consumable_slots + self.config.extra.consumable_slots
			G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size
			G.GAME.win_ante = G.GAME.win_ante + self.config.extra.winning_ante
	    end,
	    check_for_unlock = function(self, args)
	        return args.type == 'chip_score' and to_big(args.chips) >= to_big(100)
	    end,
		para_credits = {
			["art"] = "UnusedParadox",
			["code"] = "UnusedParadox"
		}
	}
end