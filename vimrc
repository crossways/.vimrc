set nocompatible
filetype off

"""
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"""
" set the runtime path to include plug and initialize
call plug#begin()
    Plug 'junegunn/vim-plug'

    Plug 'tomtom/tcomment_vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Lokaltog/powerline-fonts'
    Plug 'sjl/gundo.vim'
    " Plug 'regedarek/ZoomWin'
    Plug 'tpope/vim-surround'
    " Plug 'vim-scripts/TaskList.vim'
    " Plug 'kien/tabman.vim'
    " Plug 'majutsushi/tagbar'
    Plug 'flazz/vim-colorschemes'
    Plug 'chrisbra/NrrwRgn'
    " Plug 'wesQ3/vim-windowswap'
    " Plug 'chrisbra/changesPlugin'
    Plug 'easymotion/vim-easymotion'
    Plug 'terryma/vim-expand-region'
    Plug 'chrisbra/Recover.vim'

    " Plug 'vim-scripts/dbext.vim'
    Plug 'JLimperg/Align'
    Plug 'jphustman/SQLUtilities'

    Plug 'tpope/vim-fugitive'
    Plug 'AndrewRadev/linediff.vim'
    Plug 'will133/vim-dirdiff'
    Plug 'chrisbra/vim-diff-enhanced'

    Plug '2072/PHP-Indenting-for-VIm'
    Plug 'StanAngeloff/php.vim'
    Plug 'shawncplus/phpcomplete.vim'

    Plug 'tpope/vim-vinegar'

    Plug 'Valloric/YouCompleteMe'
   " Plug 'klen/python-mode'
    " Plug 'jaxbot/semantic-highlight.vim'
    " Plug 'IngoHeimbach/semantic-highlight.vim'
    Plug 'jsenin/semantic-highlight.vim'

    Plug 'w0rp/ale'

    Plug 'godlygeek/tabular'
    Plug 'junegunn/vim-easy-align'

    Plug 'diepm/vim-rest-console'
    Plug 'jpalardy/vim-slime'

