-- Find my cut challenges
--[[if PSI.is_bignum_enabled() and next(SMODS.find_mod("ChDp")) then
    SMODS.Challenge{
        loc_txt = "Endurance Test",
        key = 'endurance',
        rules = {
            custom = {
                {id = 'win_ante', value = 1000},
        },
            modifiers = {},
        },
        jokers = {
        },
        restrictions = {
            banned_cards = {},
            banned_tags = {},
            banned_other = {}
        },
    }
end]]--