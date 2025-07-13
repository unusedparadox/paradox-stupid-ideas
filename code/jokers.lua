SMODS.Atlas{
	key = 'Jokers',
	path = 'Jokers.png',
	px = 71,
	py = 95
}
SMODS.Atlas{
	key = 'Jokers_Soul',
	path = 'Jokers_Soul.png',
	px = 71,
	py = 95
}
SMODS.Joker{ -- Blue Card implementation
	key = 'bluecard',
	atlas = 'Jokers',
	pos = {x = 0, y = 0},
	config = { extra = {
		chip_gain = 10,
		chips = 0
	}
	},
	rarity = 1,
	blueprint_compat = true,
	cost = 4,
	pools = {["parajoker"] = true},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chip_gain, card.ability.extra.chips}}
	end,
	calculate = function(self,card,context)
		if context.open_booster and not context.blueprint then 
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
			return {
				message = localize{type = 'variable', key = 'a_chips', vars = {to_big(card.ability.extra.chip_gain)}},
				colour = G.C.CHIPS
			}
		elseif context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if next(SMODS.find_card("j_red_card", true)) and next(SMODS.find_card("j_para_orangecard", true)) and next(SMODS.find_card("j_para_yellowcard", true)) then
			check_for_unlock({type = 'cardcollector'})
		end
	end
}
SMODS.Joker{ -- Orange Card implementation
	key = 'orangecard',
	atlas = 'Jokers',
	pos = {x = 1, y = 0},
	config = { extra = {
		xmult_gain = 0.25,
		xmult = 1,
		is_active = true,
	}
	},
	rarity = 2,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	cost = 6,
	loc_vars = function(self,info_queue,card)
		local active_msg = localize("para_k_inactive")
		if card.ability.extra.is_active then
			active_msg = localize("para_k_active")
		end
		return {vars = {card.ability.extra.xmult_gain, card.ability.extra.xmult, active_msg}}
	end,
	calculate = function(self,card,context)
		if context.skipping_booster and not context.blueprint and card.ability.extra.is_active then -- Booster Pack is skipped, deactivate the Joker and increase the XMult
			card.ability.extra.is_active = false
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
			return {
				message = localize{type = 'variable', key = 'a_xmult', vars = {to_big(card.ability.extra.xmult)}},
				colour = G.C.MULT
			}
		elseif context.ending_shop then -- Reactivate the Joker
			if not card.ability.extra.is_active then
				card.ability.extra.is_active = true
				return {
					message = localize('para_k_reactivated'),
					colour = G.C.ATTENTION
				}
			end
		elseif context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if next(SMODS.find_card("j_red_card", true)) and next(SMODS.find_card("j_para_bluecard", true)) and next(SMODS.find_card("j_para_yellowcard", true)) then
			check_for_unlock({type = 'cardcollector'})
		end
	end
}
SMODS.Joker{ -- Yellow Card implementation
	key = 'yellowcard',
	atlas = 'Jokers',
	pos = {x = 2, y = 0},
	config = { extra = {
		money = 0,
		money_gain = 1
	}
	},
	rarity = 2,
	pools = {["parajoker"] = true},
	blueprint_compat = false,
	cost = 6,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.money, card.ability.extra.money_gain}}
	end,
	calculate = function(self,card,context)
		if context.skipping_booster and not context.blueprint then
			card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_gain
			return {
				message = "+" .. SMODS.signed_dollars(card.ability.extra.money_gain),
				colour = G.C.MONEY
			}
		end
	end,
	calc_dollar_bonus = function(self, card) -- Apparently money isn't in the calculate function. Who knew?
		if card.ability.extra.money == 0 then
			return nil
		else
			return card.ability.extra.money
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if next(SMODS.find_card("j_red_card", true)) and next(SMODS.find_card("j_para_orangecard", true)) and next(SMODS.find_card("j_para_bluecard", true)) then
			check_for_unlock({type = 'cardcollector'})
		end
	end
}
SMODS.Joker{ -- card implementation
    key = "card",
    blueprint_compat = true,
    rarity = 1,
    cost = 1,
	atlas = 'Jokers',
	pools = {["parajoker"] = true},
    pos = { x = 9, y = 1 },
	config = {extra = {
		chips = 1,
		eeechips = 2,
		requirement = 5
	}},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips}}
	end,
	calculate = function(self, card, context)
		local supercard = (#SMODS.find_card("j_para_card", false) >= card.ability.extra.requirement) and next(SMODS.find_mod("Talisman"))
		if context.joker_main and not supercard then
			return {
				chips = card.ability.extra.chips
			}
		elseif context.joker_main and supercard then
			return {
				eeechips = card.ability.extra.eeechips
			}
		end
	end,
	in_pool = function(self, args)
		return true, {allow_duplicates = true}
	end
}
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
	end
}
SMODS.Joker{ -- Pineapple implementation.
	key = 'pineapple',
	config = { extra = {
		xmult = 3
	}
	},
	atlas = 'Jokers',
	pos = {x = 4, y = 0},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 1,
	cost = 2,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
        elseif context.end_of_round and not context.game_over then
			G.PROFILES[G.SETTINGS.profile].pineappledeath = true
			check_for_unlock({type = 'deathbypineapple'})
            G.STATE = G.STATES.GAME_OVER
            G.STATE_COMPLETE = false
        end
	end
}
SMODS.Joker{ -- Cookie implementation
	key = 'cookie',
	config = { extra = {
		xmult = 2.5,
		xmult_loss = 0.25
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 2,
	cost = 5,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	atlas = 'Jokers',
	pos = {x = 5, y = 0},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult, card.ability.extra.xmult_loss}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		elseif context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
			if card.ability.extra.xmult <= 1 then
				para_consumefood(card)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.ATTENTION
                }
			else
                return {
                    message = localize { type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.xmult_loss } },
                    colour = G.C.MULT
                }
			end
		end
	end
}
SMODS.Joker{ -- Plantain Chips implementation
	key = 'plantainchips',
	config = { extra = {
		xchips = 2,
		xchips_loss = 0.1
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 1,
	cost = 3,
	atlas = 'Jokers',
	pos = {x = 7, y = 0},
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xchips, card.ability.extra.xchips_loss}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips
			}
		elseif context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.xchips = card.ability.extra.xchips - card.ability.extra.xchips_loss
			if card.ability.extra.xchips <= 1 then
				para_consumefood(card)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.ATTENTION
                }
			else
                return {
                    message = localize { type = 'variable', key = 'a_xchips_minus', vars = { card.ability.extra.xchips_loss } },
                    colour = G.C.CHIPS
                }
			end
		end
	end
}
SMODS.Joker{ -- Onigiri implementation
	key = 'onigiri',
	config = { extra = {
		hands_left = 5,
		chips = 60,
		mult = 12,
		xmult = 1.6,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 1,
	cost = 3,
	atlas = 'Jokers',
	pos = {x = 6, y = 0},
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.hands_left}}
	end,
	calculate = function(self, card, context)
		local effects = {"chips", "mult", "xmult"}
		local chosen_effect = effects[math.random(#effects)]
		if context.joker_main then
			if chosen_effect == "chips" then
				return {
					chips = card.ability.extra.chips
				}
			elseif chosen_effect == "mult" then
				return {
					mult = card.ability.extra.mult
				}
			elseif chosen_effect == "xmult" then
				return {
					xmult = card.ability.extra.xmult
				}
			end
		elseif context.after and not context.blueprint then
			card.ability.extra.hands_left = card.ability.extra.hands_left - 1
			if card.ability.extra.hands_left <= 0 then
				para_consumefood(card)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.ATTENTION
                }
			else
                return {
                    message = card.ability.extra.hands_left .. '',
                    colour = G.C.ATTENTION
                }
			end
		end
	end
}
SMODS.Joker{ -- Madeline implementation
	key = 'madeline',
	config = { extra = {
		mult = 3,
		cards = 100,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 1,
	cost = 3,
	atlas = 'Jokers',
	pos = {x = 2, y = 1},
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.mult, card.ability.extra.cards}}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and card.ability.extra.cards > 0 then
			card.ability.extra.cards = card.ability.extra.cards - 1
			return {
				mult = card.ability.extra.mult
			}
		elseif context.after and card.ability.extra.cards <= 0 and not context.blueprint then
			para_consumefood(card)
            return {
                message = localize('k_eaten_ex'),
                colour = G.C.ATTENTION
            }
		end
	end
}
SMODS.Joker{ -- Fish Head implementation
	key = 'fishhead',
	config = { extra = {
		money = 20,
		threshold = 4,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 3,
	cost = 9,
	atlas = 'Jokers',
	pos = {x = 1, y = 1},
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.money, card.ability.extra.threshold}}
	end,
	calculate = function(self, card, context)
		if context.ending_shop and not context.blueprint then
			local money_minus = 0 - math.max(0, (number_format(to_big(G.GAME.dollars)) + (G.GAME.dollar_buffer or 0) - card.ability.extra.threshold))
			card.ability.extra.money = card.ability.extra.money + money_minus
			if card.ability.extra.money <= 0 then
				para_consumefood(card)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.ATTENTION
                }
			elseif money_minus < 0 then
				return {
					message = SMODS.signed_dollars(money_minus),
					colour = G.C.RED
				}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		return card.ability.extra.money
	end
}
SMODS.Joker{ -- Burnt Samosas implementation
	key = 'burntsamosas',
	config = { extra = {
		chips = 50,
		chip_loss = 2,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	atlas = 'Jokers',
	pos = {x = 9, y = 0},
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips, card.ability.extra.chip_loss}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		elseif context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_loss
			if card.ability.extra.chips <= 0 then
				para_consumefood(card)
        	    return {
        	        message = localize('k_eaten_ex'),
        	        colour = G.C.ATTENTION
        	    }
			else
				return {
					message = localize{type = 'variable', key = 'a_chips_minus', vars = {to_big(card.ability.extra.chip_loss)}},
					colour = G.C.CHIPS
				}
			end
		end
	end
}
SMODS.Joker{ -- Palmier implementation
	key = 'palmier',
	config = { extra = {
		chips = 150,
		chip_loss = 10,
	}
	},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 2,
	cost = 7,
	atlas = 'Jokers',
	pos = {x = 0, y = 1},
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips, card.ability.extra.chip_loss}}
	end,
 	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and card.ability.extra.chips > 0 and not context.blueprint then
            context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chip_loss
			card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_loss
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
		elseif context.after and card.ability.extra.chips <= 0 and not context.blueprint then
			para_consumefood(card)
            return {
                message = localize('k_eaten_ex'),
                colour = G.C.ATTENTION
            }
		elseif context.joker_main and not context.blueprint and card.ability.extra.chips > 0 then
            return {
                chips = card.ability.extra.chips
            }
		end
    end
}
SMODS.Joker{ -- Malanga Fritter implementation
	key = 'malangafritter',
	config = { extra = {
		hands = 5
	}},
	pools = { ["Food"] = true, ["parajoker"] = true },
	rarity = 3,
	cost = 7,
	atlas = 'Jokers',
	pos = {x = 8, y = 0},
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.hands}}
	end,
 	calculate = function(self, card, context)
        if context.before and not context.blueprint then
			if not context.full_hand[1].edition then
				context.full_hand[1]:set_edition('e_polychrome')
				card.ability.extra.hands = card.ability.extra.hands - 1
          		return {
          		    message = localize('para_k_transformed'),
          		    colour = G.C.ATTENTION
          		}
			end
		elseif context.after and card.ability.extra.hands <= 0 and not context.blueprint then
			para_consumefood(card)
            return {
                message = localize('k_eaten_ex'),
                colour = G.C.ATTENTION
            }
		end
    end
}
SMODS.Joker{ -- mmm yummy pancake
	key = 'pancake',
	atlas = 'Jokers',
	pos = {x = 0, y = 2},
	cost = 3,
	rarity = 1,
	config = {extra = {
		mult = 15,
		mult_loss = 3
	}},
	pools = { ["Food"] = true, ["parajoker"] = true },
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult, card.ability.extra.mult_loss}}
	end,
	calculate = function(self,card,context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
			if card.ability.extra.mult <= 0 then
				para_consumefood(card)
           		return {
           		    message = localize('k_eaten_ex'),
           		    colour = G.C.ATTENTION
           		}
			else
				return {
					message = localize{type = 'variable', key = 'a_mult_minus', vars = {to_big(card.ability.extra.mult_loss)}},
					colour = G.C.MULT
				}
			end
		elseif context.other_joker and (context.other_joker.config.center.pools or {}).Food then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}
