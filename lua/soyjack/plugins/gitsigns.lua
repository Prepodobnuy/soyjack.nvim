local tint = require("soyjack.utils").tint

return function(c, hl)
  hl["GitSignsAdd"] = { fg = c.git_add_col }
  hl["GitSignsChange"] = { fg = c.git_change_col }
  hl["GitSignsDelete"] = { fg = c.git_delete_col }
  hl["GitSignsChangedelete"] = { link = "GitSignsChange" }
  hl["GitSignsTopdelete"] = { link = "GitSignsDelete" }
  hl["GitSignsUntracked"] = { link = "NonText" }
  hl["GitSignsStagedAdd"] = { fg = tint(c.git_add_col, -50) }
  hl["GitSignsStagedChange"] = { fg = tint(c.git_change_col, -50) }
  hl["GitSignsStagedDelete"] = { fg = tint(c.git_delete_col, -50) }
  hl["GitSignsStagedChangedelete"] = { link = "GitSignsStagedChange" }
  hl["GitSignsStagedTopdelete"] = { link = "GitSignsStagedDelete" }
  hl["GitSignsStagedUntracked"] = { link = "GitSignsStagedAdd" }
  hl["GitSignsCurrentLineBlame"] = { link = "NonText" }
  hl["GitSignsAddInline"] = { link = "Added" }
  hl["GitSignsAddLnInline"] = { fg = "fg", bg = tint(c.git_add_bg, 75) }
  hl["GitSignsDeleteInline"] = { link = "Removed" }
  hl["GitSignsDeleteLnInline"] = { fg = "fg", bg = tint(c.git_delete_bg, 75) }
  hl["GitSignsChangeInline"] = { link = "DiffText" }
  hl["GitSignsChangeLnInline"] = { link = "Changed" }
  hl["GitSignsDeleteVirtLn"] = { link = "Removed" }
  hl["GitSignsDeleteVirtLnInLine"] = { link = "Removed" }
  hl["GitSignsVirtLnum"] = { link = "LineNr" }
end
