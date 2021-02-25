if has('vim_starting')
	set nocompatible
	if !filereadable(expand("~/.vim/autoload/plug.vim"))
		echo "Installing vim-plug..."
		call system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
	endif
endif
call plug#begin('~/.vim/plugged')

let g:lsp_settings_servers_dir = "~/.vim/plugged/vim-lsp-settingsd/servers"
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'EvanDotPro/nerdtree-chmod'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

function s:is_plugged(name)
	if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
		return 1
	else
		return 0
	endif
endfunction

set nocompatible
set nowrap
set number
set autoindent
" set smartindent
set shiftwidth=4
set list
set listchars=tab:»\ ,trail:-,extends:▸,precedes:«,nbsp:%
set display=lastline
set showmatch
set matchtime=1
set showtabline=2
set noswapfile
set scrolloff=10
set sidescrolloff=16
set noshowmode
set laststatus=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set clipboard+=unnamed
set backspace=indent,eol,start
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set timeout timeoutlen=1000 ttimeoutlen=75
set shortmess+=I
set cpoptions+=d
set tags=./tags;
set autoread
set nofoldenable
set re=0
set lazyredraw
set ttyfast
set tabstop=4
set nobackup
set visualbell t_vb=
set completeopt=menuone
set noautochdir
set paste

" lsp let
" https://mattn.kaoriya.net/software/vim/20191231213507.htm
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
" http://blog.sbfm.jp/archives/91
let lsp_signature_help_enabled = 0

" disable plugins
" https://lambdalisue.hatenablog.com/entry/2015/12/25/000046
let g:loaded_gzip            = 1
let g:loaded_tar             = 1
let g:loaded_tarPlugin       = 1
let g:loaded_zip             = 1
let g:loaded_zipPlugin       = 1
let g:loaded_rrhelper        = 1
let g:loaded_2html_plugin    = 1
let g:loaded_vimball         = 1
let g:loaded_vimballPlugin   = 1
let g:loaded_getscript       = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_netrw           = 1
let g:loaded_netrwPlugin     = 1

" auto quickfix
" https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
autocmd QuickFixCmdPost *grep* cwindow

" vimgrep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" NERDTree
autocmd BufEnter * silent! lcd %:p:h
let NERDTreeChDirMode   = 0
let NERDTreeHijackNetrw = 0
let NERDTreeWinSize     = 40
let NERDTreeShowHidden  = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"let NERDTreeQuitOnOpen  = 1

" NERDTreeTabs
let g:nerdtree_tabs_open_on_gui_startup=1

" Encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" Color
set t_Co=256
set background=dark
if (s:is_plugged('gruvbox'))
	colorscheme gruvbox
	hi NonText ctermbg=bg ctermfg=bg guibg=bg guifg=bg
	hi EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
endif
"if (s:is_plugged('iceberg.vim'))
"	colorscheme iceberg
"	hi NonText ctermbg=bg ctermfg=bg guibg=bg guifg=bg
"	hi EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
"endif

" GUI
set guifont=Ricty\ Regular\ for\ Powerline:h15
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=e

" Custom Keymap
" :sp と :vs だよ
let mapleader = ";"
nnoremap tc         :<C-u>tabnew<CR>
nnoremap tn         gt
nnoremap tp         gT
nnoremap sno        :set nonumber<CR>
nnoremap snu        :set number<CR>
nnoremap [q         :cprevious<CR>
nnoremap ]q         :cnext<CR>
nnoremap <Leader>n  :NERDTreeTabsToggle<CR>
"nnoremap <Leader>f  :<C-u>CtrlP<CR>
nnoremap <Leader>f  :<C-u>:CtrlPCurWD<CR>
nnoremap <Leader>b  :Gblame<CR>
nnoremap <Leader>s  :Gstatus<CR>
nnoremap <Leader>c  :Gcommit<CR>
nnoremap <Leader>d  :Gdiff<CR>
nnoremap <Leader>u  :UpdateTags -R .<CR>
nnoremap <Leader>t  :TagbarToggle<CR>
nnoremap <Leader>h  :noh<CR>
nnoremap <Leader>tm :TableModeToggle<CR>
nnoremap <C-]>      :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
vmap     <Enter>    <Plug>(EasyAlign)
nnoremap <C-g>      1<C-g>
nnoremap df         :LspPeekDefinition<CR>

