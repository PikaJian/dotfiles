" Fugitive Functions in autoload/functions.vim
function! s:GitShortRefNames(names, full_name) "{{{2
  if a:full_name
    let expr = 'v:val[11:]'
  else
    let expr = 'v:val[strridx(v:val, "/")+1:]'
  endif
  return map(a:names, expr)
endfunction

function! s:GitExecInPath(cmd) "{{{2
  if exists('b:git_dir')
    let path = b:git_dir
  else
    let path = fugitive#extract_git_dir('.')
  endif
  let path = fnamemodify(path, ':h')

  return system('cd ' . path . '; ' . a:cmd)
endfunction

function! s:GitComplete(ArgLead, Cmdline, Cursor, ...) "{{{2
  let refs = 'refs/heads/'
  if a:0 == 1 && a:1 !=? 'branch'
    let refs = 'refs/' . a:1
    let full_name = 1
  elseif a:0 == 2 && a:1 ==? 'branch'
    let refs = refs . a:2
    let full_name = 0
  endif

  let cmd = 'git for-each-ref --format="%(refname)" ' . refs
  if !empty(a:ArgLead)
    let cmd = cmd . ' | sed "s/.*\/\(.*\)/\1/" | grep ^' . a:ArgLead . ' 2>/dev/null'
  endif
  return s:GitShortRefNames(split(s:GitExecInPath(cmd)), full_name)
endfunction

function! s:GitExtraComplete(ArgLead, CmdLine, Cursor, type) "{{{2
  if (empty(a:ArgLead) || a:ArgLead =~? '^f\%[inish]$') && a:CmdLine !~? 'finish\s*$'
    return ['finish']
  else
    return s:GitComplete(a:ArgLead, a:CmdLine, a:Cursor, 'branch', a:type)
  endif
endfunction
function! functions#GitBugComplete(ArgLead, CmdLine, Cursor) "{{{2
  return s:GitExtraComplete(a:ArgLead, a:CmdLine, a:Cursor, 'bug')
endfunction

function! functions#GitFeatureComplete(ArgLead, CmdLine, Cursor) "{{{2
  return s:GitExtraComplete(a:ArgLead, a:CmdLine, a:Cursor, 'feature')
endfunction

function! functions#GitRefactorComplete(ArgLead, CmdLine, Cursor) "{{{2
  return s:GitExtraComplete(a:ArgLead, a:CmdLine, a:Cursor, 'refactor')
endfunction
