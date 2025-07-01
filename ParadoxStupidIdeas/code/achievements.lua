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
    key = 'nineelevenplus',
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,
    unlock_condition   = function(self, args)
        if args.type ~= 'nineeleven' then
            return false
        end
        local today = os.date("%m/%d")
        return today == "09/11"
    end
}