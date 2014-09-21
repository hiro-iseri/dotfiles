"neobundle関連
source ~/dotfiles/.vimrc.neobundle

"改行時の自動コメントアウト無効
autocmd FileType * setlocal formatoptions-=ro
set clipboard+=unnamed
"beep無効化
set vb t_vb=

"インデント
source ~/dotfiles/.vimrc.indent

"検索
source ~/dotfiles/.vimrc.search

"移動操作
source ~/dotfiles/.vimrc.move

"エンコード
source ~/dotfiles/.vimrc.encoding

"体裁
source ~/dotfiles/.vimrc.appearance
autocmd FileType c,cpp source ~/dotfiles/.vimrc.code.appearance

"編集中でも他ファイルを開けるように
set hidden

"バックアップ
set nobackup
set autoread
set noswapfile

filetype on
"ファイルごとの設定
function! s:cpp()
  "括弧を構成する設定に <> を追加する
	setlocal matchpairs+=<:>
endfunction

augroup vimrc-cpp
	autocmd!
	autocmd FileType c,cpp call s:cpp()
augroup END

"キー設定
"クリップボードからの貼付け
imap <C-@> <ESC>"*pa

"vimrc設定取り込み
command! Rv source $MYVIMRC

nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"Unite関連でよく使う操作
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer<CR>
nnoremap <silent> <C-y> :<C-u>Unite history/yank<CR>
inoremap <silent> <C-y> <ESC>:<C-u>Unite history/yank<CR>


"プラグイン関連
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto=1

let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
	\ 'c' : $HOME.'/.vim/dict/c.dict',
	\ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
	\ 'v' : $HOME.'/.vim/dict/verilog.dict'
	\ }

let g:unite_source_history_yank_enable=1
let g:unite_enable_start_insert=1

filetype plugin on
filetype indent on
