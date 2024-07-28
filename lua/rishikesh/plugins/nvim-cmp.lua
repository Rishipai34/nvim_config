return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}


--older version from here on 


--local cmp_status, cmp = pcall(require, "cmp")
--if not cmp_status then 
--  return
--end
--
--local luasnip_status, luasnip = pcall(require, "luasnip")
--if not luasnip_status then 
--  return 
--end
--
----call lsp server
---- local lspconfig_status, lspconfig = pcall(require, "lspconfig")
---- if not lspconfig_status then 
----   return 
---- end 
----
---- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
----
---- lspconfig.lua_ls.setup({
----   capabilities = lsp_capabilities,
---- })
--
---- import lspkind plugin safely
--local lspkind_status, lspkind = pcall(require, "lspkind")
--if not lspkind_status then
--  return
--end
----load some snippets 
--require("luasnip/loaders/from_vscode").lazy_load()
--
--vim.opt.completeopt = "menu,menuone,noselect"
--
--cmp.setup({
--  snippet = {
--    expand = function(args)
--      luasnip.lsp_expand(args.body)
--    end,
--  },
--  mapping = cmp.mapping.preset.insert({
--    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
--    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--    ["<C-f>"] = cmp.mapping.scroll_docs(4),
--    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
--    ["<CR>"] = cmp.mapping.confirm({ select = false }),
--  }),
--  -- sources for autocompletion
--  sources = cmp.config.sources({
----    { name = "nvim_lsp" }, -- lsp
--    { name = "luasnip" }, -- snippets
--    { name = "buffer" }, -- text within current buffer
--    { name = "path" }, -- file system paths
--    { name = 'nvim-lsp'},
--  }),
--  -- configure lspkind for vs-code like icons
----   formatting = {
----     format = lspkind.cmp_format({
----       maxwidth = 50,
----       ellipsis_char = "...",
----     }),
----   },
--  })
