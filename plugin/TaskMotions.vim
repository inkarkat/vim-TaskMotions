" TaskMotions.vim: Motion to task and TODO markers.
"
" DEPENDENCIES:
"   - CountJump/Motion.vim autoload script
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	001	19-Mar-2012	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_TaskMotions') || (v:version < 700)
    finish
endif
let g:loaded_TaskMotions = 1

if ! exists('g:TaskMotions_Pattern')
    let g:TaskMotions_Pattern =  '\C\<\%(FIXME\|TODO\|XXX\)\>'
endif

call CountJump#Motion#MakeBracketMotion('', 't', '', g:TaskMotions_Pattern, '', 0)

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
