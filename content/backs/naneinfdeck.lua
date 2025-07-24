local unlockednaneinf = true
local unlock_condition_naneinf = function(self, args) return true end
if next(SMODS.find_mod("Talisman")) and Talisman and (Talisman.config_file.score_opt_id >= 2) then
	unlockednaneinf = false
	unlock_condition_naneinf = function(self, args)
		if args.type == "chip_score" and to_big(args.chips) >= to_big(1.8) * (to_big(10) ^ to_big(308)) then
			return true
		end
	end
end
SMODS.Back{
    key = "naneinfdeck",
    unlocked = unlockednaneinf,
	atlas = 'Backs',
	pos = {x = 2, y = 0},
	config = {extra = {
		winning_ante = 39
	}},
	loc_vars = function(self,info_queue,card)
		return {vars = {self.config.extra.winning_ante}}
	end,
    apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_baron',
					edition = e_negative,
					stickers = {"eternal"}
				})
                card:add_to_deck()
                G.jokers:emplace(card)
				card:set_edition({ negative = true })
				local card2 = SMODS.create_card({
					set = 'Joker',
					area = G.jokers,
					key = 'j_mime',
					edition = e_negative,
					stickers = {"eternal"}
				})
                card2:add_to_deck()
                G.jokers:emplace(card2)
				card2:set_edition({ negative = true })
				for k, v in pairs(G.playing_cards) do
					v:set_seal("Red", nil, true)
					v:set_ability(G.P_CENTERS["m_steel"])
					SMODS.change_base(v, nil, "King")
				end
				G.GAME.win_ante = self.config.extra.winning_ante
				return true
			end
        })
		)
    end,
	check_for_unlock = unlock_condition_naneinf
}