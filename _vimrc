set nocompatible "vi非互換モード

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

"PHPの辞書　補完 20090520
:set dictionary=dictionary/php.dict
"拡張子で、分岐するように設定しておく、今回はPHPのみの設定なのであまり関係ないが記述しておく。
autocmd FileType php :set dictionary=dictionary/PHP.dict
