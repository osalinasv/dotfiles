# Install dependencies

```ps1
# For Powershell
winget install JanDeDobbeleer.OhMyPosh -s winget

Install-Module git-aliases -Scope CurrentUser -AllowClobber
Install-Module DirColors -Scope CurrentUser

# For NeoVIM
choco install nvim fd fzf make mingw ripgrep omnisharp
```

# Symlink configs

> Remember to replace `usr`  
> Assumes repo was cloned to `C:\Users\usr\Code\dotfiles`

```ps1
# Powershell Profile
New-Item
  -Path C:\Users\usr\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
  -Value C:\Users\usr\Code\dotfiles\Microsoft.PowerShell_profile.ps1
  -ItemType SymbolicLink

# NeoVIM
New-Item
  -Path C:\Users\usr\AppData\Local\nvim
  -Value C:\Users\usr\Code\dotfiles\.config\nvim
  -ItemType SymbolicLink

# Windows Terminal
New-Item
  -Path C:\Users\usr\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
  -Value C:\Users\usr\Code\dotfiles\.config\terminal\settings.json
  -ItemType SymbolicLink
```
