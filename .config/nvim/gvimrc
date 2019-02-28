"
"nvim only setting
if has('nvim')
"let g:python2_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"
"let g:python_host_skip_check = 1
set mouse=a
tnoremap <Esc> <C-\><C-n>
endif

"let g:pathogen_disabled =[]    
"call add(g:pathogen_disabled, 'csapprox') 
"call add(g:pathogen_disabled, 'yankring') 
"call add(g:pathogen_disabled, 'CuteErrorMarker')
"execute pathogen#infecto()

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'sukima/xmledit'
Plug 'tpope/vim-fugitive'
Plug 'derekwyatt/vim-fswitch'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-repeat'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic', { 'for': ['c', 'cpp'] } 
Plug 'vim-scripts/VisIncr'
Plug 'mileszs/ack.vim'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py', 'for': ['c', 'cpp', 'py'] }
Plug 'kana/vim-operator-user'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'kchmck/vim-coffee-script'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kshenoy/vim-signature'
Plug 'hewes/unite-gtags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovimhaskell/haskell-vim'
Plug 'ryanss/vim-hackernews'
Plug 'Chiel92/vim-autoformat'
Plug 'KabbAmine/zeavim.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-expand-region'
Plug 'justinmk/vim-sneak'

Plug 'vim-scripts/YankRing.vim', { 'on': [] }
Plug 'vivien/vim-addon-linux-coding-style', { 'on': [] }
Plug 'Twinside/vim-cuteErrorMarker', { 'on': [] }
Plug 'godlygeek/csapprox', { 'on': [] }
" Initialize plugin system
call plug#end()

if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif

" --- AutoClose - Inserts matching bracket, paren, brace or quote 
" fixed the arrow key problems caused by AutoClose
if !has("gui_running")	
"   "set term=linux
"   imap OA <ESC>ki
"   imap OB <ESC>ji
"   imap OC <ESC>li
"   imap OD <ESC>hi
    nmap OA k
    nmap OB j
    nmap OC l
    nmap OD h
    "for tmux wired character
    map <Esc>[B <Down>
endif

filetype plugin indent on
" General SETTINGS 
set hidden
set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
setlocal textwidth=80
set number
"set relativenumber
set list lcs=tab:\|\ 
autocmd FileType c,cpp call MyCodeStyle()

function! MyCodeStyle()
  highlight CodeFormatError ctermbg=red ctermfg=white guibg=#592929
  match CodeFormatError /\%81v.\+/
  "match CodeFormatError / \+\ze\t/          "spaces before tab
  " Highlight trailing whitespace, unless we're in insert mode and the
  " cursor's placed right after the whitespace. This prevents us from having
  " to put up with whitespace being highlighted in the middle of typing
  " something
  autocmd InsertEnter * match CodeFormatError /\s\+\%#\@<!$/
  autocmd InsertLeave * match CodeFormatError /\s\+$/
endfunction

filetype off          " necessary to make ftdetect work on Linux
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/vimrc

if has("gui_running")	" GUI color and font settings
  set autochdir
  "set guifont=Osaka-Mono:h20
  "set guifont=pika:h20
  set guifont =Droid\ Sans\ Mono\ for\ Powerline:h20
  "set guifont =Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete
  set background=dark 
  set t_Co=256          " 256 color mode
  set cursorline        " highlight current line
  colors solarized
  set background=dark
  highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
else
  highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
  set cursorline
" terminal color settings
  set t_Co=256          " 256 color mode
  let g:solarized_termcolors = &t_Co
  let g:solarized_termtrans = 0
  let g:solarized_degrade = 0
  let g:solarized_italic=0
  let g:solarized_contrast = "nomal"
  let g:solarized_visibility= "normal"
  "terminal setting
  "set t_AB=^[[48;5;%dm
  "set t_AF=^[[38;5;%dm
  color solarized 
  set background=dark
  color solarized   "workaround for nvim, this cause nvim war color use now
  set hlsearch		" search highlighting
endif


"folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set clipboard=unnamed,unnamedplus " yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
   set expandtab        "replace <TAB> with spaces
   set tabstop=4           " number of spaces a tab counts for
   set shiftwidth=4        " spaces for autoindents
   au FileType Makefile set noexpandtab
"}      							

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
set fillchars+=stl:\ ,stlnc:\


function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}


" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"--------------------------------------------------------------------------- 
" Tip #382: Search for <cword> and replace with input() in all open buffers 
"--------------------------------------------------------------------------- 
fun! Replace() 
    let s:word = input("Replace " . expand('<cword>') . " with:") 
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
    :unlet! s:word 
endfun 


"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" set leader to ,
let mapleader=","
let g:mapleader=","

"map esc key
inoremap jk <ESC>

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
map <leader>cv :botright cope<CR>
map <leader>cx :cclose<CR>
" move to next error
map <leader>h :cn<CR>
" move to the prev error
map <leader>l :cp<CR>

" --- move around splits {
"decrease window
"map <leader><leader>j <C-W><
"increase window
"map <leader><leader>l <C-W>>
" move to and maximize the below split 
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split 
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others 
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab 
"map <S-H> gT
" go to next tab
"map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR> 

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" Writing Restructured Text (Sphinx Documentation) {
   " Ctrl-u 1:    underline Parts w/ #'s
   noremap  <C-u>1 yyPVr#yyjp
   inoremap <C-u>1 <esc>yyPVr#yyjpA
   " Ctrl-u 2:    underline Chapters w/ *'s
   noremap  <C-u>2 yyPVr*yyjp
   inoremap <C-u>2 <esc>yyPVr*yyjpA
   " Ctrl-u 3:    underline Section Level 1 w/ ='s
   noremap  <C-u>3 yypVr=
   inoremap <C-u>3 <esc>yypVr=A
   " Ctrl-u 4:    underline Section Level 2 w/ -'s
   noremap  <C-u>4 yypVr-
   inoremap <C-u>4 <esc>yypVr-A
   " Ctrl-u 5:    underline Section Level 3 w/ ^'s
   noremap  <C-u>5 yypVr^
   inoremap <C-u>5 <esc>yypVr^A
"}

"--------------------------------------------------------------------------- 
" PROGRAMMING SHORTCUTS
"--------------------------------------------------------------------------- 

" Ctrl-[ jump out of the tag stack (undo Ctrl-])
map <C-[> <ESC>:po<CR>

" ,g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun



" Enable omni completion. (Ctrl-X Ctrl-O)
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType java set omnifunc=javacomplete#Complete


set cot-=preview "disable doc preview in omnicomplete

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
"set encoding=utf-8                                
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gb2312,latin1
"ucs-bom

fun! ViewUTF8()
	set encoding=utf-8                                  
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8                                  
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun

"--------------------------------------------------------------------------- 
" PLUGIN SETTINGS
"--------------------------------------------------------------------------- 


" ------- vim-latex - many latex shortcuts and snippets {

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"}


" ---yankring
nnoremap <Leader>yr :YRShow<Cr>
"for windows platorms, you must change yankring replace key <C-P> and <C-N>
"let g:yankring_replace_n_nkey = '<c-r>'

"vim-indent-guides
"let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"let g:indent_guides_enable_on_vim_startup = 1 
"let g:indent_guides_color_change_percent = 7
"let g:indent_guides_guide_size            = 0
"let g:indent_guides_start_level      = 2

" ---------------------------------------------------------------------------
" EasyMotion
" --------------------------------------------------------------------------- 
let g:EasyMotion_leader_key = '\' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
 " " Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1"
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>j <Plug>(easymotion-j)
map <Leader><leader>k <Plug>(easymotion-k)
map <Leader><leader>h <Plug>(easymotion-linebackward)
" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  <Leader>w <Plug>(easymotion-bd-w)
omap  tt <Plug>(easymotion-bd-tl)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  <leader>n <Plug>(easymotion-next)
map  <leader>N <Plug>(easymotion-prev)
"smartcase(lazy search)
let g:EasyMotion_smartcase = 1

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config_fuzzy(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0,
  \   'is_stay': 0
  \ }), get(a:, 1, {}))
endfunction

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> z?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> zg/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
noremap <silent><expr> f/  incsearch#go(<SID>incsearch_config_fuzzy())
noremap <silent><expr> f?  incsearch#go(<SID>incsearch_config_fuzzy({'command': '?'}))
noremap <silent><expr> fg/ incsearch#go(<SID>incsearch_config_fuzzy({'is_stay': 1}))

