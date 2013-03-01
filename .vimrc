" #################
" muzuiget 的 vimrc
" #################

" 初始化 {{{1
" ======

" 关闭 vi 的兼容
set nocompatible

" 内置插件 {{{2
" --------

" 使用 matchit 插件
source $VIMRUNTIME/macros/matchit.vim

" 使用跟 Windows 兼容的快捷键设定
source $VIMRUNTIME/mswin.vim

" Windows 特别设置
if has("win32")
    source $VIMRUNTIME/vimrc_example.vim
endif

" 第三方插件 {{{2
" ----------

" 使用 pathogen 插件
try
    runtime bundle/pathogen.git/autoload/pathogen.vim
    call pathogen#runtime_append_all_bundles()
catch
endtry

" 选项 {{{1
" ====

" 常规 {{{2
" ----

set nobackup                       " 不使用备份功能
set bufhidden=hide                 " 隐藏缓冲区
set hlsearch                       " 开启查找高亮
set incsearch                      " 开启即时查找
set showcmd                        " 开启显示命令
set history=1000                   " 历史最大记录
set number                         " 显示行数
set display=lastline               " 显示所有内容
set scrolloff=3                    " 距离垂直边界 n 行就开始滚动
set sidescroll=1                   " 水平滚动列数
set sidescrolloff=10               " 距离水平边界 n 行就开始滚动
set isfname-==                     " 文件名过滤不包含等号
set ruler                          " 总是显示当前位置
set fileencoding=utf-8             " 文件默认编码
set fileencodings=utf-8,ucs-bom,gb18030,big5,default " 检测编码顺序
set ignorecase                     " 忽略大小写查找
set helplang=cn                    " 使用中文文档
set listchars=tab:\|_,trail:·      " list 样式制表符和空格显示
set foldlevel=1                    " 自动折叠等级为 1
set foldlevelstart=99              " 默认打开不折叠
set completeopt-=preview           " 补全不显示预览窗口
set splitbelow                     " 分割窗口时新窗口在下方
set title                          " 修改终端窗口标题

if &binary == 1                    " 二进制编辑模式
    set display+=uhex              " 以十六进制显示不可打印字符
endif

let mapleader = ","                " 使用逗号作 leader 键
let maplocalleader = "\\"          " 使用反斜杠作 localleader 键

" 命令行补全 {{{2
" ----------

set wildmenu                       " 命令行补全使用增强模式
set wildmode=list:longest          " 补全时显示样式为多行
set wildignore+=.hg,.git,.svn                    " 版本控制
set wildignore+=*.pyc                            " Python 字节码
set wildignore+=*.sw?                            " Vim 交换文件
set wildignore+=*.aux,*.out,*.toc                " LaTeX 文件
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " 二进制图像
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " 已编译的对象文件
set wildignore+=*.luac                           " Lua 字节码
set wildignore+=*.DS_Store                       " OSX 糟糕物

" 缩进 {{{2
" ----

set autoindent                     " 开启自动缩进
set cindent                        " 开启 C 语言的自动缩进
set expandtab                      " 开启把 Tab 扩展为空格
set tabstop=4                      " 设置 Tab 宽度为 4 个字符
set softtabstop=4                  " 软缩进宽度
set shiftwidth=4                   " 设置移动代码块宽度
set shiftround                     " 移动代码块时取整到缩进宽度

" 状态栏 {{{2
" ------

set laststatus=2
set statusline=%<%f\ %h%m%r        " 文件名及状态
set statusline+=%=                 " 中间空白
set statusline+=%-20.(%{&ff}:%{strlen(&fenc)?&fenc:&enc}:%{strlen(&ft)?&ft:'text'}%) " 格式:编码:类型
set statusline+=\ %-10.(%l,%c%V%)\ %P " 标尺信息

" 语法 {{{2
" ----

filetype plugin on                 " 开启文件类型插件
filetype indent on                 " 开启文件类型自动缩进
syntax enable                      " 开启语法高亮
try                                " 设置色彩方案
    colorscheme firefly
