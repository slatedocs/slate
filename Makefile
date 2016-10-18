
run: 
	bundle exec middleman server

deploy:
	@((echo "Removing pre-existent .war files") && (rm -f *.war)) \
	&& ((echo "Building the project.") && make clean-build) \
	&& ((echo "Compressing into a .war file") && make compress) 
	
clean-build: 
	bundle exec middleman build --clean

compress:
	zip -r -X build_$$(date +"%Y-%m-%d-%H-%M-%S").war build/






