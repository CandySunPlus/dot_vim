dot_vim
=======

my vim config

## 依赖

    Vim 8.0+ with Python3

## 安装

1. 安装 vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. 克隆这个项目到任意位置
3. 运行目录中的 install.sh
4. 如果只想用最简模式，可以直接建立 vim_tiny_rc 到 ~/.vimrc 的软链接
5. 打开 vim，运行 :PlugInstall
