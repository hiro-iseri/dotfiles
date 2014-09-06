filetype off

"全般
set nocompatible
autocmd FileType * setlocal formatoptions-=ro
set clipboard+=unnamed

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

"バックアップ
set nobackup
set autoread
set noswapfile

"ファイルごとの設定
function! s:cpp()
  "括弧を構成する設定に <> を追加する
	setlocal matchpairs+=<:>
	"最後に定義された include 箇所へ移動してを挿入モードへ
	nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o
endfunction

augroup vimrc-cpp
	autocmd!
	" filetype=cpp が設定された場合に関数を呼ぶ
	autocmd FileType c,cpp call s:cpp()
augroup END

"キー設定
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"プラグイン関連
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto=1

source ~/dotfiles/.vimrc.neobundle
filetype plugin on
filetype indent on
