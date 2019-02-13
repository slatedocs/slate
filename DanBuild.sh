#!/usr/bin/env bash

# exit on any errors
set -e

old_index="Built_API_Docs.html"

old_line_count=`wc -l < $old_index`

start_line_from_old=$(expr `grep -n -m 1 "<link href=\"./assets/" $old_index | \
    cut -f 1 -d ":"` - 1)

end_line_from_old=`grep -n -m 1 "</head>" $old_index | \
    cut -f 1 -d ":"`

function custom_part {
  tail -n `expr $old_line_count - $start_line_from_old` $old_index | \
    head -n `expr $end_line_from_old - $start_line_from_old`
}


bundle exec middleman build --clean

built="build/index.html"
built_line_count=`wc -l < $built`
built_to_index=$(expr `grep -n -m 1 "<link href=\"stylesheets/" $built | \
    cut -f 1 -d ":"` - 1)
built_from_index=$(expr `grep -n -m 1 "<body" $built | \
    cut -f 1 -d ":"` - 2)

head -n $built_to_index $built > new.html
custom_part >> new.html
tail -n `expr $built_line_count - $built_from_index` $built >> new.html
sed 's#images/#./assets/images/#' new.html > $old_index
rm new.html

if test `git ls-files -m | grep $old_index`; then
    echo "There's been changes since last time, you should probably commit"
else
    echo "There's been no changes since last time"
fi
