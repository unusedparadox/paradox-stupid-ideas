PSI.get_infobox_settings = function()
    if G.PROFILES[G.SETTINGS.profile].para_infoboxes == "standard" then return {standard = true, none = false, extra = false}
    elseif G.PROFILES[G.SETTINGS.profile].para_infoboxes == "extra" then return {standard = false, none = false, extra = true}
    elseif G.PROFILES[G.SETTINGS.profile].para_infoboxes == "none" then return {standard = false, none = true, extra = false} end
    return {unfiltered = false, upgraded = true}
end
G.FUNCS.para_change_infobox_toggle = function(e)
    local text_col = G.C.UI.TEXT_LIGHT
    G.PROFILES[G.SETTINGS.profile].para_infoboxes = PSI.rev_infobox_map[e.to_key]
    G:save_settings()
    PSI.config_infobox_text_txt = PSI.localize_old('k_para_infobox_descriptions')[PSI.infobox_map[G.PROFILES[G.SETTINGS.profile].para_infoboxes]]
    PSI.config_infobox_text.colours = {text_col}
    PSI.config_infobox_text:update_text(true)
    PSI.config_infobox_text:update()
end
local mainmenu_old = Game.main_menu
function Game:main_menu(ctx)
    local ret = mainmenu_old(self,ctx)
    if not G.PROFILES[G.SETTINGS.profile].para_infoboxes then
        G.PROFILES[G.SETTINGS.profile].para_infoboxes = "standard"
    end
    return ret
end
PSI.infobox_map = {
    ["none"] = 1,
    ["standard"] = 2,
    ["extra"] = 3
}
PSI.rev_infobox_map = {
  "none", "standard", "extra"
}
PSI.localize_old = localize
--[[PSI.recursive_optimize = function(data)
    if type(data) == "string" then
        return PSI.localize_old("k_para_optimize")
    elseif type(data) == "table" then
        local new_data = {}
        for k, v in pairs(data) do
            new_data[k] = PSI.recursive_optimize(v)
        end
        return new_data
    end
end
localize = function(args)
    local result = PSI.localize_old(args)
    if not PSI.get_infobox_settings().none then
        return result
    else
        return PSI.recursive_optimize(result)
    end
end]]--
local cardui = generate_card_ui
generate_card_ui = function(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
    if PSI.get_infobox_settings().none then
        --return {card_type = "Tarot", info = {{}}, ability_UIBox_table = {card_type = "Tarot"}, badges = {}, main = {}, box_colors = {true}}
        return nil
    end
    return cardui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
end
local cardpopup = G.UIDEF.card_h_popup
G.UIDEF.card_h_popup = function(card)
    if PSI.get_infobox_settings().none then
        return nil
    end
    return cardpopup(card)
end
local detailed_tooltip = create_UIBox_detailed_tooltip
create_UIBox_detailed_tooltip = function(tooltip)
    if PSI.get_infobox_settings().none then
        return nil
    end
    return detailed_tooltip(tooltip)
end