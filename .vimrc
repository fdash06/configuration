set number "行番号を表示する
set title "編集中のファイル名を表示
set ruler
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

" closing tags
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

" for %
source $VIMRUNTIME/macros/matchit.vim

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
   \ 'colorscheme': 'wombat',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'fugitive', 'readonly', 'absolutepath', 'modified' ] ]
   \ },
   \ 'component': {
   \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
   \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
   \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
   \ },
   \ 'component_visible_condition': {
   \   'readonly': '(&filetype!="help"&& &readonly)',
   \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
   \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
   \ }
   \ }

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }


NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'marcus/rsense'
"NeoBundle 'supermomonga/neocomplete-rsense.vim'
"
" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

NeoBundle 'tpope/vim-rails'
NeoBundle 'basyura/unite-rails'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

NeoBundle 'scrooloose/nerdtree'

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
nnoremap <C-@> :Unite buffer file_mru file<CR>
nnoremap <silent> <space>g :Unite grep: -buffer-name=search-buffer<CR>
nnoremap <silent> <space>r :UniteResume search-buffer<CR>
nnoremap <silent> <space>r :UniteResume search-buffer<CR>
nnoremap <space>rm :Unite rails/model<CR>
nnoremap <space>rc :Unite rails/controller<CR>
nnoremap <space>rv :Unite rails/view<CR>
nnoremap <space>rh :Unite rails/helper<CR>

" # NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" user function
function! Tab(param)
    let &l:tabstop = a:param
    let &l:shiftwidth = a:param
endfunction
nnoremap <space>t2 :<C-u>:call Tab(2)<CR>
nnoremap <space>t4 :<C-u>:call Tab(4)<CR>
