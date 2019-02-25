# Affinity API Docs

Affinity's API docs uses the formatting and build system from [lord/slate].

## Prerequisites

Make sure Ruby is installed. Instead of the system Ruby, you may want to use
[rbenv] or Homebrew Ruby (`brew install ruby`).

After Ruby is set up, run:\
`$ gem install bundler && bundle install`

## Editing and testing locally

For editing help, see [Slate markdown].

Start the development server:\
`$ bundle exec middleman server`\
Visit <http://localhost:4567/> to check the result.

## Building and deploying

Build the site into static files in `build/`:\
`$ bundle exec middleman build --clean`

Serve the static files in `build/`:\
`$ bash -c 'cd build && ruby -run -e httpd . -p 4567'`\
Visit <http://localhost:4567/> to check the result.

Build and deploy the site by pushing to the `gh-pages` branch:\
`$ ./deploy.sh`

<!-- Links -->
[lord/slate]: https://github.com/lord/slate
[rbenv]: https://github.com/rbenv/rbenv
[Slate markdown]: https://github.com/lord/slate/wiki/Markdown-Syntax
