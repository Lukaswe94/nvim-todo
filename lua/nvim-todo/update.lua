local m = {}
local sql = require('lsqlite3')

function m.update_todo(todo)
    local db = sql.open("todos.db")
    local query = string.format([=[
    UPDATE todo_list
    SET completed = 1
    WHERE description = '%s';
    ]=], todo)
    print(query)
    local status = db:exec(query)
    if status ~= 0 then
        print(status)
    end
end

return m
