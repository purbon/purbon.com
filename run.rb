#!/usr/bin/env ruby

dir = File.expand_path(File.dirname(__FILE__))

if (ARGV.count > 3)
  puts "usage run.rb [environment] {command=start} [mode]"
  exit(1);
end

env   = ARGV[0] || 'development'
order = ARGV[1] || 'start'
mode  = ARGV[2] || 'f'

if (order == 'start' )   
  cmd = "cd #{dir}; export RAKE_ENV=#{env}; export RAILS_ENV=#{env}; unicorn_rails -c config/unicorn.rb"
  if (mode != 'f')
    cmd += " -D"
  end
  puts "Running kirchoff under env=#{env}"
else
  pid = `cd #{dir};     cat tmp/pids/unicorn.pid`
  cmd = "cd #{dir}; kill -9 #{pid}"
end

puts "cmd=#{cmd}"
result = %x[#{cmd}]
puts result
