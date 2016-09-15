function a2disite --description "Disable a vhost from sites-available" --argument-names vhost
	if [ (count $argv) -lt 1 ]
		return 1
	end
	set -l vhost $argv[1]
	command sudo rm /etc/apache2/sites-enabled/$vhost.conf
	command sudo apachectl restart
	echo "vhost disabled"
	return 0
end

complete -c a2disite -f -a '(a2lssite)'