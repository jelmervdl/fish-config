function a2ensite --description "Enable a vhost from sites-available" --argument-names vhost
	if [ (count $argv) -lt 1 ]
		return 1
	end
	set -l vhost $argv[1]
	command sudo ln -s /etc/apache2/sites-available/$vhost.conf /etc/apache2/sites-enabled/
	command sudo apachectl -t
	if [ $status -eq 0 ]
		command sudo apachectl restart
		echo "vhost enabled"
		return 0
	else
		command sudo rm /etc/apache2/sites-enabled/$vhost.conf
		echo "vhost not enabled"
		return 1
	end
end

complete -c a2ensite -f -a '(a2lssite)'