" vim-fzf
nnoremap <silent> ,f :Files<CR>
nnoremap <silent> ,g :GFiles<CR>
nnoremap <silent> ,G :GFiles?<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap <silent> ,l :BLines<CR>
nnoremap <silent> ,h :History<CR>
nnoremap <silent> ,m :Mark<CR>

syntax enable

" delete trailing spaces
"au BufWritePre * if index(['markdown', 'diff', 'sql', 'case'], &filetype) < 0 | :%s/\s\+$//e

" auto read
augroup vimrc-checktime
	autocmd!
	autocmd WinEnter * checktime
augroup END

" AutoPairs
let g:AutoPairsMultilineClose=0

" CtrlP
let g:ctrlp_working_path_mode   = 0 " https://github.com/kien/ctrlp.vim/blob/master/doc/ctrlp.txt
let g:ctrlp_map                 = '<Nop>'
let g:ctrlp_use_caching         = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden         = 1
let g:ctrlp_jump_to_buffer      = 2
let g:ctrlp_match_window        = 'bottom,order:btt,min:1,max:10'
"if executable('ag')
"	let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ".git" --ignore ".svn" --ignore ".hg" --hidden -g ""'
"	let g:ctrlp_max_depth    = 10
"else
"	let g:ctrlp_max_depth = 5
"endif
if executable('rg')
  let g:ctrlp_use_caching = 0
  "let g:ctrlp_user_command = 'cd %s && rg "" -i -r --no-color -l ./**/*'
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif
let g:ctrlp_prompt_mappings = {
	\ 'PrtBS()':              ['<bs>'],
	\ 'PrtDeleteWord()':      ['<del>'],
	\ 'PrtCurEnd()':          ['<c-e>'],
	\ 'PrtCurLeft()':         ['<c-b>'],
	\ 'PrtCurRight()':        ['<c-f>'],
	\ 'PrtSelectMove("j")':   ['<c-n>'],
	\ 'PrtSelectMove("k")':   ['<c-p>'],
	\ 'PrtHistory(-1)':       ['nop'],
	\ 'PrtHistory(1)':        ['nop'],
	\ 'AcceptSelection("e")': ['<cr>'],
	\ 'ToggleRegex()':        ['<c-r>'],
	\ 'ToggleByFname()':      ['<c-d>'],
	\ 'PrtExit()':            ['<c-l>', '<esc>', '<c-c>'],
	\ 'ToggleFocus()':        ['<nop>'],
	\ 'PrtExpandDir()':       ['<nop>'],
	\ 'AcceptSelection("h")': ['<nop>'],
	\ 'AcceptSelection("t")': ['<nop>'],
	\ 'AcceptSelection("v")': ['<nop>'],
	\ 'ToggleType(1)':        ['<nop>'],
	\ 'ToggleType(-1)':       ['<nop>'],
	\ 'PrtInsert()':          ['<nop>'],
	\ 'PrtCurStart()':        ['<nop>'],
	\ 'PrtClearCache()':      ['<nop>'],
	\ 'PrtDeleteEnt()':       ['<nop>'],
	\ 'CreateNewFile()':      ['<nop>'],
	\ 'MarkToOpen()':         ['<nop>'],
	\ 'OpenMulti()':          ['<nop>'],
	\ 'PrtDelete()':          ['<nop>'],
	\ 'PrtSelectMove("t")':   ['<nop>'],
	\ 'PrtSelectMove("b")':   ['<nop>'],
	\ 'PrtSelectMove("u")':   ['<nop>'],
	\ 'PrtSelectMove("d")':   ['<nop>'],
	\ }
