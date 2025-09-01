CardSleeves.Sleeve {
    key = "yurisleeve",
    atlas = "Sleeves",
    unlocked = true,
    pos = { x = 0, y = 0 },
	config = {extra = {
		joker_slots = -1,
		hands = -1,
	}},
	loc_vars = function(self, info_queue, card)
        local key, vars
        if self.get_current_deck_key() == "b_para_yurideck" then
            key = self.key .. "_alt"
            vars = { self.config.extra.joker_slots }
        else
            key = self.key
            vars = {self.config.extra.joker_slots, self.config.extra.hands}
        end
		return {key = key, vars = vars}
	end,
	apply = function(self, sleeve)
		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
		local edition = "e_base"
		if self.get_current_deck_key() == "b_para_yurideck" then edition = "e_negative" end
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_blueprint',
					edition = edition,
					stickers = {"eternal"}
				})
                card:add_to_deck()
                G.jokers:emplace(card)
				card:set_edition(nil, true, true)
				local card2 = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_brainstorm',
					edition = edition,
					stickers = {"eternal"}
				})
                card2:add_to_deck()
                G.jokers:emplace(card2)
				card2:set_edition(nil, true, true)
				return true
			end
        }))
		if self.get_current_deck_key() ~= "b_para_yurideck" then
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
		end
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}