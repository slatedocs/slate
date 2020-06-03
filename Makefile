code_generation:
	make -C ../swagger-codegen

widdershins:
	node ../widdershins/widdershins.js -e widdershins_config.json --summary defs/asana_oas.yaml -o source/includes/api-reference/_index.html.md
	node pull_code_samples.js

serve:
	bundle exec middleman server

update:
	cd ../widdershins && git checkout master && git pull
	cd ../swagger-parser && git checkout rossgrambo-2.0.17-with-data-wrapper && git pull && mvn clean package && mvn install:install-file -Dfile=modules/swagger-parser-v3/target/swagger-parser-v3-2.0.17.jar -DpomFile=modules/swagger-parser-v3/pom.xml
	cd ../swagger-codegen-generators && git checkout rossgrambo-1.0.15-asana-configs && git pull && mvn clean package && mvn install:install-file -Dfile=target/swagger-codegen-generators-1.0.15.jar -DpomFile=pom.xml
	cd ../swagger-codegen && git checkout v.3.0.15 && mvn clean package
	cd ../client_libraries/node-asana && git checkout master && git pull
	cd ../client_libraries/php-asana && git checkout master && git pull
	cd ../client_libraries/java-asana && git checkout master && git pull
	cd ../client_libraries/ruby-asana && git checkout master && git pull
	cd ../client_libraries/python-asana && git checkout master && git pull

# Generate Libraries, Generate Docs, Pull Samples into Docs, and Serve
local: code_generation widdershins serve

# Pull Latest Libraries, Generate Docs, Pull Samples into Docs, and Serve
latest: update widdershins serve

.DEFAULT_GOAL := latest
