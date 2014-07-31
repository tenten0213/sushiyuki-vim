function! s:sushi(type)
  let sushiMap = {
        \'yes': 1,
        \'no': 2,
        \'ok': 3,
        \'thanks': 4,
        \'thank you': 4,
        \'gyoku': 4,
        \'sorry':  5,
        \'sigh': 6,
        \'angry': 7,
        \'no comment': 8,
        \'cool': 9,
        \'kappa': 10,
        \'help': 11,
        \'what': 12,
        \'question': 12,
        \'sleep': 13,
        \'sleeply': 13,
        \'oh no': 14,
        \'love': 15,
        \'grin': 16,
        \'bye': 17,
        \'sneak': 18,
        \'hide': 19,
        \'peel': 20,
        \'hot': 21,
        \'fail': 22,
        \'dip': 22,
        \'too much': 23,
        \'ikura': 23,
        \'happy': 24,
        \'smile': 25,
        \'boom': 25,
        \'wat': 26,
        \'anago': 26,
        \'tea': 27,
        \'content': 27,
        \'agari': 27,
        \'gari': 28,
        \'don''t forget': 28,
        \'wasabi': 29,
        \'sabi': 29,
        \'come on': 30,
        \'c''mon': 30,
        \'sparkles': 31,
        \'sweat': 32,
        \'cry': 33,
        \'surprised': 34,
        \'idea': 35,
        \'sad': 36,
        \'sob': 36,
        \'chat': 37,
        \'phone': 38,
        \'call': 38,
        \'hello': 39,
        \'see you': 40 }

  if &ft == 'markdown'
    let content = '![' . '寿司ゆき:' . a:type . ':](' . 'https://raw.githubusercontent.com/tenten0213/sushiyuki-vim/master/images/sushiyuki_' . sushiMap[a:type] . '.png)'
  elseif &ft == 'html'
    let content = '<img src="' . 'https://raw.githubusercontent.com/tenten0213/sushiyuki-vim/master/images/sushiyuki_' . sushiMap[a:type] . '.png' . '" alt="' . '寿司ゆき:' . a:type . '">'
  else
    let content = 'https://raw.githubusercontent.com/tenten0213/sushiyuki-vim/master/images/sushiyuki_' . sushiMap[a:type] . '.png'
  endif

  let line = getline('.')
  echo line
  let indent = matchstr(line, '^\s\+')
  let content = join(map(split(content, "\n"), 'indent . v:val'))

  if line =~ '^\s*$'
    call setline('.', split(content, "\n"))
  else
    put! =content
  endif

  return ''
endfunction

inoremap <plug>(sushi) <c-r>=<sid>sushi()<cr>
nnoremap <plug>(sushi) :<c-u>call <sid>sushi()<cr>

if !hasmapto('<Plug>(sushi)')
\  && (!exists('g:lgtm_no_default_key_mappings')
\      || !g:lgtm_no_default_key_mappings)
  silent! map <unique> <leader>sushi <plug>(sushi)
endif

command! -nargs=* Sushi call s:sushi(<f-args>)
