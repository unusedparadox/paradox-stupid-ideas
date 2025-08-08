-- Eat food jokers. Takes the joker to eat as an argument
PSI.consumefood = function(card)
	G.E_MANAGER:add_event(Event({
    	func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({
            	trigger = 'after',
            	delay = 0.3,
            	blockable = false,
                func = function()
                	card:remove()
                    return true
                end
            }))
        	return true
    	end
    }))
end
-- Finds most played hand and returns a table of information about it: name, chips, mult, level chips, level mult, key. Takes argument of whether to number_format the info.
PSI.mostplayedhand = function(format)
    local _hand, _tally = nil, to_big(-1) -- ty vanillaremade for giving me all this code
    for _, handname in ipairs(G.handlist) do
        if SMODS.is_poker_hand_visible(handname) and to_big(G.GAME.hands[handname].played) > to_big(_tally) then
            _hand = handname
            _tally = to_big(G.GAME.hands[handname].played)
        end
	end
    if format then
        return {
            localize(_hand, 'poker_hands'),
            number_format(to_big(G.GAME.hands[_hand].chips)),
            number_format(to_big(G.GAME.hands[_hand].mult)),
            number_format(to_big(G.GAME.hands[_hand].l_chips)),
            number_format(to_big(G.GAME.hands[_hand].l_mult)),
            _hand
        }
    else
        return {
            localize(_hand, 'poker_hands'),
            to_big(G.GAME.hands[_hand].chips),
            to_big(G.GAME.hands[_hand].mult),
            to_big(G.GAME.hands[_hand].l_chips),
            to_big(G.GAME.hands[_hand].l_mult),
            _hand
        }
    end
end
-- For boss blind effects Matador wouldn't normally detect (Does not modify vanilla blinds). Hook into this for your own boss blinds.
PSI.blindtriggered = function()
    for k, v in pairs(G.jokers.cards) do
        if v.ability and v.ability.para_singular then
            return true
        end
    end
    return false
end