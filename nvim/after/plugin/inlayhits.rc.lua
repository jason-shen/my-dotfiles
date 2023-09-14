local status, inlay = pcall(require, "inlay-hints")
if not status then
	return
end

inlay.setup({
  renderer = "inlay-hints/render/dynamic",

  hints = {
    parameter = {
      show = true,
      highlight = "Comment",
    },
    type = {
      show = true,
      highlight = "Comment",
    },
  },

  -- Only show inlay hints for the current line
  only_current_line = false,

  eol = {
    -- whether to align to the extreme right or not
    right_align = true,

    -- padding from the right if right_align is true
    right_align_padding = 7,

    parameter = {
      separator = ", ",
      format = function(hints)
        return string.format(" <- (%s)", hints)
      end,
    },

    type = {
      separator = ", ",
      format = function(hints)
        return string.format(" » (%s)", hints)
      end,
    },
  },
})