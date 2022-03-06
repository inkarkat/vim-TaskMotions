" TaskMotions.vim: Motions to task and TODO markers.
"
" DEPENDENCIES:
"   - CountJump.vim plugin
"   - SameHighlightMotion.vim plugin (optional)
"
" Copyright: (C) 2012-2022 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_TaskMotions') || (v:version < 700)
    finish
endif
let g:loaded_TaskMotions = 1
let s:save_cpo = &cpo
set cpo&vim

"- configuration ---------------------------------------------------------------

if ! exists('g:TaskMotions_Pattern')
    let g:TaskMotions_Pattern =  '\C\<\%(FIXME\|TODO\|XXX\)\>'
endif

if ! exists('g:TaskMotions_Mapping')
    let g:TaskMotions_Mapping = 't'
endif

if ! exists('g:TaskMotions_HlgroupPattern')
    let g:TaskMotions_HlgroupPattern = '^Todo$'
endif

if ! exists('g:TaskMotions_HlgroupMapping')
    let g:TaskMotions_HlgroupMapping = 'T'
endif


"- functions -------------------------------------------------------------------

function! TaskMotions#Forward( mode )
    call CountJump#JumpFunc(a:mode, function('SameHighlightMotion#JumpToGroupWithWrapMessage'), function('SameHighlightMotion#SearchFirstHlgroup'), g:TaskMotions_HlgroupPattern, 'todo highlighting search', 0)
endfunction
function! TaskMotions#Backward( mode )
    call CountJump#JumpFunc(a:mode, function('SameHighlightMotion#JumpToGroupWithWrapMessage'), function('SameHighlightMotion#SearchLastHlgroup'), g:TaskMotions_HlgroupPattern, 'todo highlighting search', 1)
endfunction


"- mappings --------------------------------------------------------------------

if ! empty(g:TaskMotions_Mapping)
    call CountJump#Motion#MakeBracketMotion('', g:TaskMotions_Mapping, '', g:TaskMotions_Pattern, '', 0, 'nov', 'task search')
endif

if ! empty(g:TaskMotions_HlgroupMapping)
    call CountJump#Motion#MakeBracketMotionWithJumpFunctions('', g:TaskMotions_HlgroupMapping, '',
    \   function('TaskMotions#Forward'),
    \   function('TaskMotions#Backward'),
    \   '', '', 0)
endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
