#!/bin/bash

case "$1" in
    
    develop)
        bundle exec middleman server
        ;;
    build)
        bundle exec middleman build --clean
        ;;
    *)
        echo "Usage: doc.sh {develop|build}" >&2
        exit 1
        ;;
esac

exit 0