" --- TagBar
" toggle TagBar with F7
nnoremap <silent> <F7> :TagbarToggle<CR> 
" set focus to TagBar when opening it
"let g:tagbar_autofocus = 1
let g:tagbar_width=25

" --- coffee-script
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw! " recompile coffee scripts on write

" --- vim-gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

"CPP Complete
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"youcompleteme
let g:ycm_disable_for_files_larger_than_kb = 800
"YCM diagnostic
let g:ycm_extra_conf_globlist = ['~/*', './*', '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/*']
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
"use ycm clang module as syntastic checker
let g:ycm_register_as_syntastic_checker = 0 "default 1
let g:Show_diagnostics_ui = 0 "default 1
let g:ycm_enable_diagnostic_signs = 2
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 0 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_max_diagnostics_to_display = 30
"YCM others options
let g:ycm_key_invoke_completion = '<F8>'
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=1
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_warning_symbol = '!'
let g:ycm_error_symbol = 'x'
"open locationlist
nnoremap <leader>lo :lopen<CR>
"close locationlist
nnoremap <leader>lc :lclose<CR>
inoremap <leader><leader> <C-x><C-o>
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 1
"Check if the file is compilable
nnoremap <leader>jy :YcmForceCompileAndDiagnostics
"Jump to Definition
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jx :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jh :YcmCompleter GoToInclude<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>

"nnoremap <F10> :YcmDiags<CR>
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}

" --- syntastic
let g:syntastic_error_symbol = 'X'      "set error or warning signs
let g:syntastic_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 8
let g:syntastic_check_on_wq = 0
"let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black

"let g:syntastic_cpp_include_dirs = ['/usr/include/']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1     "whether to show balloons
"let g:syntastic_debug = 1
"let g:syntastic_c_make_args = "-j4"
"let g:syntastic_c_make_options = '-j4'
"let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler = 'nds32le-elf-gcc'
let g:syntastic_c_config_file = '.syntastic_c_config'

"UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Vallor"ic/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/"]




"Tabular
"nmap <leader>bb :Tab /=<CR>
"nmap <leader>bn :Tab /
"F9 to trigger clang-format
"autocmd FileType c,cpp,objc noremap <F9> :ClangFormat<CR>
"auto-pairs
let g:AutoPairs = {'<' : '>' ,'(' : ')', '[' : ']', '{' : '}', "'" : "'", '"' : '"', '`' : '`'}
"fswitch
au BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = './,./include,../include'
au BufEnter *.c let b:fswitchdst = 'h,hh' | let b:fswitchlocs = './,./include,../include'
au BufEnter *.hh let b:fswitchdst = 'c,cpp' | let b:fswitchlocs = '../,./,../src'
au BufEnter *.h let b:fswitchdst = 'cpp,c' | let b:fswitchlocs = './,../,../src'
nmap <silent> <Leader>of :FSHere<cr>
"nerdtree
let g:NERDTreeWinSize=20
let NERDTreeIgnore=['\~$', '\.pyc', '\.swp$', '\.git', '\.hg', '\.svn',
\ '\.ropeproject', '\.o', '\.bzr', '\.ipynb_checkpoints$',
\ '__pycache__',
\ '\.egg$', '\.egg-info$', '\.tox$', '\.idea$', '\.sass-cache',
\ '\.env$', '\.env[0-9]$', '\.coverage$', '\.tmp$', '\.gitkeep$',
\ '\.coverage$', '\.webassets-cache$', '\.vagrant$', '\.DS_Store',
\ '\.env-pypy$', 'tags', '\.a$', 'GPATH', 'GRTAGS', 'GTAGS', 'gtags.files']
"nerdtree tab
nnoremap <F6> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0

"support markdown hightlight
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd


autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

"multiple cursor
" Map start key separately from next key
let g:multi_cursor_start_key='<F9>'
let g:multi_cursor_start_word_key='g<F9>'
function! Multiple_cursors_before()                                               
  if exists('*youcompleteme#EnableCursorMovedAutocommands')
        call youcompleteme#DisableCursorMovedAutocommands()
  endif
  set foldmethod=manual
  let g:ycm_auto_trigger = 0
  let s:old_ycm_whitelist = g:ycm_filetype_whitelist                           
  let g:ycm_filetype_whitelist = {}         
  let g:ycm_show_diagnostics_ui = 0
  "let delimitMate_autoclose = 0
