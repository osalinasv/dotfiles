[Console]::OutputEncoding = [Text.Encoding]::UTF8

$Env:BAT_STYLE = "plain,numbers"

Set-Variable MaximumHistoryCount 8192

if (Get-Command eza -ErrorAction SilentlyContinue) {
  function _run_eza {
    eza --icons=always $args
  }

  Set-Alias ls _run_eza
}

if (Get-Command bat -ErrorAction SilentlyContinue) {
  Set-Alias cat bat
}

Set-Alias g git
Set-Alias gg lazygit

Set-Alias vim nvim

function _run_fzf {
  fzf --preview="bat --style=plain,numbers --color=always {}" --border=rounded $args
}

Set-Alias ** _run_fzf

try {
  Import-Module git-aliases -DisableNameChecking

  Invoke-Expression (& { (zoxide init powershell | Out-String) })
  Set-Alias cd z -Option AllScope

  Invoke-Expression (&starship init powershell)
} finally {}

