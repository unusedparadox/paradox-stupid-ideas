SMODS.Joker{
	key = 'garagefork',
	config = { extra = {
		numerator = 1,
		denominator = 6,
        odds = true -- grab bag
	}
	},
	pools = { ["parajoker"] = true },
	rarity = 2,
	cost = 7,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'Jokers',
	pos = {x = 1, y = 2},
	loc_vars = function(self,info_queue,card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card,
		card.ability.extra.numerator, card.ability.extra.denominator, 'para_garagefork')
		return {vars = {new_numerator, new_denominator}}
	end
}
SMODS.Booster:take_ownership_by_kind('Arcana', {
        create_card = function(self, card, i)
            local _card, spect_fork
            local spect_omen = (G.GAME.used_vouchers.v_omen_globe and pseudorandom('omen_globe') > 0.8)
            local silly = G.GAME.used_vouchers.v_fmod_circus and pseudorandom("circus") > 0.8
            for _, v in ipairs(SMODS.find_card("j_para_garagefork", false)) do
                if SMODS.pseudorandom_probability(card, 'para_garagefork', v.ability.extra.numerator,
                v.ability.extra.denominator, 'para_garagefork') then
                    spect_fork = true
                    break
                end
            end
            if spect_fork then
                _card = {
                    set = "Spectral",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append =
                    "para_spectral_arcana_fork"
                }
            elseif silly then
                _card = {
                    set = "Silly",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "sil1"
                }
            elseif spect_omen then
                _card = {
                    set = "Spectral",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append =
                    "ar2"
                }
            else
                _card = {
                    set = "Tarot",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append =
                    "ar1"
                }
            end
            return _card
        end,
    },
    true
)
SMODS.Booster:take_ownership_by_kind('Celestial', {
        create_card = function(self, card, i)
            local _card, spect, scope, _planet
            if (G.GAME.used_vouchers.v_telescope) and i == 1 then
                local _hand = PSI.mostplayedhand(false)[1]
                for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == _hand then
                        _planet = v.key
                    end
                end
                if _planet then scope = true end
            end
            if not scope then
                for _, v in ipairs(SMODS.find_card("j_para_garagefork", false)) do
                    if SMODS.pseudorandom_probability(card, 'para_garagefork', v.ability.extra.numerator,
                    v.ability.extra.denominator, 'para_garagefork') then
                        spect = true
                        break
                    end
                end
            end
            if scope then
                _card = {
                    set = "Planet",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key = _planet,
                    key_append = "pl1"
                }
            elseif spect then
                _card = {
                    set = "Spectral",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append =
                    "ar2"
                }
            else
                _card = {
                    set = "Planet",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append =
                    "ar1"
                }
            end
            return _card
        end,
    },
    true
)