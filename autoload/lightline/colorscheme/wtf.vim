" wtf.vim - a variable contrast color scheme for lightline lovers
" Last Change:  2016 Sep 06
" Maintainer:   Steven Stallion <sstallion@gmail.com>
" License:      Simplified BSD License

let s:save_cpo = &cpo
set cpo&vim

" Color Definitions
let s:normal  = [wtf#gui_white,       wtf#gui_blue,       wtf#cterm_white,       wtf#cterm_blue,       'bold']
let s:insert  = [wtf#gui_white,       wtf#gui_green,      wtf#cterm_white,       wtf#cterm_green,      'bold']
let s:visual  = [wtf#gui_darkestgray, wtf#gui_brightblue, wtf#cterm_darkestgray, wtf#cterm_brightblue, 'bold']
let s:replace = [wtf#gui_white,       wtf#gui_orange,     wtf#cterm_white,       wtf#cterm_orange,     'bold']

let s:active_left = [
      \ [wtf#gui_darkestgray, wtf#gui_brightgray,  wtf#cterm_darkestgray, wtf#cterm_brightgray],
      \ [wtf#gui_brightgray,  wtf#gui_darkergray,  wtf#cterm_brightgray,  wtf#cterm_darkergray],
      \ [wtf#gui_brightgray,  wtf#gui_darkestgray, wtf#cterm_brightgray,  wtf#cterm_darkestgray],
      \ ]

let s:active_middle = [
      \ [wtf#gui_brightgray, wtf#gui_darkestgray, wtf#cterm_brightgray, wtf#cterm_darkestgray],
      \ ]

let s:active_right = s:active_left

let s:inactive_left   = s:active_left[1:]
let s:inactive_middle = s:active_middle
let s:inactive_right  = s:active_right[1:]

let s:error = [
      \ [wtf#gui_red, wtf#gui_darkestgray, wtf#cterm_red, wtf#cterm_darkestgray, 'standout'],
      \ ]

let s:warning = [
      \ [wtf#gui_gray, wtf#gui_darkestgray, wtf#cterm_gray, wtf#cterm_darkestgray],
      \ ]

" Returns a copy of {list} with items modified by a copy of each
" argument relative to index 0. This function is used to override
" specific colors without modifying the underlying list.
function! s:overlay(list, ...)
  let list = copy(a:list)
  let index = 0
  for item in a:000
    let list[index] = copy(item)
    let index += 1
  endfor
  return list
endfunction

let g:lightline#colorscheme#wtf#palette = lightline#colorscheme#fill({
      \ 'normal': {
      \   'left'   : s:overlay(s:active_left, s:normal),
      \   'middle' : s:active_middle,
      \   'right'  : s:active_right,
      \   'error'  : s:error,
      \   'warning': s:warning,
      \ },
      \ 'insert': {
      \   'left'  : s:overlay(s:active_left, s:insert),
      \   'middle': s:active_middle,
      \   'right' : s:active_right,
      \ },
      \ 'visual': {
      \   'left'  : s:overlay(s:active_left, s:visual),
      \   'middle': s:active_middle,
      \   'right' : s:active_right,
      \ },
      \ 'replace': {
      \   'left'  : s:overlay(s:active_left, s:replace),
      \   'middle': s:active_middle,
      \   'right' : s:active_right,
      \ },
      \ 'inactive': {
      \   'left'  : s:inactive_left,
      \   'middle': s:inactive_middle,
      \   'right' : s:inactive_right,
      \ },
      \ 'tabline': {
      \   'left'  : s:inactive_left,
      \   'middle': s:inactive_middle,
      \   'right' : s:active_right,
      \   'tabsel': s:overlay(s:active_left, s:normal),
      \ },
      \ })

" lightline incorrectly calculates the width of the window when a
" vertical split is present, which results in improper highlighting;
" see: https://github.com/itchyny/lightline.vim/issues/179.
function! lightline#colorscheme#wtf#highlight()
  call wtf#highlight({
        \ 'StatusLine': {
        \   'ctermfg': s:active_right[0][2], 'ctermbg': s:active_right[0][3],
        \   'guifg'  : s:active_right[0][0], 'guibg'  : s:active_right[0][1],
        \ },
        \ 'StatusLineNC': {
        \   'ctermfg': s:inactive_right[0][2], 'ctermbg': s:inactive_right[0][3],
        \   'guifg'  : s:inactive_right[0][0], 'guibg'  : s:inactive_right[0][1],
        \ },
        \ 'WildMenu': {
        \   'cterm': s:normal[4], 'ctermfg': s:normal[2], 'ctermbg': s:normal[3],
        \   'gui'  : s:normal[4], 'guifg'  : s:normal[0], 'guibg'  : s:normal[1],
        \ },
        \ })
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