endfunction                                                                      
                                                                                 
function! Multiple_cursors_after()                                                
  if exists('*youcompleteme#EnableCursorMovedAutocommands')
        call youcompleteme#EnableCursorMovedAutocommands()
  endif
  set foldmethod=syntax
  let g:ycm_auto_trigger = 1
  let g:ycm_filetype_whitelist = s:old_ycm_whitelist
  let g:ycm_show_diagnostics_ui = 1
  "let delimitMate_autoclose = 1
endfunction   
"doxgen toolkit
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_briefTag_post = " - "
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_paramTag_pre="@ "
let g:DoxygenToolkit_returnTag="@Returns   "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Pika Jian"
"let g:DoxygenToolkit_licenseTag="My own license"   <-- !!! Does not end with "\<enter>"

"surround vim
"- key
let b:surround_105 = "(\r)"
map <leader>gs      gSi


"easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"airline
"
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'tabline']
let g:airline_powerline_fonts = 1
let g:airline_theme="solarized" 
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_y = airline#section#create(['','[TYPE:','filetype',']','[TIME:','%{strftime("%H:%M")}',']'])
"let g:airline_section_z = airline#section#create(['%3p%% ', g:airline_symbols.linenr .' ', 'linenr', ':%3c '])
"git branch info 
let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#middle_click_preserves_windows = 0
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#excludes = ['[0-9]\+:zsh$']
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

"buffer operation for tabline
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd! #<cr>

"buffer map
" Move to the next buffer
nmap <S-L> :bnext<CR>
" Move to the previous buffer
nmap <S-H> :bprevious<CR>

"silver searcher (Ag)
let g:ag_prg="ag --column --ignore tags"


" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

if has('nvim')
  nnoremap <leader>t :<C-u>Unite -winheight=20 -direction=dynamicbottom -buffer-name=files -start-insert file_rec/neovim:!<cr>
else
  "require vimproc plugin
  nnoremap <leader>t :<C-u>Unite -winheight=20 -direction=dynamicbottom -buffer-name=files  -start-insert file_rec/async:!<cr>
endif
nnoremap <leader>f :<C-u>Unite -winheight=20 -direction=dynamicbottom -buffer-name=files -start-insert file<cr>
nnoremap <leader>w :<C-u>Unite -winheight=10 -direction=dynamicbottom -buffer-name=mru  -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -winheight=20 -direction=dynamicbottom -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -winheight=10 -direction=dynamicbottom -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -winheight=10 -direction=dynamicbottom -buffer-name=buffer  -start-insert buffer<cr>
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \['▷ git log2         (Fugitive)',
        \'Gllog'],
    \]
nnoremap <leader>m :Unite -no-split -silent -start-insert menu:git<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

let g:linuxsty_patterns = [ "/linux/", "/linux-2.6/"]


function! s:groovy_format()
  set filetype=groovy
  set expandtab        "replace <TAB> with spaces
  set tabstop=4           " number of spaces a tab counts for
  set shiftwidth=4        " spaces for autoindents
endfunction
au BufRead,BufNewFile *.{groovy,gradle}  call s:groovy_format()

function! s:python_format()
  set expandtab        "replace <TAB> with spaces
  set tabstop=4           " number of spaces a tab counts for
  set shiftwidth=4        " spaces for autoindents
endfunction
au BufRead,BufNewFile *.py  call s:python_format()

"vim-gradle
nnoremap <F10> :compiler gradle<CR>:make build -Prtsp=true -Pconf_files=AU3518P.h,AU3522_COM.h<CR>
autocmd QuickFixCmdPost [^l]* nested botright cwindow
autocmd QuickFixCmdPost    l* nested botright lwindow
"fugitive
autocmd User fugitive 
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=hide


"nerdCommenter
let g:NERDSpaceDelims=1
let g:NERDCommentEmptyLines = 1

