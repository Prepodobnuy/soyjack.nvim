return function(c, hl)
  hl["lualine_a_command"] = { fg = c.normal_bg, bg = c.search }
  hl["lualine_a_inactive"] = { fg = c.comment_fg, bg = c.panel_bg }
  hl["lualine_a_insert"] = { fg = c.normal_bg, bg = c.string }
  hl["lualine_a_normal"] = { fg = c.normal_bg, bg = c.important }
  hl["lualine_a_replace"] = { fg = c.normal_bg, bg = c.number }
  hl["lualine_a_visual"] = { fg = c.normal_bg, bg = c.constant }
  hl["lualine_b_inactive"] = { fg = c.comment_fg, bg = c.panel_bg }
  hl["lualine_b_normal"] = { fg = c.normal_fg, bg = c.normal_bg_alt }
  hl["lualine_c_inactive"] = { fg = c.comment_fg, bg = c.normal_bg }
  hl["lualine_c_normal"] = { fg = c.normal_fg, bg = c.normal_bg }
end
