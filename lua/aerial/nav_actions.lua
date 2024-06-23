local aerial = require("aerial")
local navstack = require("aerial.navigation_stack")

local M = {}


M.jump = {
  desc = "Jump to the symbol under the cursor",
  callback = function(nav)
    local symbol = nav:get_current_symbol()
    nav:close()
    if symbol then
      require("aerial.navigation").select_symbol(symbol, nav.winid, nav.bufnr, { jump = true })
    end
  end,
}

M.jump_vsplit = {
  desc = "Jump to the symbol in a vertical split",
  callback = function(nav)
    local symbol = nav:get_current_symbol()
    nav:close()
    if symbol then
      require("aerial.navigation").select_symbol(
        symbol,
        nav.winid,
        nav.bufnr,
        { jump = true, split = "vertical" }
      )
    end
  end,
}

M.jump_split = {
  desc = "Jump to the symbol in a horizontal split",
  callback = function(nav)
    local symbol = nav:get_current_symbol()
    nav:close()
    if symbol then
      require("aerial.navigation").select_symbol(
        symbol,
        nav.winid,
        nav.bufnr,
        { jump = true, split = "horizontal" }
      )
    end
  end,
}

M.left = {
  desc = "Navigate to parent symbol",
  callback = function(nav)
    local symbol = nav:get_current_symbol()
    if symbol and symbol.parent then
      navstack.push_location(symbol.id,symbol.parent.id)
      nav:focus_symbol(symbol.parent)
    end
  end,
}

M.right = {
  desc = "Navigate to child symbol",
  callback = function(nav)
    local symbol = nav:get_current_symbol()
    if symbol and symbol.children and not vim.tbl_isempty(symbol.children) then
      local where_from = navstack.peek_location()
      if where_from == nil then
        nav:focus_symbol(symbol.children[1])
      elseif where_from.to ~= symbol.id then
        navstack.empty_stack()
        nav:focus_symbol(symbol.children[1])
      else
        navstack.pop_location()
        local index = navstack.find_child_index_by_id(where_from.from,symbol.children)
        nav:focus_symbol(symbol.children[index])
      end
    end
  end,
}

M.close = {
  desc = "Close the nav windows",
  callback = function()
    navstack.empty_stack()
    aerial.nav_close()
  end,
}

return M