SMODS.Joker{ -- Airplane implementation
	key = 'airplane',
	config = { extra = {
		rerolls = 1
	}},
	rarity = 2,
	cost = 9,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'Jokers',
	pos = {x = 5, y = 1},
	loc_vars = function(self,info_queue,card)
        local vouchers = 0
        for k, _ in pairs(G.GAME.used_vouchers) do
            if not next(G.P_CENTERS[k].requires or {}) then
                vouchers = vouchers + 1
            end
        end
		local messagea = ""
		local messageb = ""
		if vouchers == 1 then
			messagea = localize("airplane_a1")
			messageb = localize("airplane_b1")
		else
			messagea = localize("airplane_a2")
			messageb = localize("airplane_b2")
		end
		return {vars = {card.ability.extra.rerolls, card.ability.extra.rerolls * vouchers, messagea, messageb}}
	end,
 	calculate = function(self, card, context)
		if context.buying_card and context.card.ability.set == "Voucher" and not next(context.card.config.center.requires or {}) then
			SMODS.change_free_rerolls(card.ability.extra.rerolls)
		end
    end,
    add_to_deck = function(self, card, from_debuff)
        local vouchers = 0
        for k, _ in pairs(G.GAME.used_vouchers) do
            if not next(G.P_CENTERS[k].requires or {}) then
                vouchers = vouchers + 1
            end
        end
        SMODS.change_free_rerolls(card.ability.extra.rerolls * vouchers)
    end,
    remove_from_deck = function(self, card, from_debuff)
        local vouchers = 0
        for k, _ in pairs(G.GAME.used_vouchers) do
            if not next(G.P_CENTERS[k].requires or {}) then
                vouchers = vouchers + 1
            end
        end
        SMODS.change_free_rerolls(-card.ability.extra.rerolls * vouchers)
    end
}
SMODS.Joker{ -- Tower implementation
	key = 'tower',
	config = { extra = {
		money = 20,
		triggered = false
	}},
	rarity = 1,
	cost = 11,
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'Jokers',
	pos = {x = 6, y = 1},
	loc_vars = function(self,info_queue,card)
		info_queue[#info_queue+1] = G.P_CENTERS.j_ring_master
		return {vars = {card.ability.extra.money}}
	end,
 	calculate = function(self, card, context)
        if context.starting_shop then
			card.ability.extra.triggered = false
		end
    end,
	calc_dollar_bonus = function(self, card)
		local towers = SMODS.find_card("j_para_tower", false)
		local give_money = #towers >= 2 -- Warning: spaghetti upcoming. If it ain't broke don't fix it.
		if give_money then
			for i,v in ipairs(towers) do
				if v.ability.extra.triggered then
					give_money = false
					break
				end
			end
		end
		if give_money then
			card.ability.extra.triggered = true
			return card.ability.extra.money
		else
			return nil
		end
	end,
	in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end
}
SMODS.Joker{ -- NFT Joker implementation
	key = 'nft',
	config = { extra = {
		scam = 125,
		min = 0
	}
	},
	pools = {["parajoker"] = true},
	rarity = "para_nft",
	atlas = 'Jokers',
	pos = {x = 3, y = 1},
	cost = 1000,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.scam, card.ability.extra.min}}
	end,
	in_pool = function(self, args)
		return args and args.source == 'sho'
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and card.sell_cost > card.ability.extra.min then
			card.ability.extra_value = card.ability.extra_value - card.ability.extra.scam
			card:set_cost()
			if card.sell_cost < card.ability.extra.min then
				card.sell_cost = card.ability.extra.min
				card.ability.extra_value = 0
			end
            return {
                message = localize('para_k_l'),
                colour = G.C.ATTENTION
            }
		end
	end
}
SMODS.Joker{ -- Jokerrune implementation
	key = 'deltarunetomorrow',
	config = { extra = {
		xmult_gain = 1,
		xmult = 4
	}},
	atlas = 'Jokers',
	pos = {x = 4, y = 1},
	cost = 5,
	rarity = 3,
	pools = {["parajoker"] = true},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.xmult_gain, card.ability.extra.xmult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end
}
SMODS.Joker{ -- Green Credit Card implementation
    key = "green_credit_card",
    blueprint_compat = false,
    rarity = "para_mythic",
    cost = 10,
	pools = {["parajoker"] = true},
	atlas = 'Jokers',
    pos = { x = 8, y = 1 },
	in_pool = function(self, args)
		return next(SMODS.find_card("j_credit_card", false)) and to_big(((G.GAME.dollars + (G.GAME.dollar_buffer or 0))) < to_big(0))
	end
}
if next(SMODS.find_mod("Talisman")) then
	SMODS.Joker{ -- < • Astro :3c • > implementation
		key = 'astro',
		pools = {["parajoker"] = true},
		config = { extra = {
			eechips = 1,
			eechips_gain = 0.1,
			numerator_planet = 1,
			denominator_planet = 3,
		}},
		atlas = 'Jokers_Soul',
		pos = {x = 1, y = 0},
		soul_pos = {x = 1, y = 1},
		cost = 10,
		rarity = "para_mythic",
		blueprint_compat = true,
		loc_vars = function(self,info_queue,card)
			local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator_planet, card.ability.extra.denominator_planet, 'identifier')
			return {vars = {card.ability.extra.eechips, card.ability.extra.eechips_gain, new_numerator, new_denominator}}
		end,
		calculate = function(self, card, context)
			if context.joker_main and context.scoring_name == "Flush" then -- Scores the tetrational chips.
				return {
					eechips = card.ability.extra.eechips
				}
			elseif context.before and not context.blueprint then -- Checks for spades to scale the tetrational chips.
				local scaled = false 
				for _, v in pairs(context.scoring_hand) do
					if v:is_suit("Spades") then
						card.ability.extra.eechips = card.ability.extra.eechips + card.ability.extra.eechips_gain
						juice_card(v)
						scaled = true
					end
				end
				if scaled then -- Shows the scaling message if tetrational chips were scaled
					return {
						message = localize({type = "variable", key = "powpow_chips", vars = {number_format(to_big(card.ability.extra.eechips))}}),
						colour = G.C.DARK_EDITION,
						message_card = card
					}
				end
			elseif context.using_consumeable and context.consumeable.ability.set == "Planet" then -- Check if a planet is used.
				if SMODS.pseudorandom_probability(card, 'para_astro_planets', card.ability.extra.numerator_planet, card.ability.extra.denominator_planet, 'para_astro_planets') then -- Check the 1 in 3 chance.
					return {
						level_up_hand = context.consumeable.ability.hand_type,
						level_up = true,
						message = localize('k_level_up_ex'),
						colour = G.C.SECONDARY_SET.Planet
					}
				end
			end
		end,
		in_pool = function(self, args)
			local spade_count = 0
			for _, v in ipairs(G.playing_cards) do
				if v:is_suit("Spades") then
					spade_count = spade_count + 1
				end
			end
			return next(SMODS.find_card("j_para_card", true)) and spade_count > 15
		end
	}
end
SMODS.Joker{ -- no way thats me
	key = 'paradox',
	atlas = 'Jokers_Soul',
	pos = {x = 0, y = 0},
	soul_pos = {x = 0, y = 1},
	cost = 10,
	rarity = "para_mythic",
	pools = {["parajoker"] = true},
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
        return {vars = {colours = {HEX("2dcddd"), HEX("262680")}}}
	end,
	calculate = function(self,card,context)
		if context.ending_shop then
			SMODS.add_card({set = "parajoker", edition = "e_negative", key_append = "para_paradox_joker"})
		end
	end,
	in_pool = function(self, args)
		local creationcount = 0
		local ismythic = false
		for _, v in pairs(G.jokers.cards) do
			if (v.config.center.pools or {}).parajoker then
				creationcount = creationcount + 1
				if v.config.center.rarity == "para_mythic" then
					ismythic = true
				end
			end
		end
		return ismythic or (creationcount >= 3)
	end
}