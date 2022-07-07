local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

require'impatient'.enable_profile()
_G.__luacache_config = {
 chunks = {
   enable = true,
   path = vim.fn.stdpath('cache')..'/luacache_chunks',
 },
 modpaths = {
   enable = true,
   path = vim.fn.stdpath('cache')..'/luacache_modpaths',
 }
}
require('impatient')
g.nvchad_theme = config.ui.theme

vim.cmd [[
set hidden
set nobackup
set nowritebackup
set relativenumber  
set nobackup
set nowritebackup
set cmdheight=1
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>
inoremap <silent> ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Space>
nmap <silent> <A-l> :call animate#window_delta_width(-24)<CR>
nmap <silent> <A-h> :call animate#window_delta_width(24)<CR>
nmap <silent> <A-Up> :call animate#window_delta_height(-16)<CR>
nmap <silent> <A-Down> :call animate#window_delta_height(16)<CR>
nmap <silent> <A-m> :w <CR>
nmap <silent> <S-l> :bnext<CR>
nmap <silent> <S-h> :bprevious<CR>
nmap <silent> <A-.> :tabnew<CR>
nnoremap <silent> <S-w> :q <CR>
nmap <silent><S-m> :mks!<CR>
cnoreabbrev s split
cnoreabbrev d vsplit
nmap <silent> <S-A-l> :vsplit<CR>
nmap <silent> <S-A-k> :split<CR>
cnoreabbrev f <cmd>Telescope find_files hidden=true<CR>
let g:floaterm_title = ""
nnoremap <silent> ,. daw
nnoremap <silent> . caw
nnoremap <silent> <S-A-q> :qall<CR>
nnoremap <silent> <S-A-m> :wqall<CR>
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
set re=1
:verb set foldmethod?
set nocursorline
set timeoutlen=1000
set ttimeoutlen=0
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=200  


let g:javascript_enable_domhtmlcss = 1

let b:vcm_tab_complete = 'javascript'
let b:javascript_fold = 1
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tabnine']  " list of CoC extensions needed
set fileencodings=utf-8


let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


]]
opt.syntax="on"
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency
g.theme_switcher_loaded = false

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1

opt.laststatus = 3 -- global statusline
opt.statusline = config.ui.statusline.config
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true -- cursor line

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 1
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 8
opt.termguicolors = true
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 450



-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = " "

-- disable some builtin vim plugins
local default_plugins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "syntax",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(default_plugins) do
   g["loaded_" .. plugin] = 1
end

local default_providers = {
   "node",
   "perl",
   "python3",
   "ruby",
}

for _, provider in ipairs(default_providers) do
   vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- set shada path
vim.schedule(function()
   vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
   vim.cmd [[ silent! rsh ]]
end)

-- load user options
config.options.user()
