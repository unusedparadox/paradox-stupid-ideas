-- Find my cut challenges
--[[if next(SMODS.find_mod("ChDp")) then
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
end]]--