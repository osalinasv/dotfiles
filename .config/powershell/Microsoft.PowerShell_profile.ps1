[Console]::OutputEncoding = [Text.Encoding]::UTF8

Set-Variable MaximumHistoryCount 8192

if (Get-Command eza -ErrorAction SilentlyContinue) {
  function _run_eza {
    eza --icons=always $args
  }

  Set-Alias ls _run_eza
}

if (Get-Command bat -ErrorAction SilentlyContinue) {
  $Env:BAT_STYLE = "plain,numbers"

  Set-Alias cat bat
}

Set-Alias g git
Set-Alias gg lazygit
Set-Alias v nvim
Set-Alias vim nvim
Set-Alias d docker
Set-Alias dd lazydocker
Set-Alias dc docker-compose
Set-Alias k kubectl
Set-Alias kk k9s
Set-Alias dn dotnet

function git-cleanup {
  git clean -dfx .
  git restore .
}

function git-tidy {
  param (
    [int]$commits = 1
  )

  git rebase -i HEAD~$commits
}

function git-log {
  git log --graph --oneline --abbrev-commit $args
}

function git-commit {
  param (
    [Parameter(Mandatory=$true)]
    [string]$message
  )

  git add .
  git commit -m $message
}

function git-amend {
  git add .
  git commit --amend --no-edit
}

function git-stash {
  param (
    [Parameter(Mandatory=$false)]
    [string]$message = "TEMP"
  )

  git stash push -u -m "$(Get-Date -Format "yyyy/MM/dd HH:mm"): $message"
}

function git-rebase {
  param (
    [Parameter(Mandatory=$true)]
    [string]$branch
  )

  $currentBranch = git branch --show-current
  $hasChanges = git status --porcelain

  $stashed = $false
  $canPop = $false

  try {
    if ($hasChanges) {
      git-stash "Auto-stash before rebase of $currentBranch onto $branch"

      if ($LASTEXITCODE -ne 0) {
        throw "Failed to stash before rebase"
      }

      $stashed = $true
      $canPop = $true
    }

    git fetch origin

    if ($LASTEXITCODE -ne 0) {
      throw "Failed to fetch branches"
    }

    git switch $branch

    if ($LASTEXITCODE -ne 0) {
      throw "Failed to switch to $branch"
    }

    $canPop = $false
    git pull --ff-only

    if ($LASTEXITCODE -ne 0) {
      throw "Failed to pull $branch"
    }

    git switch $currentBranch

    if ($LASTEXITCODE -ne 0) {
      throw "Failed to switch back to $currentBranch"
    }

    $canPop = $true
    git rebase $branch

    if ($LASTEXITCODE -ne 0) {
      $canPop = $false
      throw "Failed to rebase $currentBranch onto $branch"
    }
  } catch {
    Write-Host "git-rebase: $_" -ForegroundColor DarkRed
  } finally {
    if ($stashed -and $canPop) {
      git stash pop
    } elseif ($stashed) {
      Write-Host "git-rebase: Auto-stash remains pending due to error" -ForegroundColor DarkYellow
    }
  }
}

try {
  Import-Module git-aliases -DisableNameChecking
} finally {}

try {
  Invoke-Expression (&starship init powershell)
} finally {}

try {
  Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })
} finally {}

