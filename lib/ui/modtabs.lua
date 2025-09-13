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
    PSI.config_infobox_text_txt = PSI.localize_old('k_para_infobox_descriptions')[PSI.infobox_map[G.PROFILES[G.SETTINGS.profile].para_infoboxes]]
    PSI.config_infobox_text = DynaText{
        scale = 0.4,
        colours = {G.C.UI.TEXT_LIGHT},
        string = {{ref_table = PSI ,ref_value = "config_infobox_text_txt"}},
        shadow = true, float = false, silent = true
    }
    local ret = {n = G.UIT.ROOT, config = { minw = 18, minh = 8 ,align = "tm",colour = G.C.UI.TRANSPARENT_DARK, r = 0.1 },
        nodes = {}
    }
    if not PSI.gameset_choice_disabled then
        ret.nodes[#ret.nodes+1] = {n = G.UIT.R, config = {align = "tm"}, nodes = {
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
        }}
        ret.nodes[#ret.nodes+1] = {n = G.UIT.R, config = {
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
    end
    ret.nodes[#ret.nodes+1] = {n = G.UIT.R, config = {align = "tm"}, nodes = {
        { n = G.UIT.C, config = {
            align = "cm", padding = 0.2,
            }, nodes = {
                {n = G.UIT.T, config = {
                    text = PSI.localize_old("k_para_config_infobox_txt"),
                    scale = 0.5,
                    colour = G.C.UI.TEXT_LIGHT
                }}
            }
        },
        { n = G.UIT.C, config = {
            align = "cm", padding = 0.2,
            }, nodes = {
                create_option_cycle({
                    options = PSI.localize_old('k_para_infobox_selects'),
                    scale = 0.7,
                    w = 4.5,
                    current_option = PSI.infobox_map[G.PROFILES[G.SETTINGS.profile].para_infoboxes],
                    opt_callback = "para_change_infobox_toggle",
                    ref_table = G.PROFILES[G.SETTINGS.profile],
                    ref_value = "para_infoboxes"
                })
            }
        },
    }}
    ret.nodes[#ret.nodes+1] = {n = G.UIT.R, config = {
        align = "bm"
        }, nodes = {
            {
                n = G.UIT.O,
                config = {
                    align = "bm",
                    object = PSI.config_infobox_text
                }
            }
        }}
    return ret
end