local popup = require('plenary.popup')

function ShowMenu()
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    local height = 20
    local width = 60
    local picker_win_id = popup.create({}, {
        title = 'Todo list',
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
        cb = function (_, sel)
            print("it works")
        end
    }) 
    --local bufnr = vim.api.nvim_win_get_buf(win_id)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<cmd>lua CloseMenu()<CR>', {silent = false})
    local prompt_win_id = popup.create({}, {
        title = 'Add a Todo',
        line = math.floor(((vim.o.lines - height) / 2) + 22),
        col = math.floor((vim.o.columns - width) / 2),
        minheight = 1,
        minwidth = 60,
        borderchars = borderchars
    })
end

