-- Slightly modify Black and Painted sleeves
local black_sleeve = CardSleeves.Sleeve:get_obj("sleeve_casl_black")
local black_sleeve_loc_vars_ref = black_sleeve.loc_vars
black_sleeve.loc_vars = function(self)
	local key, vars
	if self.get_current_deck_key() == "b_para_voiddeck" or self.get_current_deck_key() == "b_para_chasmdeck" then
        key = self.key .. "_alt"
        self.config = { discards = -1, joker_slot = 1 }
        vars = { self.config.joker_slot, -self.config.discards }
		return {key = key, vars = vars}
	else
		return black_sleeve_loc_vars_ref(self)
	end
end
local painted_sleeve = CardSleeves.Sleeve:get_obj("sleeve_casl_painted")
local painted_sleeve_loc_vars_ref = painted_sleeve.loc_vars
painted_sleeve.loc_vars = function(self)
	local key, vars
	if self.get_current_deck_key() == "b_para_artisticdeck" or self.get_current_deck_key() == "b_para_chasmdeck" then
        key = self.key .. "_alt"
        self.config = { selection_size = 1, joker_slot = -1 }
        vars = { self.config.selection_size, self.config.joker_slot }
		return {key = key, vars = vars}
	else
		return painted_sleeve_loc_vars_ref(self)
	end
end