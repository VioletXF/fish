if status is-interactive
    # Commands to run in interactive sessions can go here
	if type -q nodenv
		source (nodenv init - | psub)
	end
	if type -q pyenv
		source (pyenv init -| psub)
	end
	if type -q thefuck
		thefuck --alias | source
	end
	if type -q starship
		starship init fish | source
	end

	test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
end


