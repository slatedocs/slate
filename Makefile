code_gen:
	cd ../client_libraries/php-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-php -c swagger_templates/php-config.json -Dapis
	cd ../client_libraries/node-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-node -c swagger_templates/node-config.json -Dapis
	cd ../client_libraries/java-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-java -c swagger_templates/java-config.json -Dapis
	cd ../client_libraries/ruby-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-ruby -c swagger_templates/ruby-config.json -Dapis
	cd ../client_libraries/python-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-python -c swagger_templates/python-config.json -Dapis

docs_gen:
	node ../widdershins/widdershins.js -e widdershins_config.json --summary defs/asana_oas.yaml -o source/includes/api-reference/_index.html.md
	node pull_code_samples.js

serve:
	bundle exec middleman server

update:
	cd ../widdershins && git checkout master && git pull
	cd ../swagger_forks/swagger-parser && git checkout rossgrambo-2.0.17-with-data-wrapper && git pull && mvn clean package && mvn install:install-file -Dfile=modules/swagger-parser-v3/target/swagger-parser-v3-2.0.17.jar -DpomFile=modules/swagger-parser-v3/pom.xml
	cd ../swagger_forks/swagger-codegen-generators && git checkout rossgrambo-1.0.15-asana-configs && git pull && mvn clean package && mvn install:install-file -Dfile=target/swagger-codegen-generators-1.0.15.jar -DpomFile=pom.xml
	cd ../swagger-codegen && git checkout v3.0.15 && mvn clean package
	cd ../client_libraries/node-asana && git checkout master && git pull
	cd ../client_libraries/php-asana && git checkout master && git pull
	cd ../client_libraries/java-asana && git checkout master && git pull
	cd ../client_libraries/ruby-asana && git checkout master && git pull
	cd ../client_libraries/python-asana && git checkout master && git pull

# Generate Libraries, Generate Docs, Pull Samples into Docs, and Serve
local: code_gen docs_gen serve

# Pull Latest Libraries, Generate Docs, Pull Samples into Docs, and Serve
latest: update docs_gen serve

.DEFAULT_GOAL := latest
