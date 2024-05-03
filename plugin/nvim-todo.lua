if vim.g.loaded_nvim_todo then
    --return
end
vim.g.loaded_nvim_todo = 1
-- for Development i quess?
package.path = './lua/?.lua;./lua/?/?.lua;' .. package.path
package.cpath = package.cpath .. ";" ..  "lua_modules/lib/lua/5.1/?.so"

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

