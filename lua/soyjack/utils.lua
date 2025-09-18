local M = {}

---lighten or darken a HEX colour by `percent`
---@param hex string
---@param percent number positive = lighter, negative = darker
---@return string
function M.tint(hex, percent)
  local r, g, b = hex:match("^#?(%x%x)(%x%x)(%x%x)$")
  r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)

  local convert = function(c)
    c = math.floor(c * (100 + percent) / 100 + 0.5)
    return c > 255 and 255 or c
  end

  return ("#%02x%02x%02x"):format(convert(r), convert(g), convert(b))
end

return M
