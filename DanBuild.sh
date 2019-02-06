#!/usr/bin/env bash
old_index="Built_API_Docs.html"

old_line_count=`wc --lines < $old_index`

start_line_from_old=$(expr `grep -n -m 1 "<link href=\"./assets/" $old_index | \
    cut --fields 1 --delimiter  ":"` - 1)

end_line_from_old=`grep -n -m 1 "</head>" $old_index | \
    cut --fields 1 --delimiter  ":"`

function custom_part {
  tail -n `expr $old_line_count - $start_line_from_old` $old_index | \
    head -n `expr $end_line_from_old - $start_line_from_old`
}


bundle exec middleman build --clean

built="build/index.html"
built_line_count=`wc --lines < $built`
built_to_index=$(expr `grep -n -m 1 "<link href=\"stylesheets/" $built | \
    cut --fields 1 --delimiter  ":"` - 1)
built_from_index=$(expr `grep -n -m 1 "<body" $built | \
    cut --fields 1 --delimiter  ":"` - 2)

head -n $built_to_index $built > new.html
custom_part >> new.html
tail -n `expr $built_line_count - $built_from_index` $built >> new.html
sed -i 's#images/#./assets/images/#' new.html 

mv new.html Built_API_Docs.html

if test `git ls-files -m | grep Built_API_Docs.html`; then
    echo "There's been changes since last time, you should probably commit"
else
    echo "There's been no changes since last time"
fi
