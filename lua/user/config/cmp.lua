local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local icons = require("user.utils").icons.lsp

local kind_icons = {
  Text = icons.text,
  Method = icons.method,
  Function = icons.fn,
  Constructor = icons.constructor,
  Field = icons.field,
  Variable = icons.variable,
  Class = icons.class,
  Interface = icons.interface,
  Module = icons.module,
  Property = icons.property,
  Unit = icons.unit,
  Value = icons.value,
  Enum = icons.enum,
  Keyword = icons.keyword,
  Snippet = icons.snippet,
  Color = icons.color,
  File = icons.file,
  Reference = icons.reference,
  Folder = icons.folder,
  EnumMember = icons.enum_member,
  Constant = icons.constant,
  Struct = icons.struct,
  Event = icons.event,
  Operator = icons.operator,
  TypeParameter = icons.type_parameter
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      local kind_text = vim_item.kind

      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = string.format("[%s %s]", icons.server, kind_text),
        luasnip = string.format("[%s  %s]", icons.snippet, kind_text),
        buffer = string.format("[%s  %s]", icons.text, kind_text),
        path = string.format("[%s %s]", icons.path, kind_text),
      })[entry.source.name]
      local colorizer = require("tailwindcss-colorizer-cmp")
      return colorizer.formatter(entry, vim_item)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
