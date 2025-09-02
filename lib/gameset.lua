-- I'm gonna be honest 99% of this is Aikoshen code and the other 1% is also Aikoshen code
PSI.gameset = {
    unfiltered = nil,
    upgraded = nil
}
G.FUNCS.para_advance_config = function(e)
    if G.para_current_page == "intro" then
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu({
            definition = PSI.UIBox_gameset_config("details"),
            config = {
                align = "cm",
                offset = {x=-2,y=10},
                major = G.ROOM_ATTACH,
                bond = 'Weak',
                no_esc = true
            }
        })
    elseif G.para_current_page == "details" then
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu({
            definition = PSI.UIBox_gameset_config("pick"),
            config = {
                align = "cm",
                offset = {x=-2,y=10},
                major = G.ROOM_ATTACH,
                bond = 'Weak',
                no_esc = true
            }
        })
    elseif G.para_current_page == "pick" then
        local picked = nil
        if PSI.gameset.upgraded then
            picked = 'upgraded'
        end
        if PSI.gameset.unfiltered then
            picked = 'unfiltered'
        end
        if picked then
            G.PROFILES[G.SETTINGS.profile].para_gameset = picked
            G:save_settings()
            G.para_current_page = nil
            G.FUNCS.exit_overlay_menu()
            if G.PARA_PARADOX then
                G.para_paradox_y = 20
                G.E_MANAGER:add_event(Event{
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if G.PARA_PARADOX then
                            G.PARA_PARADOX:remove()
                            G.PARA_PARADOX = nil
                        end
                        return true
                    end
                })
            end
            G.SETTINGS.paused = false
        end
    end
end
G.FUNCS.para_gameset_button_enabled = function(e)
  if not PSI.gameset.unfiltered and not PSI.gameset.upgraded then
    e.config.colour = G.C.GREY
    e.config.button = nil
  else
    e.config.colour = G.C.GREEN
    e.config.button = "para_advance_config"
  end
