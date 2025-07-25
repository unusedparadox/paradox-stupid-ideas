SMODS.Joker{
	key = "supercomputer",
	atlas = 'Jokers',
	pos = {x = 9, y = 2},
	loc_vars = function(self,info_queue,card)
		if G.STAGE == G.STAGES.RUN then
            return {vars = PSI.mostplayedhand(true)}
		else
			return {vars = {"None", 0, 0, 0, 0}}
		end
	end,
	pools = { ["parajoker"] = true },
	rarity = "gb_shattered",
	cost = 8,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.before then
            local handinfo = PSI.mostplayedhand(false)
            return {
                level_up = true,
                level_up_hand = handinfo[1],
                message = localize('k_level_up_ex')
            }
        elseif context.joker_main then
            local handinfo = PSI.mostplayedhand(false)
            return {
                chips = handinfo[2],
                mult = handinfo[3]
            }
        end
	end
}
GB.G.SHATTERED_TABLE[#GB.G.SHATTERED_TABLE + 1] = {"j_para_brokenphone", "j_para_supercomputer"}