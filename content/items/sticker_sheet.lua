PSI.Item{
    key = "sticker_sheet",
    badge_colour = HEX('7a939f'),
    autogen_consumable = true,
    pos = { x = 2, y = 2 },
    config = {extra = {
        money = 8,
        disallowed_stickers = {
            paperback_corroded = true,
            paperback_temporary = true, --was considering having this apply but it feels unfair
            paperback_energized = true,
            minty_hooked = true,
        },
        applied = false,
    }},
    calculate = function(self, card, context, item)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if context.beat_boss then
                local valid_stickers = {}
                for k, v in pairs(SMODS.Stickers) do
                    if not card.ability[k] and not v.para_sticker_extension and
                    not (v.para_sticker_sheet_compat == false) and
                    not item.ability.extra.disallowed_stickers[k] then
                        if type(v.should_apply) == 'function' and
                        v:should_apply(card, card.config.center, card.area, true) then
                            if PSI.check_sticker_compat(card, k) then valid_stickers[#valid_stickers+1] = k end
                        end
                        if k == "eternal" or k == "rental" or k == "perishable" then
                            if card.config.center[k.."_compat"] ~= false then
                                if PSI.check_sticker_compat(card, k) then valid_stickers[#valid_stickers+1] = k end
                            end
                        end
                    end
                end
                if next(valid_stickers) then
                    local sticker = pseudorandom_element(valid_stickers, "i_para_sticker_sheet" .. G.GAME.round_resets.ante)
                    card:add_sticker(sticker, true)
                    item.ability.extra.applied = true
                    return {message = localize{type = 'variable', key = 'para_stickerapplied',
                    vars = {localize({type = "name_text", set = "Other", key = sticker})}},
                    colour = sticker.badge_colour}
                end
                item.ability.extra.applied = false
                return {message = localize("para_k_nostickers")}
            else
                item.ability.extra.applied = false
            end
        end
    end,
    loc_vars = function(self, info_queue, card, item)
        return {vars = {item.ability.extra.money}}
    end,
    calc_dollar_bonus = function(self, card, item)
        if item.ability.extra.applied then
            item.ability.extra.applied = false
            return item.ability.extra.money
        end
    end,
    collection_loc_vars = function(self, info_queue, card, item)
        return {vars = {self.config.extra.money}}
    end
}