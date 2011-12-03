set nocompatible           " vi機能優先しない
filetype off

if has("win32") || has("win64")
    set rtp+=~/vimfiles/vundle.git/ 
    call vundle#rc('~/vimfiles/bundle/')
else
    set rtp+=~/.vim/vundle.git/ 
    call vundle#rc()
endif

Bundle 'clones/vim-l9'
Bundle 'FuzzyFinder'
Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'sudo.vim'

"ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'


"js
Bundle 'JavaScript-syntax'
Bundle 'itspriddle/vim-javascript-indent'

"php
Bundle 'cake.vim'
"Bundle 'php.vim'


filetype plugin indent on     " required!
"#######################
" 表示系
"#######################
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示

"#######################
" プログラミングヘルプ系
"#######################
syntax on "カラー表示
set smartindent "オートインデント
" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=4 sw=4 sts=0 "タブは半角4文字分のスペース
" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"#######################
" 検索系
"#######################
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
set nohlsearch "検索結果文字列の非ハイライト表示

if has('gui_macvim')
    set showtabline=2   " タブを常に表示
    set imdisable   " IMを無効化
    set transparency=10 " 透明度を指定
    set antialias
    set guifont=Monaco:h14
    colorscheme macvim
    defaults write org.vim.MacVim MMTerminateAfterLastWindowClosed yes "最後のウィンドウを閉じた時に自動でMacVim終了
    defaults write org.vim.MacVim MMOpenFilesInTabs yes "ファイルドロップしたとタブで開く
endif

if has("gui_running")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif

"#######################
" リファレンス
"####################### 
let g:ref_phpmanual_path = '/Users/genki/Documents/Reference/php-chunked-xhtml'

"#######################
" 自動補完
"#######################
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"

"#######################
" PHP関連
"#######################
autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd BufNewFile,BufRead *.ctp set filetype=php
