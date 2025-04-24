require("config.lazy")
require('lualine').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  }, 
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer', keyword_length = 3 },
  },
  window = {
	  documentation = cmp.config.window.bordered()
  },
  formatting = {
	  fields = {'menu', 'abbr', 'kind'},
	  format = function(entry, item)
		  local menu_icon = {
			  nvim_lsp = '[LSP]',
			  luasnip = '[SNIP]',
			  buffer = '[BUF]',
			  path = '[PATH]',
		  }
		  item.menu = menu_icon[entry.source.name]
		  return item
	  end
  },
}


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
local wk = require('which-key')
wk.add({
    { "<leader>q", ":new ~/.nvim/init.lua<CR>", desc = "Edit neovim configuration" },
    { "<leader>c", group = "ChatGPT" },
    { "<leader>cc", ":ChatGPT<CR>", desc = "ChatGPT" },
    { "<leader>ce", ":ChatGPTEditWithInstructions<CR>", desc = "ChatGPT Edit Selection with Instructions" },
    { "<leader>n", group = "Neorg" },
    { "<leader>nt", ":Neorg journal today<CR>", desc = "Today" },
})
