function a2lssite
	set -l folder 'sites-available'
	if [ (count $argv) -eq 1 ]
		if [ $argv[1] -eq '--enabled' ]
			set folder 'sites-enabled'
		else
			echo "Usage: a2lssite [--enabled]"
			return 1
		end
	end
	ls /etc/apache2/$folder/*.conf | sed 's/.conf$//' | sed 's/.*\///'
end