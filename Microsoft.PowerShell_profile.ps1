[Console]::OutputEncoding = [Text.Encoding]::UTF8

try {
  # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/half-life.omp.json" | Invoke-Expression
  oh-my-posh init pwsh --config "$HOME\Code\dotfiles\theme.omp.json" | Invoke-Expression

  Import-Module git-aliases -DisableNameChecking
  Import-Module DirColors
} finally {}

# Path Aliases
$global:NVIM = "$HOME\AppData\Local\nvim"

# Aliases
Set-Alias g git
Set-Alias v nvim

# Function Aliases
function la { ls -force $args }

# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

