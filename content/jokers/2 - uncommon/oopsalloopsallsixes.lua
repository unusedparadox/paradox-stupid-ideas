SMODS.Joker{
	key = 'oopsalloopsallsixes',
	atlas = 'HDCards',
	pos = {x = 0, y = 0},
	rarity = 2,
	pools = {["parajoker"] = true},
	blueprint_compat = false,
	cost = 6,
    unlocked = false,
	loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = G.P_CENTERS["j_oops"]
	end,
	para_credits = {
		["art"] = "UnusedParadox",
		["code"] = "UnusedParadox"
	},
    check_for_unlock = function(self, args)
        return args.type == 'chip_score' and args.chips >= to_big(10000) and next(SMODS.find_card("j_oops", true))
    end,
    locked_loc_vars = function(self, info_queue, card)
        return { vars = { number_format(to_big(10000)) } }
    end,
    no_collection = not PSI.config.joke,
    in_pool = function(self, args)
        return PSI.config.joke, { allow_duplicates = false }
    end
}
local shopcard = create_card_for_shop
function create_card_for_shop(area)
    if next(SMODS.find_card("j_para_oopsalloopsallsixes", false)) then
        local forced_tag = nil
        for k, v in ipairs(G.GAME.tags) do
          if not forced_tag then
            forced_tag = v:apply_to_run({type = 'store_joker_create', area = area})
            if forced_tag then
              for kk, vv in ipairs(G.GAME.tags) do
                if vv:apply_to_run({type = 'store_joker_modify', card = forced_tag}) then break end
              end
              return forced_tag end
          end
        end
        local card = SMODS.create_card{key = "j_oops", key_append = "sho", area = area}
        create_shop_card_ui(card, "Joker", area)
        G.E_MANAGER:add_event(Event({
            func = (function()
                for k, v in ipairs(G.GAME.tags) do
                  if v:apply_to_run({type = 'store_joker_modify', card = card}) then break end
                end
                return true
            end)
        }))
        return card
    end
    return shopcard(area)
end
local getpackref = get_pack
function get_pack(_key, _type)
    if next(SMODS.find_card("j_para_oopsalloopsallsixes", false)) then
        return G.P_CENTERS['j_oops']
    end
	return getpackref(_key, _type)
end
local shopvoucher = SMODS.add_voucher_to_shop
function SMODS.add_voucher_to_shop(key, dont_save)
    if next(SMODS.find_card("j_para_oopsalloopsallsixes", false)) then
    local card = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w/2,
        G.shop_vouchers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS["j_oops"],{bypass_discovery_center = true, bypass_discovery_ui = true})
        create_shop_card_ui(card, 'Joker', G.shop_vouchers)
        card:start_materialize()
        G.shop_vouchers:emplace(card)
        G.shop_vouchers.config.card_limit = #G.shop_vouchers.cards
        return card
    end
    return shopvoucher(key, dont_save)
end