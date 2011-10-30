#!/usr/bin/env ruby
require 'rubygems'
require 'daemons'

RAILS_DIR   = File.expand_path(File.join(File.dirname(__FILE__), '..'))
PID_DIR     = File.expand_path(File.join(RAILS_DIR, 'tmp', 'pids'))
LOG_DIR     = File.expand_path(File.join(RAILS_DIR, 'log'))
ENVIRONMENT = File.expand_path(File.join(RAILS_DIR, 'config', 'environment'))

def fail(text)
  puts text
  exit 1
end

klass_name = ARGV.shift

Daemons.run_proc(klass_name,
  :multiple => true,
  :monitor => true,
  :dir_mode => :normal,
  :dir => PID_DIR,
  :log_dir => LOG_DIR,
  :log_output => true,
  :backtrace => false) do

  require ENVIRONMENT

  klass = klass_name.constantize rescue fail("Invalid processor name specified.")
  fail("Specified processor does not respond to .run()") unless klass.respond_to?(:run)

  Dir.chdir(RAILS_DIR)
  klass.run
end
