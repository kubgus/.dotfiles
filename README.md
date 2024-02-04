# .dotfiles (how to use)

> ***Note:*** These configurations were made for Kali. Might be different on other distros.

```bash
sudo apt-get update
cd ~/.config
git clone --depth 1 https://github.com/kubgus/.dotfiles
mv .dotfiles/* .
rmdir .dotfiles
```

> ***Note:*** Make sure these folders don't yet exist!

## setting up i3

```bash
sudo apt-get install i3 i3lock x11-xserver-utils dex network-manager
```

> ***Note:*** Install `polybar` and `rofi` separately!

## setting up nvim

```bash
sudo apt-get install ripgrep
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz > nvim-linux64.tar.gz
tar xvzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo mv nvim-linux64 /bin
sudo ln -s /bin/nvim-linux64/bin/nvim /bin/nvim
```

After running the above commands, follow these instructions to complete the setup:

1. Run `nvim .` and ignore the errors
1. Navigate to `./lua/kubgus` and open files one by one, running `:so` each time (if you get an error, skip the file and return to it after completing the rest)
2. Run `:PackerSync` anywhere in the environment
3. Navigate to `./after/plugin` and run the `:so` command in the same fashion as the previous step

## setting up polybar

```bash
sudo apt-get install polybar
```

## setting up rofi

```bash
sudo apt-get install rofi
```