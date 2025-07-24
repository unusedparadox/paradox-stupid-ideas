SMODS.Joker{
	key = "brokenphone",
	atlas = 'Jokers',
	pos = {x = 4, y = 2},
	pools = { ["parajoker"] = true },
	loc_vars = function(self,info_queue,card)
        local _hand, _tally = nil, to_big(0) -- ty vanillaremade for giving me all this code
		if G.STAGE == G.STAGES.RUN then
        	for _, handname in ipairs(G.handlist) do
            	if SMODS.is_poker_hand_visible(handname) and to_big(G.GAME.hands[handname].played) > to_big(_tally) then
                	_hand = handname
                	_tally = to_big(G.GAME.hands[handname].played)
            	end
			end
		end
		if _hand ~= nil then
			return {vars = {_hand, number_format(to_big(G.GAME.hands[_hand].chips) / to_big(2)), number_format(to_big(G.GAME.hands[_hand].mult) / to_big(2))}}
		else
			return {vars = {"None", 0, 0}}
		end
	end,
	rarity = 1,
	cost = 3,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if context.joker_main then
            local _hand, _tally = nil, to_big(0) -- ty vanillaremade for giving me all this code
            for _, handname in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(handname) and to_big(G.GAME.hands[handname].played) > to_big(_tally) then
                    _hand = handname
                    _tally = to_big(G.GAME.hands[handname].played)
                end
			end
			local chips = ((G.GAME.hands[_hand].chips) / (2))
			local mult = ((G.GAME.hands[_hand].mult) / (2))
			return {
				chips = chips,
				mult = mult
			}
		end
	end
}