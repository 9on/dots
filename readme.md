# (Don't) README.md
This readme is not meant to be read

## Links útiles para configs
* [Información][dotfiles management] simpática sobre dots management.

[dotfiles management]: http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/

## vim
1. Compilamos[*][Install to custom location]:

    ```bash
    git clone https://github.com/neovim/neovim
    cd neovim
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/.neovim"
    ```

2. Instalamos:

    ```bash
    make install
    ln -s $HOME/.nevim/bin/nvim $HOME/.local/bin/
    ```

3. Configuramos[*][nvim from vim]:

    ```bash
    git clone https://github.com/9on/dots.git $HOME/.dots
    ln -s $HOME/.dots/vim $HOME/.vimrc
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s $HOME/.vim $XDG_CONFIG_HOME/nvim
    ln -s $HOME/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
    ```

4. Colores

    ```bash
    mkdir $HOME/.vim/colors
    curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >  $HOME/.vim/colors/molokai.vim
    ```

5. Plugins[*][vim plug installation]
    ```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

[Install to custom location]:https://github.com/neovim/neovim/wiki/Installing-Neovim#install-to-custom-location
[nvim from vim]:https://neovim.io/doc/user/nvim_from_vim.html
[vim plug installation]:https://github.com/junegunn/vim-plug#installation

