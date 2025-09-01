if PSI.get_gameset().unfiltered then
	SMODS.Back{
		key = "yaoideck",
		unlocked = true,
		atlas = "Backs",
		pos = {x = 6, y = 0},
		config = {extra = {
			joker_slots = -1,
			hands = -1,
		}},
		loc_vars = function(self, info_queue, card)
			return {vars = {self.config.extra.joker_slots, self.config.extra.hands}}
		end,
		apply = function(self, back)
			G.E_MANAGER:add_event(Event({
				func = function()
					local card = SMODS.create_card({
						set = 'Joker',
						area = G.jokers,
						key = 'j_madness',
						edition = "e_base",
						stickers = {"eternal"}
					})
	                card:add_to_deck()
	                G.jokers:emplace(card)
					card:set_edition(nil, true, true)
					local card2 = SMODS.create_card({
						set = 'Joker',
						area = G.jokers,
						key = 'j_vagabond',
						edition = "e_base",
						stickers = {"eternal"}
					})
	                card2:add_to_deck()
	                G.jokers:emplace(card2)
					card2:set_edition(nil, true, true)
					return true
				end
	        }))
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slots
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
		end,
	para_credits = {
		["art"] = "mr.cr33ps",
		["code"] = "UnusedParadox"
	}
	}
end
-- Create "fake madness" for the yaoi deck
SMODS.Joker{
	key = "fakemadness",
	no_collection = true,
	in_pool = function(self, args)
		return false
	end
}