function origin -d "open git remote origin in browser"
	open $(git remote get-url origin)
end
