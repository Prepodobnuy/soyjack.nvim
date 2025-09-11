local M = {}
local SUPPORTED_PLUGINS = require("techbase.plugins.supported_plugins")

local defaults = {
  italic_comments = false,
  transparent = false,
  plugin_support = vim.deepcopy(SUPPORTED_PLUGINS),
  hl_overrides = {},
}

M.opts = vim.deepcopy(defaults)

local function normalize_plugin_support(user)
  if user == nil or user == true then return SUPPORTED_PLUGINS end

  if user == false then return {} end

  if user.only then
    local eff = {}
    for _, n in ipairs(user.only) do
      eff[n] = true
    end

    return eff
  end

  return M.opts.plugin_support
end

function M.setup(opts)
  M.opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})

  M.opts.plugin_support = normalize_plugin_support(opts.plugin_support)
end

function M.load(theme)
  local ok
  ok, theme = pcall(require, "techbase.palettes." .. theme)
  theme = ok and theme or require("techbase.palettes.techbase")

  local c = vim.deepcopy(theme)
  local group_fn = require("techbase.highlights")
  local groups = group_fn(c)

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

  for name, setting in pairs(M.opts.plugin_support) do
    if setting == true then
      ok, module = pcall(require, "techbase.plugins." .. name)
      if ok then module(c, groups) end
    end
  end

  local overrides = M.opts.hl_overrides
  local extra = type(overrides) == "function"
      and overrides(vim.deepcopy(groups))
    or overrides

  if extra and next(extra) then
    groups = vim.tbl_deep_extend("force", groups, extra)
  end

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M
