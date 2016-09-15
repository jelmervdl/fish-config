function a2edsite --description 'Edit a vhost from sites-available' --argument vhost
	if [ (count $argv) -lt 1 ]
		return 1
	end


	set -l editor
	if set -q VISUAL
		set editor $VISUAL
	else if set -q EDITOR
		set editor $EDITOR
	end

	# Break editor up to get its first command (i.e. discard flags)
	if test -n "$editor"
		set -l editor_cmd
		eval set editor_cmd $editor
		if not type -q -f "$editor_cmd[1]"
			_ "funced: The value for \$EDITOR '$editor' could not be used because the command '$editor_cmd[1]' could not be found
	"
			set editor fish
		end
	end

	# If no editor is specified, use fish
	if test -z "$editor"
		set editor fish
	end

	eval $editor /etc/apache2/sites-available/$vhost.conf
end

complete -c a2edsite -f -a '(a2lssite)'