return function(c, hl)
  hl["BlinkCmpDoc"] = { link = "Pmenu" }
  hl["BlinkCmpDocBorder"] = { fg = c.float_bg_border, bg = c.float_bg }
  hl["BlinkCmpDocSeparator"] = { fg = c.float_bg_border }
  hl["BlinkCmpGhostText"] = { link = "NonText" }
  hl["BlinkCmpKind"] = { fg = c.important }
  hl["BlinkCmpLabel"] = { fg = c.float_fg }
  hl["BlinkCmpLabelDescription"] = { fg = c.nontext_fg }
  hl["BlinkCmpLabelDetail"] = { link = "NonText" }
  hl["BlinkCmpLabelMatch"] = { link = "PmenuMatch" }
  hl["BlinkCmpMenuBorder"] =
    { fg = hl["FloatBorder"]["fg"], bg = hl["Pmenu"]["bg"] }
  hl["BlinkCmpMenuSelection"] = { link = "PmenuMatchSel" }
end
