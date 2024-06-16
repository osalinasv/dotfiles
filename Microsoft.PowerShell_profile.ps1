[Console]::OutputEncoding = [Text.Encoding]::UTF8

Set-Variable MaximumHistoryCount 8192

try {
  oh-my-posh init pwsh --config "$HOME\Code\dotfiles\theme.omp.json" | Invoke-Expression
  Import-Module git-aliases -DisableNameChecking
} finally {}

Set-Alias c cd
Set-Alias l ls
Set-Alias cl clear

Set-Alias g git
Set-Alias gg lazygit

Set-Alias v nvim
Set-Alias vim nvim

$Env:BAT_STYLE = "plain,numbers"
Set-Alias cat bat

function ** {
  fzf --preview="bat --style=plain,numbers --color=always {}" --border=rounded $args
}

function la {
  Get-ChildItem -Force $args
}

try {
  Invoke-Expression (& { (zoxide init powershell | Out-String) })
} finally {}

