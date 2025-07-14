SMODS.Achievement{
    key = 'deathbypineapple',
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,
    unlock_condition = function(self, args)
        return args.type == 'deathbypineapple'
    end
}
-- Take ownership of Red Card for Color Collector
SMODS.Joker:take_ownership("red_card", {
	add_to_deck = function(self, card, from_debuff)
		if next(SMODS.find_card("j_para_yellowcard", true)) and next(SMODS.find_card("j_para_orangecard", true)) and next(SMODS.find_card("j_para_bluecard", true)) then
			check_for_unlock({type = 'cardcollector'})
		end
	end
}, true)
SMODS.Achievement{
    key = 'cardcollector',
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,
    unlock_condition = function(self, args)
        return args.type == 'cardcollector'
    end
}