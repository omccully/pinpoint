# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'stop rails'
task :stop do
  pid_file = 'tmp/pids/server.pid'
  pid = File.read(pid_file).to_i
  Process.kill 9, pid
  File.delete pid_file
end

desc 'start rails'
task :start do
  system 'rails s -d -p 80 --binding=0.0.0.0'
end

