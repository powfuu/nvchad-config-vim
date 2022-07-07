-- n, v, i, t = mode names

local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.general = {

   i = {
      -- navigate within insert mode
      ["<C-h>"] = { "<Left>", "  move left" },
      ["<C-l>"] = { "<Right>", " move right" },
      ["<C-j>"] = { "<Down>", " move down" },
      ["<C-k>"] = { "<Up>", " move up" },
   },

   n = {

      ["<ESC>"] = { "<cmd> noh <CR>", "  no highlight" },
      -- switch between windows
      ["<C-h>"] = { "<C-w>h", " window left" },
      ["<C-l>"] = { "<C-w>l", " window right" },
      ["<C-j>"] = { "<C-w>j", " window down" },
      ["<C-k>"] = { "<C-w>k", " window up" },
      -- Copy all
      ["<C-c>"] = { "<cmd> %y+ <CR>", "  copy whole file" },

      ["t"] = {
         function()
            require("base46").toggle_theme()
         end,

         "   toggle theme",
      },
   },

   t = {
      ["<C-x>"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
   },
}

M.tabufline = {

   n = {
      -- cycle through tabs
      ["<TAB>"] = { "<cmd> tabprevious <CR>", "  goto next tab" },
      ["<S-TAB>"] = { "<cmd> tabnext <CR> ", "  goto prev tab" },

      -- close buffer + hide terminal buffer
      ["<S-q>"] = {
         function()
            require("core.utils").close_buffer()
         end,
         "   close buffer",
      },
   },
}

M.comment = {
   -- toggle comment in both modes
   n = {
      ["<C-n>"] = {
         function()
            require("Comment.api").toggle_current_linewise()
         end,

         "蘒  toggle comment",
      },
   },
}

M.nvimtree = {

   n = {
      -- toggle
      ["<S-r>"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },

      -- focus
      ["<S-d>"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
   },
}

M.telescope = {
   n = {
      -- find
      ["f"] = { "<cmd> Telescope find_files <CR>", "  find files" },
      ["g"] = { "<cmd> Telescope find_files hidden=true <CR>", "  find all" },
      ["<S-f>"] = { "<cmd> Telescope themes hidden=false <CR>", "   nvchad themes" },
   },
}

M.nvterm = {
   t = {
      -- toggle in terminal mode
      ["<A-c>"] = {
         function()
            require("nvterm.terminal").toggle "float"
         end,
         "   toggle floating term",
      }
   },
   n = {
      -- toggle in normal mode
      ["<A-c>"] = {
         function()
            require("nvterm.terminal").toggle "float"
         end,
         "   toggle floating term",
      }
   }
}

return M
