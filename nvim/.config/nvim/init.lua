require('jason.base.options')
require('jason.base.keymaps')
require('jason.plugins')

local has = function(x)
   return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('jason.base.macos')
else 
  require('jason.base.macos')
end
if is_win then
  require('jason.base.windows')
end  