" SeeTab: toggles between showing tabs and using standard listchars
fu! SeeTab()
  if !exists("g:SeeTabEnabled")
    let g:SeeTabEnabled = 1
    let g:SeeTab_list = &list
    let g:SeeTab_listchars = &listchars
    let regA = @a
    redir @a
    hi SpecialKey
    redir END
    let g:SeeTabSpecialKey = @a
    let @a = regA
    silent! hi SpecialKey guifg=black guibg=magenta ctermfg=black ctermbg=magenta
    set list
    set listchars=tab:\|\
  else
    let &list = g:SeeTab_list
    let &listchars = &listchars
    silent! exe "hi ".substitute(g:SeeTabSpecialKey,'xxx','','e')
    unlet g:SeeTabEnabled g:SeeTab_list g:SeeTab_listchars
  endif
endfunc
com! -nargs=0 SeeTab :call SeeTab()

"Gtags
set cscopeprg=gtags-cscope

let Gtags_Close_When_Single = 1
let Gtags_Auto_Update = 0
let g:cscope_silent = 1
"au FileType php,pyhthon,c,cpp,javascrip,go map <C-]> :Gtags<CR><CR>
"au FileType php,python,c,cpp,javascript,go map <C-[> :Gtags -r<CR><CR>
nnoremap <leader><C-]> :execute 'Unite gtags/def:'.expand('<cword>')<CR>
nnoremap <leader><C-[> :execute 'Unite gtags/ref:'.expand('<cword>')<CR>

"CtrlP
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:200'

"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>', '<c-]>'],
  \ 'PrtDelete()':          ['<del>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<c-n>'],
  \ 'PrtHistory(1)':        ['<c-p>'],
  \ 'AcceptSelection("e")': ['<cr>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<c-t>', '<2-LeftMouse>'],
  \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  \ 'PrtInsert()':          ['<c-\>'],
  \ 'PrtCurStart()':        ['<c-a>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-l>', '<right>'],
  \ 'PrtClearCache()':      ['<F5>'],
  \ 'PrtDeleteEnt()':       ['<F7>'],
  \ 'CreateNewFile()':      ['<c-y>'],
  \ 'MarkToOpen()':         ['<c-z>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }
" ctrlp-funky
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

"indent line
"this only for indent by tab
"for indent with tab : set list lcs=tab:\|\ (here is a space)
let g:indentLine_enabled = 0
if has("gui_running")
  let g:indentLine_color_gui = '#A4E57E'
else
  let g:indentLine_color_term = 239
endif

"indent guide line
let g:indent_guides_guide_size = 1

"haskell setting
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

"devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_enable_ctrlp = 1
" adding to vim-airline's tabline 
let g:webdevicons_enable_airline_tabline = 0

"clang-format for formating cpp code
" //格式化最新的commit，并直接在原文件上修改
" git diff -U0 HEAD^ | clang-format-diff.py -i -p1
nnoremap <leader>cf :call FormatCode("Chromium")<CR>
nnoremap <leader>lf :call FormatCode("LLVM")<CR>
vnoremap <leader>cf :call FormatCode("Chromium")<CR>
vnoremap <leader>lf :call FormatCode("LLVM")<CR>
"let g:autoformat_verbosemode = 1
let g:autoformat_autoindent = 1

func! FormatCode(style)
  let firstline=line(".")
  let lastline=line(".")
  " Visual mode
  if exists(a:firstline)
    firstline = a:firstline
    lastline = a:lastline
  endif
  let g:formatdef_clangformat = "'clang-format-3.8
                          \ --lines='.a:firstline.':'.a:lastline.'        
                          \ --assume-filename='.bufname('%').'            
                          \ -style=" . a:style . "'"
  let formatcommand = ":" . firstline . "," . lastline . "Autoformat"
  exec formatcommand
endfunc

"command -nargs=1 PikaFormatCode :call FormatCode(<f-args>)

"rename tmux tab window name to open filename 
"check tmux installed
if executable('tmux')
  autocmd BufReadPost,FileReadPost,BufNewFile * call system('tmux rename-window '.expand("%:h"))
endif
"tmux navigator
"let g:loaded_tmux_navigator = 1
"let g:tmux_navigator_no_mappings = 1

"command! -bar -nargs=+ -complete=customlist,functions#GitBugComplete Gbug Git bug <q-args>
"command! -bar -nargs=+ -complete=customlist,functions#GitFeatureComplete Gfeature Git feature <q-args>
"command! -bar -nargs=+ -complete=customlist,functions#GitRefactorComplete Grefactor Git refactor <q-args>

