# lightline-wtf

lightline-wtf is a [lightline.vim][1] color scheme based on
[Whiskey Tango Focus][2].

![Screenshot](screenshot.png)

## Installation

> **Note**: lightline-wtf depends on the [lightline.vim][1] and [vim-wtf][2]
> plugins, which should be installed first using one of the documented methods.

This plugin is compatible with several popular plugin managers:

### Pathogen

    git clone git://github.com/sstallion/lightline-wtf.git ~/.vim/bundle/lightline-wtf

### Vundle

Add the following to your `.vimrc` and execute the `:PluginInstall` command:

    Plugin 'sstallion/lightline-wtf'

### NeoBundle

Add the following to your `.vimrc` and execute the `:NeoBundleInstall` command:

    NeoBundle 'sstallion/lightline-wtf'

### vim-plug

Add the following to your `.vimrc` and execute the `:PlugInstall` command:

    Plug 'sstallion/lightline-wtf'

## Configuration

To enable this color scheme, simply add the following to your `.vimrc`:

    let g:lightline = {
          \ 'colorscheme': 'wtf',
          \ }

### Vertical Splits

lightline incorrectly calculates the width of the window when a vertical split
is present, which results in improper highlighting (see issue [#179]). To work
around this issue, the following function call should be added to `.vimrc` after
lightline is configured:

    call lightline#colorscheme#wtf#highlight()

A more complete example configuration can be found [here][3].

## Contributing

Pull requests are welcome! If a problem is encountered using this plugin, please
file an issue on [GitHub][4].

## License

Source code in this repository is licensed under a Simplified BSD License. See
[LICENSE] for more details.

[1]: https://github.com/itchyny/lightline.vim
[2]: https://github.com/sstallion/vim-wtf
[3]: https://github.com/sstallion/dotfiles/blob/master/files/vim/after/plugin/lightline.vim
[4]: https://github.com/sstallion/lightline-vim/issues

[LICENSE]: LICENSE

[#179]: https://github.com/itchyny/lightline.vim/issues/179
