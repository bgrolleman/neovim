-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

--vim.api.nvim_set_keymap("n", "<leader>q", ":new /home/bgrolleman/.config/nvim", { noremap = false })
--   { "<leader>c", group = "ChatGPT" },
--   { "<leader>cc", ":ChatGPT<CR>", desc = "ChatGPT" },
--   { "<leader>ce", ":ChatGPTEditWithInstructions<CR>", desc = "ChatGPT Edit Selection with Instructions" },
--   { "<leader>n", group = "Neorg" },
--   { "<leader>nt", ":Neorg journal today<CR>", desc = "Today" },
