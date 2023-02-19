local status_ok, ap = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

ap.setup({
  disable_in_macro = true,
  disable_in_visualblock = true,
  disable_in_replace_mode = false,
})

local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")
ap.add_rules({
  Rule("$", "$",{"tex", "latex"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex("xxx", 3))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- don't delete if the next character is xx
    :with_del(cond.not_after_regex("xx"))
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
  },
  {
  Rule("$$","$$","tex")
    :with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line=="aa $$" then
        -- don't add pair on that line
          return false
        end
    end)
   },
  -- disable for .vim files, but it work for another filetypes
  Rule("a","a","-vim")
)

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
