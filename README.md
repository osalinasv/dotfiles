```ps1
choco install nvim fd fzf make mingw ripgrep
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1

new-item -path C:\Users\<user>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -itemtype SymbolicLink -value C:\Users\<user>\Code\dotfiles\Microsoft.PowerShell_profile.ps1

new-item -path C:\Users\<user>\AppData\Local\nvim\lua\custom -itemtype SymbolicLink -value C:\Users\<user>\Code\dotfiles\nvim
```
