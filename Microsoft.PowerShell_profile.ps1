oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression
Import-Module git-aliases -DisableNameChecking

# Path Aliases
$global:NVIM = "$HOME\AppData\Local\nvim"

# Aliases
Set-Alias vim nvim

# Function Aliases
function la() { ls -force }
