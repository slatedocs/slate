
rm -rf build mjml mjml-doc || true &&

echo 'Cloning the repos'
git clone https://github.com/mjmlio/mjml mjml &&
cd mjml && git checkout next && cd .. &&
rm -rf source/index.html.md &&


echo 'Building documentation...' &&
npm install &&
npm run concat-docs-md &&

mv js/CONTENT.md source/index.html.md &&

bundle install &&
bundle exec middleman build &&
mv build ./mjml-doc &&
rm -rf mjml node_modules &&
echo 'Everything has been done master'
