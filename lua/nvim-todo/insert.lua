local m = {}
local sql = require('lsqlite3')

function m.insert_todo(input)
    if input ~= nil then
        local db =  sql.open("todos.db")
        local query =string.format([=[
        INSERT INTO todo_list(description) VALUES("%s");
        ]=],  input)
        local status = db:exec(query)
        if status ~= 0 then
            print(db:errmsg())
        end
        db:close()
    end
end

return m
