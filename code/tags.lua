SMODS.Atlas{ -- Atlas for Tags
	key = "Tags",
	path = "Tags.png",
	px = 34,
	py = 34,
}
SMODS.Tag{
	atlas = 'Tags',
	pos = {x = 0, y = 0},
	key = 'foodtag',
	no_collection = true,
    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
            tag:yep('+', G.C.PURPLE,function() 
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS['p_para_foodpack'], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
		end
	end,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.p_para_foodpack
	end,
	in_pool = function(self, args)
		return false
	end
}