# To get autocompletion functionality
# run: dirtree completion >> ~/.bashrc
# Or, dirtree completion > /usr/local/etc/bash_completion.d/dirtree
#!/usr/bin/env bash

_dirtree_completions()
{
    local cur prev

    cur=${COMP_WORDS[COMP_CWORD]}
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    COMPREPLY=() 
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
        return
    fi
    case "$cur" in
        -*)
        COMPREPLY=( $( compgen -W '-v -h -l -s -o -t \
                               --version --help --local \
                               --screenshot --output --template' -- $cur ) )                           
        ;;
    esac

    if [[ ${prev} == -t ]] || [[ ${prev} == --template ]]; then
        COMPREPLY=( $( compgen -W 'circles flame tree treemap' -- $cur ) )
    fi

    return 0
}

complete -F _dirtree_completions dirtree
