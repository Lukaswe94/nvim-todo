local popup = require('plenary.popup')

function ShowMenu()
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    local win_id = popup.create({}, {
        title = 'todo',
        lines = vim.o.lines / 2,
        col = vim.o.columns / 2,
        minwidth = 60,
        minheight = 30,
        borderchars = borderchars,
        cb = function (_, sel)
            print("it works")
        end
    }) 

end
