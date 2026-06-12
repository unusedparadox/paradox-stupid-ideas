PSI.xchips_map = {
    ["none"] = 1,
    ["standard"] = 2,
    ["extra"] = 3
}
PSI.rev_xchips_map = {
  "none", "standard", "extra"
}
G.FUNCS.para_change_xchips_toggle = function(e)
    local text_col = G.C.UI.TEXT_LIGHT
    PSI.config.xchips = PSI.rev_xchips_map[e.to_key]
    PSI.config_xchips_text_txt = localize("para_xchips_desc")[PSI.xchips_map[PSI.config.xchips]]
    PSI.config_xchips_text.colours = {text_col}
    PSI.config_xchips_text:update_text(true)
    PSI.config_xchips_text:update()
end
SMODS.current_mod.config_tab = function ()
    PSI.config_infobox_text_txt = PSI.localize_old('k_para_infobox_descriptions')[PSI.infobox_map[G.PROFILES[G.SETTINGS.profile].para_infoboxes]]
    PSI.config_infobox_text = DynaText{
        scale = 0.4,
        colours = {G.C.UI.TEXT_LIGHT},
        string = {{ref_table = PSI ,ref_value = "config_infobox_text_txt"}},
        shadow = true, float = false, silent = true
    }
    PSI.config_xchips_text_txt = localize("para_xchips_desc")[PSI.xchips_map[PSI.config.xchips]]
    PSI.config_xchips_text = DynaText{
        scale = 0.4,
        colours = {G.C.UI.TEXT_LIGHT},
        string = {{ref_table = PSI ,ref_value = "config_xchips_text_txt"}},
        shadow = true, float = false, silent = true
    }
    local ret = {n = G.UIT.ROOT, config = { minw = 18, minh = 8 ,align = "tm",colour = G.C.UI.TRANSPARENT_DARK, r = 0.1 },
        nodes = {}
    }
    if not PSI.gameset_choice_disabled then
        ret.nodes[#ret.nodes+1] = {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
                create_toggle({
                    label = localize("para_joke"),
                    active_colour = G.C.RED,
                    ref_table = PSI.config,
                    ref_value = "joke",
                })
            }
        }
    end
    ret.nodes[#ret.nodes+1] = {n = G.UIT.R, config = {align = "tm"}, nodes = {
        { n = G.UIT.C, config = {
            align = "cm", padding = 0.2,
            }, nodes = {
                {n = G.UIT.T, config = {
                    text = localize("k_para_config_infobox_txt"),
                    scale = 0.5,
                    colour = G.C.UI.TEXT_LIGHT
                }}
            }
        },
        { n = G.UIT.C, config = {
            align = "cm", padding = 0.2,
            }, nodes = {
                create_option_cycle({
                    options = localize('k_para_infobox_selects'),
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
        }
    }
    ret.nodes[#ret.nodes+1] = {n = G.UIT.R, config = {align = "tm"}, nodes = {
        { n = G.UIT.C, config = {
            align = "cm", padding = 0.2,
            }, nodes = {
                {n = G.UIT.T, config = {
                    text = localize("para_xchips_mode"),
                    scale = 0.5,
                    colour = G.C.UI.TEXT_LIGHT
                }}
            }
        },
        { n = G.UIT.C, config = {
            align = "cm", padding = 0.2,
            }, nodes = {
                create_option_cycle({
                    options = localize('k_para_infobox_selects'),
                    scale = 0.7,
                    w = 4.5,
                    current_option = PSI.xchips_map[PSI.config.xchips],
                    opt_callback = "para_change_xchips_toggle",
                    ref_table = PSI,
                    ref_value = "xchips"
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
                    object = PSI.config_xchips_text
                }
            }
        }
    }
    ret.nodes[#ret.nodes+1] = {
        n = G.UIT.R,
        config = { align = "cm" },
        nodes = {
            create_toggle({
                label = localize("para_green_mode"),
                active_colour = G.C.GREEN,
                ref_table = PSI.config,
                ref_value = "green",
            })
        }
    }
    return ret
end