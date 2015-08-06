publish:
	rake build
	git checkout gh-pages
	rm -rf fonts
	rm -rf javascripts
	rm -rf images
	rm -rf stylesheets
	mv build/* .
	git add fonts
	git add javascripts
	git add images
	git add stylesheets
	git add index.html
	git commit -m "Updating gh-pages"
	git push
	git checkout master