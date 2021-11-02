java_version_bump:
	node increment_version.js java

node_version_bump:
	node increment_version.js node

php_version_bump:
	node increment_version.js php

ruby_version_bump:
	node increment_version.js ruby

python_version_bump:
	node increment_version.js python

java_gen:
	cd ../client_libraries/java-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-java -c swagger_templates/java-config.json -Dapis

node_gen:
	cd ../client_libraries/node-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-node -c swagger_templates/node-config.json -Dapis

php_gen:
	cd ../client_libraries/php-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-php -c swagger_templates/php-config.json -Dapis

ruby_gen:
	cd ../client_libraries/ruby-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-ruby -c swagger_templates/ruby-config.json -Dapis

python_gen:
	cd ../client_libraries/python-asana && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-python -c swagger_templates/python-config.json -Dapis

api_explorer_gen:
	cd ../client_libraries/api-explorer && java -jar ../../swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../../developer-docs/defs/asana_oas.yaml -l asana-api-explorer -c swagger_templates/api-explorer-config.json -Dapis

code_gen: java_gen node_gen php_gen ruby_gen python_gen

app_components_docs_gen:
	node ../widdershins/widdershins.js -e pui_widdershins_config.json --summary defs/app_components_oas.yaml -o source/includes/ui-hooks-reference/_index.html.md

# Only bring over spec from codez
# Internal Asanas: See https://app.asana.com/0/0/1200652548580470/f before running
build_spec:
	python $$OPENAPI_DIR/build.py && cp $$OPENAPI_DIR/dist/public_asana_oas.yaml ./defs/asana_oas.yaml && cp $$OPENAPI_DIR/app_components_oas.yaml ./defs/app_components_oas.yaml

docs_gen: build_spec docs_gen_all

docs_gen_all:
	node ../widdershins/widdershins.js -e widdershins_config.json --summary defs/asana_oas.yaml -o source/includes/api-reference/_index.html.md
	node pull_code_samples.js
	node pull_forum_updates.js

serve:
	exec bundle exec middleman serve --watcher-force-polling

build:
	bundle exec middleman build --clean

first_time_setup:
	cd .. && git clone git@github.com:rossgrambo/widdershins.git
	cd .. && mkdir swagger_forks && cd swagger_forks && git clone git@github.com:rossgrambo/swagger-parser.git && git clone git@github.com:rossgrambo/swagger-codegen-generators.git
	cd .. && git clone git@github.com:swagger-api/swagger-codegen.git
	cd .. && mkdir client_libraries && cd client_libraries && git clone git@github.com:Asana/node-asana.git && git clone git@github.com:Asana/php-asana.git && git clone git@github.com:Asana/java-asana.git && git clone git@github.com:Asana/ruby-asana.git && git clone git@github.com:Asana/python-asana.git

update:
	cd ../widdershins && git checkout master && git pull && npm install
	cd ../swagger_forks/swagger-parser && git checkout rossgrambo-2.0.17-with-data-wrapper && git pull && mvn clean package && mvn install:install-file -Dfile=modules/swagger-parser-v3/target/swagger-parser-v3-2.0.17.jar -DpomFile=modules/swagger-parser-v3/pom.xml
	cd ../swagger_forks/swagger-codegen-generators && git checkout rossgrambo-1.0.15-asana-configs && git pull && mvn clean package && mvn install:install-file -Dfile=target/swagger-codegen-generators-1.0.15.jar -DpomFile=pom.xml
	cd ../swagger-codegen && git checkout v3.0.15 && mvn clean package
	cd ../client_libraries/node-asana && git checkout master && git pull
	cd ../client_libraries/php-asana && git checkout master && git pull
	cd ../client_libraries/java-asana && git checkout master && git pull
	cd ../client_libraries/ruby-asana && git checkout master && git pull
	cd ../client_libraries/python-asana && git checkout master && git pull

define library_pr
	cd ../client_libraries/$(1)-asana && git checkout master && git branch -D openapi-sync; git push origin --delete openapi-sync; git checkout -b openapi-sync && cd ../../developer-docs && $(MAKE) $(1)_gen && $(MAKE) $(1)_version_bump && cd ../client_libraries/$(1)-asana && git add . && git commit -m "Generated from OpenAPI"; git push --set-upstream origin openapi-sync && open https://github.com/Asana/$(1)-asana/compare/openapi-sync
endef

node_pr:
	$(call library_pr,node)

python_pr:
	$(call library_pr,python)

php_pr:
	$(call library_pr,php)

ruby_pr:
	$(call library_pr,ruby)

java_pr:
	$(call library_pr,java)

api_explorer_pr:
	cd ../client_libraries/api-explorer && git checkout master && git branch -D openapi-sync; git push origin --delete openapi-sync; git checkout -b openapi-sync && cd ../../developer-docs && $(MAKE) api_explorer_gen && cd ../client_libraries/api-explorer && git add . && git commit -m "Generated from OpenAPI"; git push --set-upstream origin openapi-sync && open https://github.com/Asana/api-explorer/compare/openapi-sync

library_prs: node_pr python_pr php_pr ruby_pr java_pr

# Generate Libraries, Generate Docs, Pull Samples into Docs, and Serve
local: code_gen docs_gen serve

# Pull Latest Libraries, Generate Docs, Pull Samples into Docs, and Serve
latest: update docs_gen serve

# Do everything to sync the openapi spec
full_openapi_sync: library_prs api_explorer_pr docs_gen app_components serve

app_components: app_components_docs_gen

.DEFAULT_GOAL := full_openapi_sync