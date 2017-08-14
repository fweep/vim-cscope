# vim-cscope

Mappings and convenience methods for dealing with cscope files.

This plugin is in its infancy, and (probably better) alternatives exist:

* [vim-utils/vim-cscope](https://github.com/vim-utils/vim-cscope)
* [vim-scripts/cscope-quickfix](https://github.com/vim-scripts/cscope-quickfix)

## Installation

[tpope/vim-pathogen](https://github.com/tpope/vim-pathogen):

    cd ~/.vim/bundle
    git clone https://github.com/fweep/vim-cscope.git

[junegunn/vim-plug](https://github.com/junegunn/vim-plug):

    Plug 'fweep/vim-cscope'

## Options

Change the cscope command (default is `cscope -R -b`):

    let g:cscope_command = 'starscope -e cscope'

Since I only use starscope

Set the path for the cscope file to read (defaults to `cscope.out` in current directory):

    let g:cscope_file = '.git/cscope.out'

Disable the default keymappings (although that's really all this plugin is good for right now):

    let g:cscope_suppress_keymaps = 1

## Usage

### Commands

Regenerate and reload the database (this runs the cscope command as configured):

    :CscopeRebuild

Reload/refresh the current cscope database (e.g. after manually updating the cscope file):

    :CscopeReload

### Bindings

Invoking any of the bindings will search the cscope database, open the quickfix window,
and jump to the first result. Due to a limitation in Vim, there's no way to display the
cscope quickfix window without jumping to the first result (please correct me if I'm wrong).

All bindings are of the form `<Leader>fX`, where `X` is one of the letter arguments to `:cscope find`:

`s`: Find this C symbol
`g`: Find this definition
`d`: Find functions called by this function
`c`: Find functions calling this function
`t`: Find this text string
`e`: Find this egrep pattern
`f`: Find this file
`i`: Find files #including this file
`a`: Find places where this symbol is assigned a value

See `:help cscope-find` for details.

If you want to create your own bindings, they all follow this form:

  nnoremap <Leader>fs :cscope find s <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>

## Author

[Jim Stewart](http://github.com/fweep)

## MIT License

Copyright (C) 2017 Jim Stewart

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
