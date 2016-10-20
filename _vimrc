"关闭兼容模式
set nocompatible
"模仿windows的快捷键
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
colo koehler
" 指定菜单语言
"set langmenu=zh_CN.utf-8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"set guifont=DejaVu\ Sans\ Mono:h12 
"set guifontwide=新宋体:h12
"设置字体
"set guifont=新宋体:h18:cGB2312

"设置字符集
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucsbom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1

"set fencs=utf-8,gbk,ucs-bom,gb18030,gb2312,cp936跟上行一样参考
"解决consls乱码问题
language messages zh_CN.utf-8
"解决菜单乱码问题
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"设置终端编码为gvim内部编码encoding
let &termencoding=&encoding
"防止特殊符号无法正常显示
set ambiwidth=double
set sw=4
set ts=4
set et
"设置不生成备份文件
set smarttab
set nobackup
"关闭上则工具栏
set guioptions-=T
"开启自动缩进
set autoindent
"TAB距离
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cindent
let mapleader="," 
"设置查找当前选中的文本
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
"设置path
set path=.,C:\Users\Administrator\Desktop\test,D:/app,
"设置单词自动补全
"set spell
"设置jk代替esc
inoremap jk <esc>
"set dictionary='./vimfiles/words.txt'
"setlocal dictionary+=$VIMRUNTIME/dict/english.dic
"setlocal complete+=k
"使用vundle插件
"set rtp+=D:/app/gvim/vimfiles/bundle/vundle/
"call vundle#rc('D:/app/gvim/vimfiles/bundle/')
"Bundle 'gmarik/vundle'


"使用Tagbar插件  列出当前 文件中的类，方法，变量等
"-------------空
" ctrap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"使用vundle插件
map <F2> :NERDTreeToggle<CR>

"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

":inoremap html <html><Enter><Tab><head><Enter><Tab><meta http-equiv="Content-Type" content="text/html;charset=utf-8"><Enter><title></title><Enter><script src=''></script><Enter><style></style><Enter><Backspace><Backspace></head><Enter><body><Enter><Enter><Backspace></body><Enter><Backspace><Backspace></html><Esc>kki<Tab><Tab><Tab>
":inoremap divs <div style='' id='' class=''></div><Esc>hhhhhi
:inoremap 11 <Esc>:w<Enter>a
:inoremap 112 <Esc>:wq<Enter>
"设置函数变量列表插件
set tags=D:\WWW\y\tags
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=40        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
nnoremap <silent><F4> :TlistToggle<CR>


