if status is-interactive
    # Commands to run in interactive sessions can go here
	if type -q nodenv
		source (nodenv init - | psub)
	end
	if type -q pyenv
		source (pyenv init -| psub)
	end
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
status is-interactive && starship init fish | source
if type -q thefuck
	thefuck --alias | source
end