""" " All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required

syntax on

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" set background=light
colorscheme molokai
" hi NonText ctermbg=none
" hi Normal guibg=NONE ctermbg=NONE
set termguicolors
" colorscheme base16-solarized-light
" colorscheme base16-monokai
" colorscheme lucius

set number
set relativenumber
set cursorline
set cursorcolumn
set laststatus=2
set virtualedit=all
set t_Co=256
set scrolloff=5
set sidescrolloff=1
set tabpagemax=30
set switchbuf=usetab
set splitright
set splitbelow

" works with Konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set t_SH =

set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

set showcmd
set showmatch
set wildmenu
set hidden

set smartindent
set autoindent
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set wrap
set colorcolumn=80,120
set textwidth=80

set ignorecase
set smartcase
set hlsearch
set incsearch

runtime! macros/matchit.vim

set backspace=indent,eol,start
set history=100 " keep 100 lines of command line history
set undofile
set clipboard+=unnamed

set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backups//
set undodir=~/.vim/undodir//

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set formatoptions+=j

set sessionoptions-=curdir
set sessionoptions-=options
"set ssop-=curdir
set sessionoptions+=sesdir
"set ssop+=sesdir
let g:session_directory=getcwd()
let g:session_autosave='no'

set diffopt+=filler
set diffopt+=iwhite
set diffopt+=vertical

set encoding=utf-8
set spelllang=en

set foldcolumn=2
set foldmethod=indent
set foldlevel=0
" open all folds on file open
au BufRead * normal zR
"
set concealcursor=vin
set conceallevel=2

set completeopt=menu,menuone,longest

let g:airline_powerline_fonts = 1
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
if has('gui_running')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    set guioptions=aMgh
endif


" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

inoremap <C-Space> <c-x><c-u>
inoremap <C-@> <c-x><c-u>

" nnoremap <silent> <S-F3> :TagbarShowTag<CR>
" nnoremap <silent> <F3> :TagbarToggle<CR>
" nnoremap <silent> <F4> :SyntasticCheck<CR>

" nnoremap <silent> <F5> :TaskList<CR>
nnoremap <silent> <F5> :SemanticHighlightToggle<CR>

" nnoremap <silent> <F8> :TMToggle<CR>
" nnoremap <silent> <F9> :TMFocus<CR>
nnoremap <silent> <F11> :GundoToggle<CR>
" nnoremap <silent> <F12> :ZoomWin<CR>


function! CountEditors()
    :Gblame
    :set modifiable
    :%s/.\{-} (\(.\{-}\)\s* 20.\{-}).*/\1/
    :% !sort | uniq -c
endfunction

nnoremap <silent> <LEADER>who :call CountEditors()<CR>


set autoread
nnoremap <silent> <Leader>r :checktime<CR>

" " Unite
" nnoremap <C-p> :Unite<CR>
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" let g:unite_source_history_yank_enable = 1


map <C-PAGEUP> :bp<CR>
map <C-PAGEDOWN> :bn<CR>
"
" nmap <silent> F :e!<CR>G:sleep 500m<CR>:redraw<CR>F
nmap <silent> <leader>F :e!<CR>G:sleep 500m<CR><leader>F


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Remove all trailing whitespaces on write.
" Probably not always wanted...
autocmd BufWritePre * %s/\s\+$//e


let g:dbext_default_use_sep_result_buffer = 1
let g:dbext_default_profile_dbFlights = 'type=MYSQL:user=www-data:passwd="":dbname=flights:host=hera.infosys.de'
let g:dbext_default_profile_dbReplica = 'type=MYSQL:user=www-data:passwd="":dbname=replica:host=f1-pydusadb.infosys.de'
let g:dbext_default_profile_dbReplicaFlights = 'type=MYSQL:user=www-data:passwd="":dbname=flights:host=f1-pydusadb.infosys.de'
let g:dbext_default_profile_dbTax = 'type=MYSQL:user=www-data:passwd="":dbname=flights:host=f1-pcache.infosys.de'
let g:dbext_default_profile_dbGeos = 'type=MYSQL:user=www-data:passwd="":dbname=replica:host=f1-pydusadb2.infosys.de'

let g:dbext_default_profile_dbSessions1 = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f1-xmlapidb5.infosys.de'
let g:dbext_default_profile_dbSessions2 = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f2-xmlapidb3.infosys.de'
let g:dbext_default_profile_dbSessions3 = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f1-xmlapidb5.infosys.de'
let g:dbext_default_profile_dbSessions4 = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f2-xmlapidb4.infosys.de'
let g:dbext_default_profile_dbSessions5 = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f2-xmlapidb6.infosys.de'
let g:dbext_default_profile_dbSessions6 = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f1-xmlapidb2.infosys.de'
let g:dbext_default_profile_dbSessions7 = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f1-xmlapidb7.infosys.de'
let g:dbext_default_profile_dbSessions8 = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f2-xmlapidb8.infosys.de'
let g:dbext_default_profile_dbSessions9 = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f1-xmlapidb9.infosys.de'

let g:dbext_default_profile_dbMiles = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f1-xmlapidb1.infosys.de'
let g:dbext_default_profile_dbAdvTax = 'type=PGSQL:user=postgres:passwd="":dbname=yps_cache:host=f1-ycache4.infosys.de'
let g:dbext_default_profile_dbStatisticsFailed = 'type=PGSQL:user=postgres:passwd="":dbname=statistics_failed:host=f1-brutus.infosys.de'

let g:dbext_default_profile_dbCrsController = 'type=MYSQL:user=www-data:passwd="":dbname=replica:host=flightdbmaster.infosys.de'

let g:dbext_default_profile_dbPnr = 'type=PGSQL:user=postgres:passwd="":dbname=pnr:host=f1-brutus.infosys.de'
let g:dbext_default_profile_configDb = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f1-xmlapidb.infosys.de'

let g:dbext_default_profile_dbFl3FdCache = 'type=MYSQL:user=www-data:passwd="":dbname=flights:host=fdcache.infosys.de'

let g:dbext_default_profile_dbStatisticsOP = 'type=PGSQL:user=postgres:passwd="":dbname=statistics_op:host=f1-brutus.infosys.de'
let g:dbext_default_profile_dbUsage = 'type=PGSQL:user=postgres:passwd="":dbname=nofrill_usage:host=f1-brutus.infosys.de'
let g:dbext_default_profile_logDb = 'type=PGSQL:user=postgres:passwd="":dbname=flights:host=f1-logxml1.infosys.de'

let g:dbext_default_profile_localhost = 'type=PGSQL:user=postgres:passwd="postgres":dbname=postgres:host=localhost'
let g:dbext_default_profile_importerNew = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new:host=localhost'
let g:dbext_default_profile_importerNewEtacs = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new:host=etacs-dev-db.infosys.de'

let g:dbext_default_profile_localImporterNew = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new:host=localhost'
let g:dbext_default_profile_localImporterNewOld = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new_old:host=localhost'
let g:dbext_default_profile_localImporterNewTests = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new_tests:host=localhost'
let g:dbext_default_profile_localImporterNewTests2 = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new_tests2:host=localhost'

let g:dbext_default_profile_etacsdevdbImporterNew = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new:host=etacs-dev-db.infosys.de'
let g:dbext_default_profile_etacsdevdbImporterNew2 = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new_2:host=etacs-dev-db.infosys.de'
let g:dbext_default_profile_etacsdevdbImporterNew3 = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new_3:host=etacs-dev-db.infosys.de'
let g:dbext_default_profile_etacsdevdbImporterNewAer = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new_aer:host=etacs-dev-db.infosys.de'
let g:dbext_default_profile_etacsdevdbImporterNewAerTests = 'type=PGSQL:user=postgres:passwd="postgres":dbname=importer_new_aer_tests:host=etacs-dev-db.infosys.de'

let g:dbext_default_profile_charterCharter = 'type=PGSQL:user=postgres:passwd="postgres":dbname=charter:host=f1-charterdb.infosys.de'
let g:dbext_default_profile_charterLogs = 'type=PGSQL:user=postgres:passwd="postgres":dbname=logs:host=f1-charterdb.infosys.de'
let g:dbext_default_profile_charterGDSLogs = 'type=PGSQL:user=postgres:passwd="postgres":dbname=gdslog:host=f1-charterdb.infosys.de'
let g:dbext_default_profile_charterInfx = 'type=PGSQL:user=postgres:passwd="postgres":dbname=infx:host=f1-charterdb.infosys.de'
let g:dbext_default_profile_charterInfxAvailability = 'type=PGSQL:user=postgres:passwd="postgres":dbname=infx:host=infxavailability.infosys.de'
let g:dbext_default_profile_charterYpsCache = 'type=PGSQL:user=postgres:passwd="postgres":dbname=yps_cache:host=f1-ycache2.infosys.de'

let g:dbext_default_profile_charterPydb = 'type=MYSQL:user=www-data:passwd="":dbname=replica:host=f1-pydusadb.infosys.de'

"let g:pymode = 1
"let g:pymode_rope = 0
"let g:pymode_rope_completion = 0
"" " let g:pymode_python = 'python3'
"" let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257', 'pyflakes']
"let g:pymode_lint_checkers = []
"let g:pymode_lint_on_write = 0
"let g:pymode_lint_on_fly = 0
"let g:pymode_folding = 0
"let g:pymode_options = 0
"let g:pymode_options_max_line_length = 120
"let g:pymode_run = 0
"let g:pymode_syntax = 0
"let g:pymode_syntax_slow_sync = 0
"let g:pymode_syntax_all = 0
"let g:pymode_syntax_print_as_function = 0
"let g:pymode_indent = 1

" set nolisp
" set indentkeys=!^F,o,O,<:>,0),0],0},=elif,=except
" set indentexpr=pymode#indent#get_indent(v:lnum)
" set tabstop=4
" set expandtab
" set autoindent


" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['flake8', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylint', 'python']
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_mode_map = {"mode": "passive", "active_filetypes": [], "passive_filetypes": []}

" g:pymode_options "
set complete+=t
set formatoptions-=t
set number
set wrap
set textwidth=120

" format json-objects
" :%!python -m json.tool
"
let g:sqlutil_keyword_case='\U'


let g:semanticEnableFileTypes = ['javascript', 'vim', 'python', 'c', 'cpp', 'php']
let g:slime_target = "vimterminal"

let g:gundo_prefer_python3 = 1
set ttymouse=sgr

let g:ale_cpp_clang_executable='clang++-6.0'
let g:ale_cpp_clangcheck_executable='clang-check-6.0'
let g:ale_cpp_clangtidy_executable='clang-tidy-6.0'
let g:ale_cpp_clang_options='-std=c++17 -Wall -Wextra -pedantic'
let g:ale_cpp_gcc_options='-std=c++17 -Wall -Wextra -pedantic'
let g:ale_cpp_cppcheck_options='-std=c++17 -Wall -Wextra -pedantic'
