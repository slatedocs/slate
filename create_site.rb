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
  run("rm -rf build")
  run("rake build")
  
  run("cp -r build/javascripts/ ../PublicWebsite/javascripts")
  run("cp source/javascripts/lib/GA.js ../PublicWebsite/javascripts/lib/")
  run("cp -r build/fonts/ ../PublicWebsite/fonts/")
  run("cp -r build/stylesheets/ ../PublicWebsite/stylesheets/")
  run("cp build/index.html ../PublicWebsite/docs.html")
end

main