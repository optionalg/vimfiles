" ######
" Python
" ######

" 执行程序 {{{1
" ========

noremap <f9> :!python %<cr>
noremap <f10> :Term python %<cr>

" 缩写 {{{1
" ====

" call stack
iabbrev pypk import traceback; traceback.print_stack()

" python shell
iabbrev pysh import code; code.interact(locals=locals())

" python 调试器
iabbrev pybk import pdb; pdb.set_trace()

" ipython shell
iabbrev ipysh from IPython import embed; embed()

" ipython 调试器
iabbrev ipybk import ipdb; ipdb.set_trace()
