require("config.lazy")
require("lualine").setup()

local o = vim.opt
o.compatible = false
o.number = true
o.cmdheight = 2
o.expandtab = true
o.smarttab = true
o.shiftwidth = 4
o.tabstop = 4
o.ai = true
o.si = true

-- Key mappings
local wk = require("which-key")
wk.add({
  { "<leader>q", ":new ~/.nvim/init.lua<CR>", desc = "Edit neovim configuration" },
  { "<leader>c", group = "ChatGPT" },
  { "<leader>cc", ":ChatGPT<CR>", desc = "ChatGPT" },
  { "<leader>ce", ":ChatGPTEditWithInstructions<CR>", desc = "ChatGPT Edit Selection with Instructions" },
  { "<leader>n", group = "Neorg" },
  { "<leader>nt", ":Neorg journal today<CR>", desc = "Today" },
})