end
PSI.wrap_in_col = function(table_ui)
    local x = {}
    for _,v in ipairs(table_ui) do
        x[#x+1] = { n = G.UIT.C, nodes = {v}}
    end
    return x
end
G.FUNCS.para_select_gameset_checkbox = function(val, e)
    print(val, e)
    if e.config.ref_table.ref_value == "unfiltered" then
        PSI.gameset.unfiltered = true
        PSI.gameset.upgraded = false
    end
    if e.config.ref_table.ref_value == "upgraded" then
        PSI.gameset.upgraded = true
        PSI.gameset.unfiltered = false
    end
end
PSI.UIBox_gameset_config = function(page)
    G.para_current_page = page
    local child_elements = {}
    local buttons = {}
    local shx = {}
    if page == "intro" then
        localize{type = "descriptions", key = "para_gameset_intro", set = "Para_Dialogue", default_col = G.C.WHITE, nodes = shx, vars = {}, scale = 2}
        child_elements = {transparent_multiline_text(shx)}
        buttons = {
        UIBox_button({
            label = {localize('k_para_next')},
            button = 'para_advance_config',
            page = page,
            colour = G.C.BLUE,
            minw = 4
        }),
      }
    elseif page == "details" then
        localize{type = "descriptions", key = "para_gameset_details", set = "Para_Dialogue", default_col = G.C.WHITE, nodes = shx, vars = {}, scale = 2}
        child_elements = {transparent_multiline_text(shx)}
        buttons = {
        UIBox_button({
            label = {localize('k_para_next')},
            button = 'para_advance_config',
            page = page,
            colour = G.C.BLUE,
            minw = 4
        }),
      }
    elseif page == "pick" then
        child_elements = {
            { n = G.UIT.R, config = { padding = 0.1, align = "cl" }, nodes = {
                { n = G.UIT.C, config = { padding = 0.1, align = "cl" }, nodes = {
                    create_toggle({w = 0, label = '', scale = 1, ref_table = PSI.gameset, ref_value = 'unfiltered', callback = G.FUNCS.para_select_gameset_checkbox}),
                }},
                { n = G.UIT.C, config = { padding = 0.1, align = "cl" }, nodes = {
                    { n = G.UIT.T, config = { colour = G.C.WHITE, text = localize('k_para_unfiltered_dialog_text'), scale = 0.8}}
                }}
            }},
            { n = G.UIT.R, nodes = {
                { n = G.UIT.T, config = { colour = G.C.JOKER_GREY, text = localize('k_para_unfiltered_dialog_description'), scale = 0.5}}
            }},
            { n = G.UIT.R, config = { h = 0.5, w = 0.1 }, nodes = {{ n = G.UIT.B, config = { h = 0.5, w = 0.1 } },}},
            { n = G.UIT.R, config = { padding = 0.1, align = "cl" }, nodes = {
                { n = G.UIT.C, config = { padding = 0.1, align = "cl" }, nodes = {
                    create_toggle({w = 0, label = '', scale = 1, ref_table = PSI.gameset, ref_value = 'upgraded', callback = G.FUNCS.para_select_gameset_checkbox}),
                } or {
                    {
                    n = G.UIT.R, config = { align = "cm", minw = 0.5, minh = 0.5, padding = 0.2, colour = G.C.UI.TEXT_INACTIVE, outline = 1.5, outline_colour = G.C.WHITE, r = 0.2, emboss = 0.1 },
                    nodes = {
                        { n = G.UIT.T, config = { text = "-", colour = G.C.WHITE, scale = 0.3}}
                    }
                    }
                },},
                { n = G.UIT.C, config = { padding = 0.1, align = "cl" }, nodes = {
                    { n = G.UIT.T, config = { colour = G.C.WHITE, text = localize('k_para_upgraded_dialog_text'), scale = 0.8}}
                }}
                }},
            { n = G.UIT.R, nodes = {
                { n = G.UIT.T, config = { colour = G.C.JOKER_GREY, text = localize('k_para_upgraded_dialog_description'), scale = 0.5}}
            }},
        }
        buttons = {
        UIBox_button({
            label = {localize('k_para_end')},
            button = 'para_advance_config',
            func = 'para_gameset_button_enabled',
            page = page,
            minw = 4
        }),
      }
    end
    return {
        n = G.UIT.ROOT, config = { align = "cm", colour = {0.32,0.36,0.41,0.6}, padding = 32.01, r = 0.1, can_collide = true}, nodes = {
            {
                n = G.UIT.R, config = {padding = 0.0},  nodes = {
                    {
                        n = G.UIT.R, config = {align = "cm", r = 0.1, padding = 0.05, minh = G.ROOM.T.h - 3, minw = G.ROOM.T.w - 4, can_collide = true, colour = G.C.L_BLACK, outline_colour = G.C.JOKER_GREY, emboss = 0.1}, nodes = child_elements
                    },
                    {
                        n = G.UIT.R, config = {align = "cr", r = 0.1, padding = 0.2, minh = 1, minw = G.ROOM.T.w - 4, can_collide = true, colour = mix_colours(G.C.L_BLACK,G.C.BLACK,0.5), outline_colour = mix_colours(G.C.JOKER_GREY,G.C.BLACK,0.5), emboss = 0.1 }, nodes = {
                        {
                            n = G.UIT.C, config = { padding = 0.2 }, nodes = PSI.wrap_in_col(buttons)
                        }
                        }
                    },
                }
            }
        }
    }
end
PSI.start_onboarding = function()
    G.E_MANAGER:add_event(Event{
        trigger = 'after',
        delay = 0,
        func = function()
            if not G.PROFILES[G.SETTINGS.profile].para_gameset then
                G.SETTINGS.paused = true
                G.FUNCS.overlay_menu({
                    definition = PSI.UIBox_gameset_config("intro"),
                    config = {
                        align = "cm",
                        offset = {x=-2,y=10},
                        major = G.ROOM_ATTACH,
                        bond = 'Weak',
                        no_esc = true
                    }
                })
                local atl = G.ASSET_ATLAS['para_paradox_intro']
                local scale = 60
                G.PARA_PARADOX = G.PARA_PARADOX or Sprite(16,12,scale*atl.px/1000,scale*atl.py/1000, atl,{ x = 0, y = 0 })
                G.PARA_PARADOX.T.y = 3
                G.para_paradox_y = 0
            end
            return true
        end
    }, "para_desc")
end
local mainmenu_old = Game.main_menu
function Game:main_menu(ctx)
    local ret = mainmenu_old(self,ctx)
    if not PSI.gameset_choice_disabled and PSI.gameset_startup_screen_enabled then
        PSI.start_onboarding()
    end
    if not G.PROFILES[G.SETTINGS.profile].para_gameset then
        G.PROFILES[G.SETTINGS.profile].para_gameset = "upgraded"
    end
    return ret
end
PSI.balance_map = {
    ["unfiltered"] = 1,
    ["upgraded"] = 2
}
PSI.rev_balance_map = {
  "unfiltered", "upgraded"
}
G.FUNCS.para_change_balance_toggle = function(e)
    local text_col = G.C.UI.TEXT_LIGHT
    G.PROFILES[G.SETTINGS.profile].para_gameset = PSI.rev_balance_map[e.to_key]
    if PSI.rev_balance_map[e.to_key] == "unfiltered" then
        PSI.gameset.unfiltered = true
        PSI.gameset.upgraded = false
    else
        PSI.gameset.unfiltered = false
        PSI.gameset.upgraded = true
    end
    G:save_settings()
    PSI.config_balance_text_txt = localize('k_para_balance_descriptions')[PSI.balance_map[G.PROFILES[G.SETTINGS.profile].para_gameset]]
    PSI.config_balance_text.colours = {text_col}
    PSI.config_balance_text:update_text(true)
    PSI.config_balance_text:update()
end
SMODS.current_mod.config_tab = function ()
    PSI.config_balance_text_txt = localize('k_para_balance_descriptions')[PSI.balance_map[G.PROFILES[G.SETTINGS.profile].para_gameset]]
    PSI.config_balance_text = DynaText{
        scale = 0.4,
        colours = {G.C.UI.TEXT_LIGHT},
        string = {{ref_table = PSI ,ref_value = "config_balance_text_txt"}},
        shadow = true, float = false, silent = true
    }
    PSI.info_balance_text = {}
    for k, v in ipairs(localize("para_info_balance_text")) do
        PSI.info_balance_text[k] = DynaText{
            scale = 0.4,
            colours = {G.C.UI.TEXT_LIGHT},
            string = v,
            shadow = true, float = false, silent = true
        }
    end
    if not PSI.gameset_choice_disabled then
        local ret = {n = G.UIT.ROOT, config = { minw = 18, minh = 8 ,align = "tm",colour = G.C.UI.TRANSPARENT_DARK, r = 0.1 },
            nodes = {
                {n = G.UIT.R, config = {align = "tm"}, nodes = {
                    { n = G.UIT.C, config = {
                        align = "cm", padding = 0.2,
                        }, nodes = {
                            {n = G.UIT.T, config = {
                                text = localize("k_para_config_balance_txt"),
                                scale = 0.5,
                                colour = G.C.UI.TEXT_LIGHT
                            }}
                        }
                    },
                    { n = G.UIT.C, config = {
                        align = "cm", padding = 0.2,
                        id = "para_gameset_config_desc_dyna"
                        }, nodes = {
                            create_option_cycle({
                                options = localize('k_para_balance_selects'),
                                scale = 0.7,
                                w = 4.5,
                                current_option = PSI.balance_map[G.PROFILES[G.SETTINGS.profile].para_gameset],
                                opt_callback = "para_change_balance_toggle",
                                ref_table = G.PROFILES[G.SETTINGS.profile],
                                ref_value = "para_gameset"
                            })
                        }
                    },
                }},
                {n = G.UIT.R, config = {
                    align = "bm"
                },
                nodes = {
                    {
                        n = G.UIT.O,
                        config = {
                            align = "bm",
                            object = PSI.config_balance_text
                        }
                    }
                }}
            }
        }
        for k, _ in ipairs(PSI.info_balance_text) do
            ret.nodes[#ret.nodes+1] = {n = G.UIT.R, config = {
                    align = "bm"
                },
                nodes = {
                    {
                        n = G.UIT.O,
                        config = {
                            align = "bm",
                            object = PSI.info_balance_text[k]
                        }
                    }
                }}
        end
        return ret
    end
end
PSI.get_gameset = function()
    if PSI.forced_gameset then
        if PSI.forced_gameset == "unfiltered" then return {unfiltered = true, upgraded = false}
        elseif PSI.forced_gameset == "upgraded" then return {unfiltered = false, upgraded = true} end
    end
    if not PSI.gameset_choice_disabled then
        if G.PROFILES[G.SETTINGS.profile].para_gameset == "unfiltered" then return {unfiltered = true, upgraded = false}
        elseif G.PROFILES[G.SETTINGS.profile].para_gameset == "upgraded" then return {unfiltered = false, upgraded = true} end
    end
    return {unfiltered = false, upgraded = true}
end