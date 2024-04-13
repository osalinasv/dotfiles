[Console]::OutputEncoding = [Text.Encoding]::UTF8

try {
  oh-my-posh init pwsh --config "$HOME\Code\dotfiles\theme.omp.json" | Invoke-Expression
  Import-Module git-aliases -DisableNameChecking
} finally {}

# Path Aliases
$global:NVIM = "$HOME\AppData\Local\nvim"

# Aliases
Set-Alias g git
Set-Alias v nvim
Set-Alias l ls
Set-Alias c cd

# Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

