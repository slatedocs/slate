#!/usr/bin/env bash
widdershins --search false --language_tabs 'shell:curl' 'javascript--nodejs:Node.JS' --summary ../kudos-client-api/api/swagger/swagger.yaml  -o source/swagger.md
