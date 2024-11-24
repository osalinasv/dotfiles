[Console]::OutputEncoding = [Text.Encoding]::UTF8

$Env:BAT_STYLE = "plain,numbers"
#$Env:BAT_THEME = "tokyonight_night"

Set-Variable MaximumHistoryCount 8192

if (Get-Command eza -ErrorAction SilentlyContinue) {
  Set-Alias ls eza
}

if (Get-Command bat -ErrorAction SilentlyContinue) {
  Set-Alias cat bat
}

Set-Alias g git
Set-Alias gg lazygit

Set-Alias vim nvim

function ** {
  fzf --preview="bat --style=plain,numbers --color=always {}" --border=rounded $args
}

try {
  Import-Module git-aliases -DisableNameChecking

  Invoke-Expression (& { (zoxide init powershell | Out-String) })
  Set-Alias cd z -Option AllScope

  Invoke-Expression (&starship init powershell)
} finally {}

