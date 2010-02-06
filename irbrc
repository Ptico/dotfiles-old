#!/usr/bin/ruby
require 'irb/completion'

require 'rubygems'

begin
  require 'wirble'

  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

begin
  load "#{ENV['HOME']}/.railsrc" if ENV['RAILS_ENV']
rescue LoadError
end