local sql = require("lsqlite3")
local helper =require('nvim-todo.db')
local m = {}

function m.fetch_todos()
    local db = sql.open("todos.db")
    local exists = helper.check_table_exists(db)
    if exists == false then
       return
    end
    for a in db:rows("SELECT * FROM todo_list WHERE completed = 0;") do
        local todo = a['description']
        vim.print(todo)
    end
    db:close()
end

return m
