--Xchips mode and Xmult mode
if not PSI.config.xchips then PSI.config.xchips = "standard" end
local effectcalc = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
	local newkey = key
	if (key == 'x_mult' or key == 'xmult' or key == 'Xmult' or key == 'x_mult_mod' or key == 'Xmult_mod') and amount ~= 1 and PSI.config.xchips == "extra" then
		newkey = "x_chips"
	elseif (key == "message") and PSI.config.xchips == "extra" and effect.Xmult_mod then
		return nil
	elseif (key == 'x_chips' or key == 'xchips' or key == 'Xchips' or key == 'x_chips_mod' or key == 'Xchips_mod') and amount ~= 1 and PSI.config.xchips == "none" then
		newkey = "x_mult"
	end
	return effectcalc(effect, scored_card, newkey, amount, from_edition)
end
--Green mode
if not PSI.config.green then PSI.config.green = false end
local _colors = G.C
PSI.greenless_colors = _colors

-- create proxy
G.C = {}
local function is_color_table(table)
	if type(table) == "table" then
		for _, v in pairs(table) do
			if type(v) == "table" then return true end
		end
	end
	return false
end
local function is_valid_color(table)
	if type(table) == "table" then
		for _, v in pairs(table) do
			if type(v) ~= "number" then return false end
		end
	end
	return true
end
local function replace_green_color(color)
	if type(color) == "table" and next(color) then
		local newcolor = copy_table(color)
		newcolor[1] = 0
		newcolor[2] = (color[1] + color[2] + color[3])/3
		newcolor[3] = 0
		return newcolor
	end
	return color
end
local function replace_green_table(table)
	local newtable = {}
	for k, v in pairs(table) do
		if not is_color_table(v) then
			newtable[k] = replace_green_color(v)
		elseif is_valid_color(v) then
			newtable[k] = replace_green_table(v)
		end
	end
	return newtable
end

-- create metatable
local mt = {
  __index = function (t,k)
	if not PSI.config.green then
    	return _colors[k]
	end
	if type(_colors[k]) == "table" then
		if k == "WHITE" or k == "BACKGROUND" or k == "GREY" or k == "BLACK" or k == "UI" or k == "DYN_UI" then return _colors[k] end
		if is_color_table(_colors[k]) then return replace_green_table(_colors[k]) end
		if is_valid_color(v) then return replace_green_color(_colors[k]) end
	end
	return _colors[k]
  end,

  __newindex = function (t,k,v)
    _colors[k] = v   -- update original table
  end,
  __pairs = function(table)
  
    -- Iterator function takes the table and an index and returns the next index and associated value
    -- or nil to end iteration
  
    local function stateless_iter(tbl, k)
      local v
      -- Implement your own key,value selection logic in place of next
      k, v = next(tbl, k)
      if nil~=v then return k,v end
    end
  
    -- Return an iterator function, the table, starting point
    return stateless_iter, _colors, nil
  end
}
setmetatable(G.C, mt)