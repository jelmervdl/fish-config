# Defined in - @ line 1
function csd3 --description 'alias csd3 ssh csd3 -t tmux -CC attach'
	ssh csd3 -t tmux -CC attach $argv;
end
