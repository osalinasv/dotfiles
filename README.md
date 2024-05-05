## Dependencies

- [Scoop](https://scoop.sh/)
- [Chocolatey](https://chocolatey.org/)
- [Dotnet SDK](https://dotnet.microsoft.com/en-us/download)

```ps1
# Enable executing remote scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Install Packages and Tools

```ps1
# Terminal modules
scoop install oh-my-posh git-aliases

# Development packages
scoop install git zoxide neovim lazygit 7zip

# CLI tools for search and compile
scoop install bat fd fzf less mingw ripgrep

# Language runtimes
scoop install bun go rustup

# Csharp language server
dotnet tool install --global csharp-ls

# Csharp repl sandbox
dotnet tool install --global csharprepl
```

# Symlink Configurations

```ps1
# Powershell
if (Test-Path -Path $PROFILE.CurrentUserCurrentHost) {
  Remove-Item -Path $PROFILE.CurrentUserCurrentHost
}

New-Item -Path $PROFILE.CurrentUserCurrentHost -Value "$HOME\Code\dotfiles\Microsoft.PowerShell_profile.ps1" -ItemType SymbolicLink
```

```ps1
# Neovim
$NVIM = "$HOME\AppData\Local\nvim"

if (Test-Path -Path $NVIM) {
  Move-Item -Path $NVIM -Destination "$NVIM.bak"
  Move-Item -Path "$NVIM-data" -Destination "$NVIM-data.bak" -ErrorAction SilentlyContinue
}

New-Item -Path $NVIM -Value "$HOME\Code\dotfiles\.config\nvim" -ItemType SymbolicLink
```

```ps1
$LAZYGIT = "$HOME\AppData\Roaming\lazygit\config.yml"

if (Test-Path -Path $LAZYGIT) {
  Remove-Item -Path $LAZYGIT
}

New-Item -Path $LAZYGIT -Value "$HOME\Code\dotfiles\.config\lazygit\config.yml" -ItemType SymbolicLink
```

```ps1
# Windows Terminal
$WINTERM = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

if (Test-Path -Path $WINTERM) {
  Remove-Item -Path $WINTERM
}

New-Item -Path $WINTERM -Value "$HOME\Code\dotfiles\.config\terminal\settings.json" -ItemType SymbolicLink
```
