package = "nvim-todo"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
dependencies = {
   "lua ~> 5.1",
    "luacheck >= 0.23.0",
    "lsqlite3 ~> 0.9.5"
}
build = {
   type = "builtin",
   modules = {
      ["nvim-todo.fetch"] = "lua/nvim-todo/fetch.lua",
      ["nvim-todo.init"] = "lua/nvim-todo/init.lua",
      ["nvim-todo.insert"] = "lua/nvim-todo/insert.lua",
      ["nvim-todo.update"] = "lua/nvim-todo/update.lua"
   }
}
