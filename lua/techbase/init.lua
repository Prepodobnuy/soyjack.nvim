local M = {}

local defaults = {
  italic_comments = false,
  transparent = false,
  plugin_support = {
    aerial = false,
    blink = false,
    edgy = false,
    gitsigns = false,
    hl_match_area = false,
    lazy = false,
    lualine = false,
    mason = false,
    mini_cursorword = false,
    nvim_cmp = false,
    vim_illuminate = false,
    visual_whitespace = false,
  },
  hl_overrides = {},
}

M.opts = vim.deepcopy(defaults)

function M.setup(opts)
  M.opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})

  M.opts.plugin_support = vim.tbl_deep_extend(
    "force",
    {},
    defaults.plugin_support,
    opts.plugin_support or {}
  )
end

function M.load(theme)
  local ok
  ok, theme = pcall(require, "techbase.palettes." .. theme)
  theme = ok and theme or require("techbase.palettes.techbase")

  local c = vim.deepcopy(theme)
  local groups = vim.deepcopy(require("techbase.core_hl_groups"))

  groups["Comment"].italic = M.opts.italic_comments

  if M.opts.transparent then
    for _, g in ipairs({
      "FoldColumn",
      "Normal",
      "NormalNC",
      "NormalFloat",
      "SignColumn",
      "StatusLine",
      "TabLine",
      "TabLineFill",
    }) do
      if groups[g] then groups[g].bg = "NONE" end
    end
  end

  for name, enabled in pairs(M.opts.plugin_support) do
    if enabled then
      local req = "techbase.plugins." .. name
      local mod = require(req)
      mod(c, groups)
    end
  end

  local extra
  if type(M.opts.overrides) == "function" then
    extra = M.opts.overrides(vim.deepcopy(groups))
  else
    extra = M.opts.overrides
  end

  if extra and next(extra) then
    groups = vim.tbl_deep_extend("force", groups, extra)
  end

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M
