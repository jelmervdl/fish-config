function fish_prompt
	
  if not set -q -g __fish_robbyrussell_functions_defined
    set -g __fish_robbyrussell_functions_defined
    function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end
	
    function _is_git_dirty
      echo (git status -s -uno --ignore-submodules=dirty ^/dev/null)
    end
  end

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    if [ (_is_git_dirty) ]
      set git_dirty "$yellow✗"
    end
    
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue (git:$git_branch$git_dirty$blue)"
  end

  if set -q VIRTUAL_ENV
    set -l env_name $red(basename "$VIRTUAL_ENV")
    set env_info "$blue (env:$env_name$blue)"
  end

  echo -n -s $arrow ' '$cwd $git_info $env_info $normal ' '
end
