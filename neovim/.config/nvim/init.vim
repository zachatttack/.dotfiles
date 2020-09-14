set shell=/bin/sh
call plug#begin('~/.local/share/nvim/plugged')

"Util
Plug 'scrooloose/nerdtree'
Plug 'Townk/vim-autoclose'
Plug 'jceb/vim-orgmode'
"Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug '/home/zach/.fzf/bin/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'jremmen/vim-ripgrep'
Plug 'Yggdroot/indentLine'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-highlightedyank'
"Lang Syntax
Plug 'vim-python/python-syntax'
Plug 'vim-perl/vim-perl'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
Plug 'kovetskiy/sxhkd-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Colorschemes
Plug 'wadackel/vim-dogrun'
Plug 'jaredgorski/spacecamp'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'

call plug#end()

source /home/zach/.config/nvim/plug-config/coc.vim

set t_Co=256
syntax on
set mouse=a
set number
"set relativenumber
set background=dark
colorscheme dogrun
hi Normal guibg=NONE ctermbg=NONE 
hi Search ctermbg=grey
highlight HighlightedyankRegion cterm=reverse gui=reverse
set cursorline 
set so=7
set noswapfile
set hidden
"set colorcolumn=110
"highlight ColorColumn ctermbg=darkgray
let g:lightline = { 
            \ 'colorscheme': 'dogrun',
            \ }

nnoremap <Leader>v :e $MYVIMRC<cr>

map <F4> :NERDTreeToggle <CR>
let g:NERDTreeChDirMode = 2


" set foldmethod=indent
" set foldlevel=1
" set foldclose=all

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

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" set cindent
set cino+=(0

" autocmd FileType javascript setlocal ts=2 sw=2 sts=0 noexpandtab

" Comment leader symbols
autocmd FileType vim setlocal commentstring=\"%s
autocmd FileType vue setlocal commentstring=//%s
autocmd FileType xdefaults setlocal commentstring=!%s


autocmd FileType vue setlocal shiftwidth=3
autocmd FileType javascript setlocal shiftwidth=3


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

nmap <Leader>l :BLines<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>b :Buffers<CR>

" nmap <Leader>c :read $HOME/.config/nvim/my_snippets/console_log<CR>==3wa

nmap <F8> :TagbarToggle<CR>
nmap <Leader>r :set relativenumber<CR>
nmap <Leader>n :set norelativenumber<CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/


"GutenTags
let g:gutentags_project_root = ['tags'] 
let g:gutentags_enabled = 0


let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

autocmd BufRead *.py nmap <F5> :!clear;python3 %<CR>
autocmd BufRead *.rs nmap <F5> :!clear;cargo build<CR>
autocmd BufRead,BufNewFile *.md setlocal spell

autocmd BufWinLeave *.Xresources :!xrdb $HOME/.Xresources

let g:python_highlight_all = 1

let g:c_syntax_for_h = 1


" Highlight merge conflict markers
match Todo '\v^(\<|\=|\>){7}([^=].+)?$'

" Jump to next/previous merge conflict marker
nnoremap <silent> ]v /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
nnoremap <silent> [v ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Fugitive keybinds
nnoremap <leader>gs :Gstatus<CR>

"MD
let g:mkdp_browser = 'google-chrome-stable'

"Fancy FZF layout
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS= '--reverse'

"Clangd header switch
nmap <Leader>h :CocCommand clangd.switchSourceHeader<CR> 
