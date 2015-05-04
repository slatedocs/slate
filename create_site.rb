#!/usr/bin ruby

require 'open3'

WORKSPACE_DIR = '..'

def run(command)
  puts command
  stdin, stdout, stderr = Open3.popen3(command)
  out = stdout.readlines
  puts out
  err = stderr.readlines
  puts err
  [out.to_s, err.to_s]
end

def main
  run("rake build")
  run("rm -rf public/images")
  run("rm -rf public/fonts")
  run("rm -rf public/javascripts")
  run("rm -rf public/stylesheets")
  run("rm public/*")
  run("mv build/* public/")
end

main