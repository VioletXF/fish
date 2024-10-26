if status is-interactive
    # Commands to run in interactive sessions can go here
  if test -e ~/secrets.fish
    source ~/secrets.fish
  end
  if type -q fcitx5
    daemonize -e /tmp/fcitx5.log -o /tmp/fcitx5.log -p /tmp/fcitx5.pid -l /tmp/fcitx5.pid -a /usr/bin/fcitx5 --disable=wayland
  end
  # if type -q nvm
  #   load_nvm > /dev/stderr
  # end
	# if type -q nodenv
 #    source (nodenv init - | psub)
	# end
	# if type -q pyenv
 #    pyenv init - | source
	# end
	# if type -q thefuck
	# 	thefuck --alias | source
	# end
  # if type -q rbenv
  #   rbenv init - | source
  # end
  # if type -q jenv
  #   jenv init - | source
  # end
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
  export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed
  test -e {$HOME}/.asdf/asdf.sh; and source {$HOME}/.asdf/asdf.fish


  test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
end

## opam configuration
# source /Users/xf/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
