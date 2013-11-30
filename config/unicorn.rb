
ROOT = File.expand_path('..', File.dirname(__FILE__))

worker_processes 2
working_directory "#{ROOT}"

preload_app true

timeout 30

listen "#{ROOT}/tmp/sockets/unicorn.sock", :backlog => 64
pid "#{ROOT}/tmp/pids/unicorn.pid"

stderr_path "#{ROOT}/log/unicorn.stderr.log"
stdout_path "#{ROOT}/log/unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