catch
    colorscheme desert
endtry

" 不同界面特别设置
if has("gui_running")              " 使用 GUI 时
    set autochdir                  " 自动 cd 打开文件的目录
    set guioptions-=T              " 关闭工具栏
    set guioptions-=m              " 关闭菜单栏
    set guioptions-=t              " 菜单不可撕下
    set guioptions-=e              " 非 GUI 标签栏
    set winaltkeys=no              " Alt 键不映射到菜单上
    set columns=160                " 设置窗口列数
    set lines=50                   " 设置窗口行数
    winpos 100 100                 " 窗口位置
else                               " 使用 CLI 时
    if &term == "xterm"            " 虚拟终端
        set t_Co=256               " 终端颜色数
    elseif &term == "linux"        " 控制台
        colorscheme torte          " 设置色彩方案
    endif
endif

" 默认配色修改
if g:colors_name == "torte"
    highlight Normal guifg=White ctermfg=NONE ctermbg=NONE
elseif g:colors_name == "desert"
    highlight Normal guibg=Black
    highlight NonText guibg=Black
endif

" 键位映射 {{{1
" ========

" 界面 {{{2
" ----

nnoremap <leader>gt :set guioptions+=T <cr>
nnoremap <leader>gT :set guioptions-=T <cr>
nnoremap <leader>gm :set guioptions+=m <cr>
nnoremap <leader>gM :set guioptions-=m <cr>
nnoremap <leader>gs :set guioptions+=mT <cr>
nnoremap <leader>gh :set guioptions-=mT <cr>

" 标签 {{{2
" ----

nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>te :tabedit
nnoremap <leader>tw :tabclose<cr>

" 高亮 {{{2
" ----

" 高亮第 81 列
nnoremap <leader>m :set colorcolumn=81<cr>
"
" 关闭高亮列
nnoremap <leader>M :set colorcolumn=""<cr>

" 取消查找高亮
nnoremap <a-/> :nohlsearch<cr>
inoremap <a-/> <esc>:nohlsearch<cr>i
nnoremap <leader>/ :nohlsearch<cr>

" 样式 {{{2
" ----

" 切换制表符和空格样式
nnoremap <leader>l :set invlist<cr>

" 切换行数
nnoremap <leader>n :set invnu<cr>

" 手动折叠
nnoremap <leader>fm :set foldmethod=manual<cr>

" 按缩进折叠
nnoremap <leader>fi :set foldmethod=indent<cr>

" 将自动折叠等级设置为1
nnoremap <leader>fl :set foldlevel=1<cr>

" 移动 {{{2
" ----

" 光标 {{{3
" ~~~~

nnoremap H ^
nnoremap L $

inoremap <a-h> <left>
inoremap <a-j> <down>
inoremap <a-k> <up>
inoremap <a-l> <right>
inoremap <a-a> <esc>$a
inoremap <a-i> <esc>^i

" 行间 {{{3
" ~~~~

inoremap <a-J> <esc>O<esc>jA
inoremap <a-K> <esc>kddA

" 窗口 {{{3
" ~~~~

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" 插入 {{{3
" ~~~~

" 插入上次删除的单词
inoremap <a-W> <c-r>w

" 在光标下插入新行
inoremap <a-o> <esc>o

" 在光标上插入新行
inoremap <a-O> <esc>O

" 插入当前行第一个单词到下一行，用 b 寄存器
inoremap <a-b> <esc>^"byeo<c-r>b

" 插入光标出上一行单词，用 g 寄存器
inoremap <a-g> <esc>keb"gyejA<c-r>i

" 删除 {{{3
" ~~~~

" 删除当前行并重写
inoremap <a-r> <esc>ddO

" 删除到行尾
inoremap <a-u> <esc>wd$a

" 删除光标处的单词
inoremap <a-w> <esc>eb"wdei

" 删除光标处双引号之间的字符串
inoremap <a-S> <esc>di"i

" 查找和替换 {{{2
" ----------

