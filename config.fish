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
	else if not set -q DO_NOT_INSTALL_STARSHIP
		read -l -P 'Install starship prompt? [Y/N] ' confirm
		switch $confirm
			case Y y
				if type -q brew
					brew install starship
				else if type -q curl
					curl -sS https://starship.rs/install.sh | sh
					source (status --current-filename)
				else
					echo 'Error: curl not found!' >&2
				end
			case N n ''
				set -Ux DO_NOT_INSTALL_STARSHIP 1
		end
	end

	test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
end


