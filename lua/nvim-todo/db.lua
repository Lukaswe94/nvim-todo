local sqlite = require('lsqlite3')

local m = {}

function m.initialize()
    local db = sqlite.open('todos.db')
    local query = [=[
        CREATE TABLE todo_list(
        id INTEGER PRIMARY KEY UNIQUE,
        description TEXT NOT NULL,
        completed INTEGER DEFAULT 0
        );
    ]=]
    local status = db:exec(query)
    print(status)
    db:close()
end

function m.check_table_exists(db)
    local status = db:exec([=[SELECT name FROM sqlite_master WHERE type='table' AND name='todo_list';]=])
    if status ~= 0 then
        return false
    end
    return true
end

return m
