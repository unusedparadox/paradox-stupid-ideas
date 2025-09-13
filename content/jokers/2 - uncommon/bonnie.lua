SMODS.Joker{ -- Why is steammodded so hard I spent so much crabbing time on them
	key = 'bonnie',
	atlas = 'Jokers',
	pos = {x = 3, y = 0},
	cost = 5,
	rarity = 2,
	pools = {["parajoker"] = true},
	config = {extra = {active = false}},
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'tag_para_foodtag', set = 'Tag'}
		info_queue[#info_queue+1] = G.P_CENTERS.p_para_foodpack
		-- info_queue[#info_queue+1] = {key = 'para_negativesticker', set = 'Other'}
	end,
	calculate = function(self,card,context)
		if context.end_of_round and context.beat_boss and not context.blueprint then
			card.ability.extra.active = true
		elseif context.ending_shop and card.ability.extra.active and not context.blueprint then
			add_tag(Tag("tag_para_foodtag"))
			card.ability.extra.active = false
			return {
				message = localize('para_k_snacktime'),
				colour = G.C.ATTENTION
			}
		end
	end,
	pronouns = "they_them"
}
SMODS.Booster{
	key = 'foodpack',
	config = {extra = 3, choose = 1},
	atlas = 'Boosters',
	pos = { x = 1, y = 0 },
	no_collection = true,
	create_card = function(self, card)
		return SMODS.create_card({set = "Food", area = G.pack_cards, skip_materialize = true, key_append = "para_foodpack_card"})
	end,
	weight = 0,
	cost = 0,
	group_key = 'groupfoodpack',
	in_pool = function(self, args)
		return false
	end
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
	end,
	para_credits = {
		["art"] = "Astro",
		["code"] = "UnusedParadox"
	}
}