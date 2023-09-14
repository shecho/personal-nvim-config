return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- some
        "hrsh7th/cmp-nvim-lua", -- no idea
        "hrsh7th/cmp-cmdline", -- no idea
        "hrsh7th/cmp-look", -- no idea
        "hrsh7th/cmp-vsnip", -- no idea
        "hrsh7th/vim-vsnip", "SirVer/ultisnips",
        "quangnguyen30192/cmp-nvim-ultisnips", "L3MON4D3/LuaSnip"
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        vim.api.nvim_set_hl(0, "CmpItemKind", {fg = "#61afef"})
        vim.api.nvim_set_hl(0, "CmpItemKindColor", {fg = "#528bff"})
        vim.api.nvim_set_hl(0, "CmpItemKindFunction", {fg = "#c678dd"})
        vim.api.nvim_set_hl(0, "CmpItemKindConstant", {fg = "#98c379"})
        vim.api.nvim_set_hl(0, "CmpItemKindSnippet", {fg = "#d19a66"})
        vim.api.nvim_set_hl(0, "CmpItemKindVariable", {fg = "#526fff"})

        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and
                       vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                           col, col):match("%s") == nil
        end
        vim.opt.completeopt = {"menu", "menuone", "noselect"}

        cmp.setup({
            preselect = cmp.PreselectMode.None,
            completion = {completeopt = "menu,menuone,preview,noselect"},
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = vim.schedule_wrap(function(fallback)
                    if cmp.visible() and has_words_before() then
                        cmp.select_next_item({
                            behavior = cmp.SelectBehavior.Select
                        })
                    else
                        fallback()
                    end
                end),

                ["<Enter>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false
                }),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false
                }),
                -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-j>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-l>"] = nil,
                -- ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(),
                                            {"i", "c", "n"}),
                -- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<C-e>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                })
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                {name = "nvim_lsp"}, {name = "luasnip"}, -- snippets
                {name = "vsnip"}, -- For vsnip users.
                {name = "nvim_lua"}, {name = "buffer"}, -- text within current buffer
                {name = "path"}, -- file system paths
                -- { name = "copilot", group_index = 2 },
                {
                    name = "buffer",
                    option = {
                        get_bufnrs = function()
                            return vim.api.nvim_list_bufs()
                        end
                    }
                }, {name = "spell"}
            }),
            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
                fields = {
                    cmp.ItemField.Abbr, cmp.ItemField.Kind, cmp.ItemField.Menu
                },
                format = lspkind.cmp_format({
                    maxwidth = 60,
                    before = function(entry, vim_item)
                        vim_item.menu = ({
                            luasnip = "",
                            nvim_lsp = "",
                            nvim_lua = "ﲳ",
                            treesitter = "",
                            buffer = "﬘",
                            path = "ﱮ",
                            zsh = "",
                            vsnip = "",
                            spell = "暈"
                        })[entry.source.name]
                        return vim_item
                    end,
                    ellipsis_char = "..."
                })
            },
            experimental = {ghost_text = false},
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered()
            }
        })
        vim.cmd(
            [[ autocmd FileType lua lua require'cmp'.setup.buffer { sources = { { name = 'buffer' },{ name = 'nvim_lua'},{name = "nvim_lsp"}},} ]])
        local autocmd = vim.api.nvim_create_autocmd

        autocmd("FileType", {
            pattern = "conf",
            callback = function()
                require("cmp").setup.buffer({enabled = false})
            end
        })
        autocmd("FileType", {
            pattern = "conf",
            callback = function()
                require("cmp").setup.buffer({enabled = false})
            end
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {{name = "buffer"}}
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config
                .sources({{name = "path"}}, {{name = "cmdline"}})
        })

        cmp.event:on("menu_opened",
                     function() vim.b.copilot_suggestion_hidden = false end)
        cmp.event:on("menu_closed",
                     function() vim.b.copilot_suggestion_hidden = false end)
    end
}
