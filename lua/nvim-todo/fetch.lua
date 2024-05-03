--module('fetch', package.seeall)

local sql = require("lsqlite3")
local m = {}

function m.fetch_todos()
    local db = sql.open("todos.db")
    for a in db:nrows("SELECT * FROM todo_list WHERE completed = 0;") do
        local todo = a['description']
        vim.print(todo)
    end
    db:close()
end

return m
