local fetch = require('nvim-todo.fetch')
local insert = require('nvim-todo.insert')
local update = require('nvim-todo.update')

local M = {}
function M.setup(opts)
    
end

M.fetch_todos = fetch.fetch_todos
M.insert_todo = insert.insert_todo
M.update_todo = update.update_todo

return M
