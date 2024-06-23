local M = {}

M.find_child_index_by_id = function(id, children)
    local index = 1
    for _, child in pairs(children) do
        if child.id == id then return index end
        index = index + 1
    end
end

M.location_stack = {}

M.empty_stack = function() M.location_stack = {} end

M.peek_location = function() return M.location_stack[#M.location_stack] end

M.push_location = function(from, to)
    table.insert(M.location_stack, {from = from, to = to})
end

M.pop_location = function()
    return table.remove(M.location_stack, #M.location_stack)
end

return M
