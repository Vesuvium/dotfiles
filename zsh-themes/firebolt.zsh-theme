function get_folders() {
    if [[ $PWD == $HOME ]]; then
        echo "~";
    else
        echo "${PWD/$HOME/~}" | awk -F '/' '{print $(NF-1)"/"$NF}';
    fi
}


PROMPT='%{$fg[yellow]%}λ %m %{$fg[green]%}$(get_folders) %{$fg[yellow]%}→ $(git_prompt_info)$(hg_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="λ %{$fg[blue]%}git %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%} → %{$reset_color%}"
ZSH_THEME_HG_PROMPT_PREFIX="λ %{$fg[blue]%}hg %{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg[yellow]%} → %{$reset_color%}"

