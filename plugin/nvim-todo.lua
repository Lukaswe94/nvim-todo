local plugin_name = "nvim-todo"
local script_path = debug.getinfo(1).source:match("@?(.*/)")
local _, end_idx = script_path:find(plugin_name, 1, true)
script_path = script_path:sub(1, end_idx +1)
package.cpath = package.cpath .. ";" .. script_path  ..  "lua_modules/lib/lua/5.1/?.so"

if vim.g.loaded_nvim_todo then
   return
end
vim.g.loaded_nvim_todo = 1
-- for Development i quess?
--package.path = './lua/?.lua;./lua/?/?.lua;' .. package.path


local todo  = require('nvim-todo')
-- Create a command, ':AddTodo'
vim.api.nvim_create_user_command(
    'AddTodo',
    function (opts)
        todo.insert_todo(opts.fargs[1])
    end,
    {bang = true, desc = 'Add a Todo to the Todo list', nargs = 1}
)

-- Create a command, ':UpdateTodo'
vim.api.nvim_create_user_command(
    'UpdateTodo',
    function (opts)
        todo.update_todo(opts.fargs[1])
    end,
    {bang = true, desc = 'Add a Todo to the Todo list', nargs = 1}
)
-- Create a command, ':UpdateTodo'

vim.api.nvim_create_user_command(
    'FetchTodos',
    todo.fetch_todos,
    {bang = true, desc = 'Add a Todo to the Todo list', nargs = 0}
)

