set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set shiftwidth=4
set expandtab
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
:set backspace=2 "BackSpaceで改行を消せるように

autocmd! BufNewFile,BufRead *.tt,*.tx setf html

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 今後このあたりに追加のプラグインをどんどん書いて行きます！！

NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'

hi Pmenu ctermbg=4
hi PmenuSel ctermbg=1
hi PMenuSbar ctermbg=4

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------
"
" Unite.vim
let g:unite_enable_start_insert = 1
nnoremap <silent> <C-@> :<C-u>Unite file_mru<CR>
inoremap <silent> <C-@> <ESC>:<C-u>Unite file_mru<CR>
