-- set cpath so that luarocks packages will be found
local function set_package_cpath(plugin_name)
    -- get file directory 
    local script_path = debug.getinfo(1).source:match("@?(.*/)")
    if script_path ~= nil then
        local _, end_idx = script_path:find(plugin_name, 1, true)
        script_path = script_path:sub(1, end_idx +1)
        package.cpath = package.cpath .. ";" .. script_path  ..  "lua_modules/lib/lua/5.1/?.so"
    end
    return script_path
end

local plugin_name = "nvim-todo"
-- check if db exists, create if not 
local script_path = set_package_cpath(plugin_name)
if script_path ~= nil then
    local db_path = script_path .. "todos.db"
    if vim.uv.fs_stat(db_path) == nil then
        require('nvim-todo.db').initialize()
    end
end

if vim.g.loaded_nvim_todo then
    return
end
vim.g.loaded_nvim_todo = 1

local todo  = require('nvim-todo')

-- :AddTodo
vim.api.nvim_create_user_command(
    'AddTodo',
    function (opts)
        todo.insert_todo(opts.fargs[1])
    end,
    {bang = true, desc = 'Add a Todo to the Todo list', nargs = 1}
)
-- :UpdateTodo
vim.api.nvim_create_user_command(
    'UpdateTodo',
    function (opts)
        todo.update_todo(opts.fargs[1])
    end,
    {bang = true, desc = 'Add a Todo to the Todo list', nargs = 1}
)
-- :FetchTodos
vim.api.nvim_create_user_command(
    'FetchTodos',
    todo.fetch_todos,
    {bang = true, desc = 'Add a Todo to the Todo list', nargs = 0}
)


