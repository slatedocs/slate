publish:
	rake build
	git checkout gh-pages
	git pull
	rm -rf fonts
	rm -rf javascripts
	rm -rf images
	rm -rf stylesheets
	rm -rf examples
	mv build/* .
	git add fonts
	git add javascripts
	git add images
	git add stylesheets
	git add examples
	git add index.html
	git commit -m "Updating gh-pages"
	git push
	git checkout master