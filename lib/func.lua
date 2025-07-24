para_consumefood = function(card)
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