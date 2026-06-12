local recalc_republican_debuffs = function()
    if next(SMODS.find_card("j_para_republicandiscordserver", false)) then
        for _, v in ipairs(G.jokers.cards) do
            if (v.config.center.pools or {}).para_republican then
                SMODS.debuff_card(v, false, "para_republicandiscordserver")
            else
                SMODS.debuff_card(v, true, "para_republicandiscordserver")
            end
        end
    else
        for _, v in ipairs(G.jokers.cards) do
            SMODS.debuff_card(v, false, "para_republicandiscordserver")
        end
    end
end
SMODS.Joker{
	key = 'republicandiscordserver',
	atlas = 'Jokers',
	pos = {x = 7, y = 3},
	rarity = 2,
	pools = {["parajoker"] = true, ["para_republican"] = true},
	blueprint_compat = false,
	cost = 6,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	},
	calculate = function(self,card,context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.blueprint then
            local jokers_to_create = math.min(G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer), 50)
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'para_republican',
                            key_append = 'para_republicandiscordserver'
                        }
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.RED,
            }
        elseif context.card_added and not context.blueprint then
            recalc_republican_debuffs()
            if context.card.ability.set == "Joker" and not (context.card.config.center.pools or {}).para_republican then
                SMODS.debuff_card(context.card, true, "para_republicandiscordserver")
            end
        end
	end,
	add_to_deck = function(self, card, from_debuff)
        recalc_republican_debuffs()
	end,
	remove_from_deck = function(self, card, from_debuff)
        recalc_republican_debuffs()
	end,
    no_collection = not PSI.config.joke,
    in_pool = function(self, args)
        return PSI.config.joke, { allow_duplicates = false }
    end,
    hpot_unbreedable = {mother = true, father = false}
}