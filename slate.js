#!/usr/bin/env node

'use strict';

const cp = require('child_process');
const path = require('path');

const sh = require('shelljs');

// path.relative is to work around https://github.com/11ty/eleventy/issues/1100
const env = Object.assign({}, process.env, {
  'SLATEDIR': path.relative(__dirname, process.cwd()).replace(new RegExp('\\' + path.sep, 'g'), '/'),
  'NODE_PATH': path.resolve(__dirname, './node_modules').replace(new RegExp('\\' + path.sep, 'g'), '/')
});

const npm = /^win/.test(process.platform) ? 'npm.cmd' : 'npm';

if (process.argv[2] === 'init') {
  // TODO test for empty directory except dotfiles?
  sh.cp('-R', __dirname+'/source/*', '.');
}
else if (process.argv[2] === 'build') {
  cp.spawn(npm, [ 'run', 'build.local' ], { stdio: 'inherit', cwd: __dirname, env }, function(err, output) {
    if (err) console.warn(err);
    console.log(output);
  });
}
else if (process.argv[2] === 'serve') {
  cp.spawn(npm, [ 'run', 'serve.local' ], { stdio: 'inherit', cwd: __dirname, env }, function(err, output) {
    if (err) console.warn(err);
    console.log(output);
  });
}
else {
  console.warn('Usage: slate [init|build|serve]');
  process.exit(1);
}

