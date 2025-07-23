if next(SMODS.find_mod("Talisman")) and Talisman and (Talisman.config_file.score_opt_id >= 2) then
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
end
SMODS.Challenge{
    loc_txt = "Easy...?",
    key = 'easy',
    rules = {
        custom = {
            {id = 'win_ante', value = 2},
    },
        modifiers = {},
    },
    jokers = {
    },
    deck = {cards = {}},
    restrictions = {
        banned_cards = {},
        banned_tags = {},
        banned_other = {}
    },
}