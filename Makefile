.PHONY: deploy
deploy:
	@echo "====> deploying to github"
	git worktree add ./tmp/book gh-pages
	mdbook build ./expo/
	rm -rf ./tmp/book/*
	cp -rp ./expo/book/* ./tmp/book/
	cd ./tmp/book && \
		git add -A && \
		git commit -m "deployed on $(shell date) by ${USER}" && \
		git push origin gh-pages
	rm -rf ./tmp
	git worktree prune