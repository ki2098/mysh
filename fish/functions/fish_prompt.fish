function fish_prompt --description 'Write out the prompt'
        set -l last_pipestatus $pipestatus
        set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
        set -l normal (set_color normal)
        set -q fish_color_status
        or set -g fish_color_status red

        # Emphasize the main part of the prompt
        set -U fish_color_host green --bold
        set -U fish_color_user green --bold
        set -g fish_color_cwd --bold

        # Since we display the prompt on a new line allow the directory names to be longer.
        set -q fish_prompt_pwd_dir_length
        or set -lx fish_prompt_pwd_dir_length 0

        # Set git prompt styles
        set -q __fish_git_prompt_showcolorhints
        or set -g __fish_git_prompt_showcolorhints 1
        set -q __fish_git_prompt_showdirtystate
        or set -g __fish_git_prompt_showdirtystate 1
        # set -q __fish_git_prompt_color_untrackedfiles
        # or set -g __fish_git_prompt_color_untrackedfiles red
        set -q __fish_git_prompt_showuntrackedfiles
        or set -g __fish_git_prompt_showuntrackedfiles 1
        # set -q __fish_git_prompt_color_branch_dirty
        # or set -g __fish_git_prompt_color_branch_dirty red
    
        # Color the prompt differently when we're root
        set -l color_cwd $fish_color_cwd --bold
        set -l suffix '>'
        if functions -q fish_is_root_user; and fish_is_root_user
                if set -q fish_color_cwd_root
                        set color_cwd $fish_color_cwd_root
                end
                set suffix '#'
        end
    
        # Write pipestatus
        # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
        set -l bold_flag --bold
        set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
        if test $__fish_prompt_status_generation = $status_generation
                set bold_flag
        end
        set __fish_prompt_status_generation $status_generation
        set -l status_color (set_color $fish_color_status)
        set -l statusb_color (set_color $bold_flag $fish_color_status)
        set -l prompt_status (__fish_print_pipestatus "" "" "|" "$status_color" "$statusb_color" $last_pipestatus)
    
        echo -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status
        echo -n -s $suffix " "
end
