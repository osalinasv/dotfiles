## Dependencies

- [Scoop](https://scoop.sh/)
- [Dotnet SDK](https://dotnet.microsoft.com/en-us/download)

```ps1
# Enable executing remote scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Install Packages and Tools

```ps1
# Terminal modules
scoop install oh-my-posh git-aliases

# Development packages
scoop install git zoxide neovim lazygit 7zip

# CLI tools for search and compile
scoop install bat fd fzf less mingw ripgrep

# Language runtimes
scoop install bun go rustup

# Csharp language server
dotnet tool install --global csharp-ls

# Csharp repl sandbox
dotnet tool install --global csharprepl
```