" 全文
nnoremap <a-s> :%s/
inoremap <a-s> <esc>:%s/
nnoremap <leader>s :%s/

" 选择
vnoremap <a-s> <esc>:s/
vnoremap <leader>s :s/

" 尾部空白字符
nnoremap <leader>ts /\s\+$<cr>

" 打开 {{{2
" ----

" 本文件
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>tev :tabedit $MYVIMRC<cr>

" 命令 {{{2
" ----

" 按照显示行移动
nnoremap j gj
nnoremap k gk

" 移动
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" 插入特殊字符
cnoremap <c-q> <c-v>

" 其它 {{{2
" ----

" 禁用 K 键看手册
nnoremap K <nop>

" 禁用 Q 键进入 Ex 模式
nnoremap Q <nop>

" 文件类型切换
nnoremap <leader>ft :set filetype=

" 文件换行格式切换
nnoremap <leader>ff :set fileformat=unix

" 文件编码切换
nnoremap <leader>fe :set fileencoding=utf-8

" diff 操作
nnoremap <leader>dt :windo diffthis<cr>
nnoremap <leader>do :windo diffoff<cr>

" 写入
nnoremap <leader>w :w<cr>

" sudo 写入
nnoremap <leader>W :w !sudo tee % >/dev/null

" 退出
nnoremap <leader>q :qa<cr>

" 强制退出
nnoremap <leader>Q :qa!<cr>

" 在 quickfix 窗口显示上次查找
nnoremap <leader>? :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" 函数 {{{1
" ====

" 清除光标前空格
function! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

" 预览窗口显示在屏幕下方
function! PreviewDown()
   if !&previewwindow
       silent! wincmd P
   endif
   if &previewwindow
       silent! wincmd J
       silent! wincmd p
   endif
endf
autocmd BufWinEnter * call PreviewDown()

" 调用外部终端执行命令
function! Terminal(command)
    let expandedCommand = a:command
    for part in split(a:command, ' ')
        if part[0] =~ '\v[%#<]'
            let expanedPart = fnameescape(expand(part))
            let expandedCommand = substitute(expandedCommand, part, expanedPart, '')
        endif
    endfor
    let wrapedCommand = 'gnome-terminal --geometry=160x50+100+100 -x /bin/sh -c "$command; read -s -n 1 -p \"Press any key to exit...\""'
    let wrapedCommand = substitute(wrapedCommand, '\$command', expandedCommand, '')
    execute 'silent !'.wrapedCommand
endfunction
command! -complete=shellcmd -nargs=+ Term call Terminal(<q-args>)

" 自动命令 {{{1
" ========

" 常规 {{{2
" ----

" 禁用视觉响铃
autocmd GUIEnter * set visualbell t_vb=

" 语法高亮 {{{2
" --------

" json
autocmd BufNewFile,BufRead *.json setfiletype javascript

" vimperatorrc 配置文件
autocmd BufNewFile,BufRead *vimperatorrc* setfiletype vim

" nginx 配置文件
autocmd BufNewFile,BufRead /etc/nginx/* setfiletype nginx

" markdown
autocmd BufNewFile,BufRead *.md setfiletype markdown

" proto
autocmd BufNewFile,BufRead *.proto setfiletype proto

" moin
autocmd BufNewFile,BufRead *.moin setfiletype moin

" lrc
autocmd BufNewFile,BufRead *.lrc setfiletype lrc

" cue
autocmd BufNewFile,BufRead *.cue setfiletype cue

" go
autocmd BufNewFile,BufRead *.go setfiletype go

" actionscript
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.as setfiletype actionscript
augroup end

" 插件设置 {{{1
" ========

" NerdTree {{{2
" --------

let NERDTreeIgnore=['\.pyc$']
let NERDTreeDirArrows=0
noremap <f2> :NERDTreeToggle<cr>

" PyRef {{{2
" -----

let g:pyref_mapping = '<leader>k'

" Voom {{{2
" ----

nnoremap <leader>O :Voom<cr>
nnoremap <leader>o :Voom
