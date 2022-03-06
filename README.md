TASK MOTIONS
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

This plugin defines movement commands to go to a task or TODO marker embedded
in the file, like this:
```
    // TODO: Check the return code from the frobnicator.
```

### RELATED WORKS

To get a list of all tasks and TODO markers in the current file or project,
you can use the companion GrepTasks.vim plugin ([vimscript #4196](http://www.vim.org/scripts/script.php?script_id=4196)).

USAGE
------------------------------------------------------------------------------

    ]t                      Go to [count] next start of a task or TODO marker.
    [t                      Go to [count] previous start of a task or TODO marker.

    ]T                      Go to [count] next start of something highlighted with
                            the Todo highlight group.
    [T                      Go to [count] previous start of something highlighted
                            with the Todo highlight group.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-TaskMotions
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim TaskMotions*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the CountJump plugin ([vimscript #3130](http://www.vim.org/scripts/script.php?script_id=3130)), version 1.81 or higher.
- SameHighlightMotion.vim plugin (unreleased), version 1.00 or
  higher (optional; only for the ]T mappings).

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

Tasks and TODO markers are defined by a regular expression. Change it via:

    let g:TaskMotions_Pattern = '\<TODO:'

To include additional / different highlight groups in the ]T motions, adapt
the regular expression for them:

    let g:TaskMotions_HlgroupPattern = '^\%(Todo\|WarningMsg\)$'

To change the default mappings from ]t to ]x, use:

    let g:TaskMotions_Mapping = 'x'

To change the default mappings from ]T to ]X, use:

    let g:TaskMotions_HlgroupMapping = 'X'

To also change the [ / ] prefix to something else, follow the instructions for
CountJump-remap-motions. If you don't want a mapping, set the mapping
configuration variable to the empty String ('').

LIMITATIONS
------------------------------------------------------------------------------

- Because the algorithm used for ]T has to sequentially inspect every
  character's highlight groups, movement (especially when there's no
  additional match and the search continues to the buffer's border or wraps
  around) can be noticeably slow.

### CONTRIBUTING

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-TaskMotions/issues or email (address below).

HISTORY
------------------------------------------------------------------------------

##### 1.10    RELEASEME
- ENH: Add alternative ]T mappings that use the Todo highlight group instead
  of a regular expression pattern to locate Todos.

##### 1.01    16-Oct-2012
- Wrap around search when 'wrapscan' is set.
This requires CountJump version 1.81.

##### 1.00    28-Mar-2012
- First published version.

##### 0.01    19-Mar-2012
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2012-2022 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
