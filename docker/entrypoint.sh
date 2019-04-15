#!/bin/sh

# Run chalk to load secrets early
_ct=$(mktemp) ;rm -f $_ct ; chalk > $_ct
if [ $(wc -l < $_ct) -eq 1 ]; then
  source $_ct
  rm -f $_ct
  unset _ct
else
  # Sleep so if multiple containers hit rate limit, they won't start at exactly same time again
  _sleep=$((1 + RANDOM % 15))
  echo "Error setting secrets...Sleeping for $_sleep secs and then exiting"
  sleep $_sleep
  exit 1
fi

yarn start
