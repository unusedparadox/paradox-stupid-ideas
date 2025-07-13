SMODS.Achievement{
    key = 'deathbypineapple',
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,
    unlock_condition = function(self, args)
        return args.type == 'deathbypineapple'
    end
}
SMODS.Achievement{
    key = 'cardcollector',
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,
    unlock_condition = function(self, args)
        return args.type == 'cardcollector'
    end
}