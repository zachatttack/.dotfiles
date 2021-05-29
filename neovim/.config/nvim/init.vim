set shell=/bin/sh
call plug#begin('~/.local/share/nvim/plugged')

"Util
Plug 'tpope/vim-commentary'
Plug '/home/zach/.fzf/bin/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
" Plug 'CoatiSoftware/vim-sourcetrail'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-highlightedyank'
Plug 'vimwiki/vimwiki'
Plug 'reedes/vim-pencil'
"Lang Syntax
Plug 'vim-python/python-syntax'
Plug 'vim-perl/vim-perl'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
Plug 'kovetskiy/sxhkd-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Colorschemes
Plug 'wadackel/vim-dogrun'
Plug 'wojciechkepka/bogster'
Plug 'jaredgorski/spacecamp'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

call plug#end()

source /home/zach/.config/nvim/plug-config/coc.vim
nnoremap <Leader>v :e $MYVIMRC <bar> lcd ~/.dotfiles<cr>

syntax on
set mouse=a
set number
set relativenumber
set cursorline 
set so=7
set noswapfile
set hidden

set splitbelow
set splitright

set smartcase
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" set cindent
set cino+=(0

let &path.="src/include,Libraries,"

"Color stuff
set t_Co=256
set background=dark
colorscheme bogster
hi Normal guibg=NONE ctermbg=NONE 
hi Search ctermbg=grey
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:lightline = { 
            \ 'colorscheme': 'dogrun',
            \ }

let g:rg_binary="/home/zach/.cargo/bin/rg"

"Netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 18
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

map <F4> :call ToggleNetrw() <CR>
function! NetrwMappings()
    nnoremap <buffer> <C-l> <C-w>l
    nnoremap <F4> :call ToggleNetrw()<CR>
endfunction 
augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END
" Close Netrw if it's the only buffer open
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif


"use <tab> for completion
function! TabWrap()
    if pumvisible()
        return "\<C-N>"
    elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
        return "\<tab>"
    elseif &omnifunc !~ ''
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction

" power tab
imap <silent><expr><tab> TabWrap()

"Map ctrl-y to enter
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Comment Leader symbols
autocmd FileType vim setlocal commentstring=\"%s
autocmd FileType vue setlocal commentstring=//%s
autocmd FileType xdefaults setlocal commentstring=!%s

autocmd FileType vue setlocal shiftwidth=3
autocmd FileType javascript setlocal shiftwidth=3


nmap // :noh<CR>

"Nagivation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

nmap <Leader>l :BLines<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>

nmap <F8> :TagbarToggle<CR>
nmap <Leader>r :set relativenumber<CR>
nmap <Leader>n :set norelativenumber<CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"GutenTags
let g:gutentags_project_root = ['tags'] 
let g:gutentags_enabled = 0

"Autocmds
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufRead *.py nmap <F5> :!clear;python3 %<CR>
autocmd BufRead *.rs nmap <F5> :!clear;cargo build<CR>
" autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufWinLeave *.Xresources :!xrdb $HOME/.dotfiles/Xresources/.Xresources

let g:python_highlight_all = 1
let g:c_syntax_for_h = 1

""Git stuff
" Highlight merge conflict markers
match Todo '\v^(\<|\=|\>){7}([^=].+)?$'

" Jump to next/previous merge conflict marker
nnoremap <silent> ]v /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
nnoremap <silent> [v ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>

" Fugitive Conflict Resolution
nnoremap <Leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Fugitive keybinds
nnoremap <Leader>gs :Gstatus<CR>

"MD
let g:mkdp_browser = 'brave.exe'

"Fancy FZF layout
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS= '--reverse'

"Clangd header switch
nmap <Leader>h :CocCommand clangd.switchSourceHeader<CR> 

let g:coc_global_extensions = [ 
            \'coc-pairs', 
            \'coc-eslint',
            \'coc-clangd', 
            \'coc-tsserver', 
            \'coc-rust-analyzer', 
            \'coc-json', 
            \]

let g:vimwiki_list = [{'path': '/mnt/c/Users/zthomas/Documents/vimwiki/',
            \ 'syntax': 'markdown', 'ext': '.md'}]


let s:enabled = 0
function! ToggleConceal()
    if s:enabled
        set conceallevel=2
        let s:enabled = 0
    else
        set conceallevel=0
        let s:enabled = 1
    endif
endfunction

nmap <Leader>c :call ToggleConceal()<CR>

let s:spell_enabled = 0
function! ToggleSpell()
    if s:spell_enabled
        set nospell
        let s:spell_enabled = 0
    else
        set spell
        let s:spell_enabled = 1
    endif
endfunction

nmap <Leader>s :call ToggleSpell()<CR>

lua <<EOF
 require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
      disable = { "rust" },  -- list of language that will be disabled
    },
  }
EOF

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>


if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    " add any database in current directory
    if filereadable("cscope.out")
        silent cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        silent cs add $CSCOPE_DB
    endif
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>a :scs find a <C-R>=expand("<cword>")<CR><CR>
endif
