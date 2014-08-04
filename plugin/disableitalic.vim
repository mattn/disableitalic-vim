function! s:disable_italic()
  let his = ''
  redir => his
  silent hi
  redir END
  for line in filter(split(substitute(his, '\n\s\+', ' ', 'g'), "\n"), 'v:val=~"=.*italic"')
    exe 'hi' substitute(substitute(line, ' xxx ', ' ', ''), 'italic', 'none', 'g')
  endfor
endfunction

command! DisableItalic call s:disable_italic()
