_ios_hot_reload_completions()
{
  local cur=${COMP_WORDS[COMP_CWORD]}
  local opts="run update uninstall version -v --version"
  
  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
}

complete -F _ios_hot_reload_completions ios-hot-reload
