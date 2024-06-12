[Console]::OutputEncoding = [Text.Encoding]::UTF8

Set-Variable MaximumHistoryCount 8192
#Set-PSReadLineOption -PredictionViewStyle ListView

try {
  oh-my-posh init pwsh --config "$HOME\Code\dotfiles\theme.omp.json" | Invoke-Expression
  Import-Module git-aliases -DisableNameChecking
} finally {}

# Aliases
Set-Alias g git
Set-Alias l ls
Set-Alias v nvim
Set-Alias vim nvim

# Zoxide
try {
  Invoke-Expression (& { (zoxide init powershell | Out-String) })
} finally {}

