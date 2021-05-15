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

platform_ui_docs_gen:
	node ../widdershins/widdershins.js -e pui_widdershins_config.json --summary defs/ui_hooks_oas.yaml -o source/includes/ui-hooks-reference/_index.html.md

docs_gen:
	node ../widdershins/widdershins.js -e widdershins_config.json --summary defs/asana_oas.yaml -o source/includes/api-reference/_index.html.md
	node pull_code_samples.js
	node pull_forum_updates.js

serve:
	bundle exec middleman server

build:
	bundle exec middleman build

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
full_openapi_sync: library_prs docs_gen serve

platform_ui: platform_ui_docs_gen

.DEFAULT_GOAL := latest
