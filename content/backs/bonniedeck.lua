SMODS.Back{
    key = "bonniedeck",
    unlocked = true,
	config = {extra = {
		food_jokers = 2
	}},
	atlas = 'Backs',
	pos = {x = 1, y = 0},
	loc_vars = function(self,info_queue,card)
		return {vars = {self.config.extra.food_jokers}}
	end,
    apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_para_bonnie',
					edition = e_base,
					no_edition = true,
					stickers = {"eternal"}
				})
                card:add_to_deck()
                G.jokers:emplace(card)
				card:set_edition(nil, true, true)
				for i=1,self.config.extra.food_jokers do
					local card2 = SMODS.create_card({
						set = "Food",
						area = G.jokers,
						key_append = "friend inside me"
					})
                	card2:add_to_deck()
                	G.jokers:emplace(card2)
				end
                return true
                end
            })
		)
    end
}