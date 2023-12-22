[Console]::OutputEncoding = [Text.Encoding]::UTF8

try {
  oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/tokyonight_storm.omp.json" | Invoke-Expression

  Import-Module git-aliases -DisableNameChecking
  Import-Module DirColors
} finally {}

# Path Aliases
$global:NVIM = "$HOME\AppData\Local\nvim"

# Aliases
Set-Alias vim nvim

# Function Aliases
function la() { ls -force }