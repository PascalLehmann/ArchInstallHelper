sudo pacman -S nvim // install nvim

// Preperation for AstroNvim

yay -S getnf // install getnf - Nerd Fonts installer
getnf // to install nerd fonts
sudo pacman -S tree-sitter-cli // Treesitter cli 
sudo pacman -S ripgrep
sudo pacman -S lazygit
sudo pacman -S gdu
sudo pacman -S bottom
sudo pacman -S python
sudo pacman -S nodejs

// for a not new installation
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

// install AstroNvim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim

// Setup
Install LSP
Enter :LspInstall followed by the name of the server you want to install
Example: :LspInstall pyright

Install language parser
Enter :TSInstall followed by the name of the language you want to install
Example: :TSInstall python

Install Debugger
Enter :DapInstall followed by the name of the debugger you want to install
Example: :DapInstall python

Manage plugins
Run :Lazy check (<Leader>pu) to check for plugin updates
Run :Lazy update (<Leader>pU) to apply any pending plugin updates
Run :Lazy sync (<Leader>pS) to update and clean plugins
Run :Lazy clean to remove any disabled or unused plugins

Update Mason packages and plugins
Run :AstroUpdate (<Leader>pa) to update both Neovim plugins and Mason packages

Check AstroNvim version
Run :AstroVersion to display the currently installed AstroNvim version

Reload AstroNvim (EXPERIMENTAL)
Run :AstroReload to reload the AstroNvim configuration and any new user configuration changes without restarting. This is currently an experimental feature and may lead to instability until the next restart.
