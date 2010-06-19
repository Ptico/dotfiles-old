#!/usr/bin/ruby
begin
  require 'rubygems'
rescue LoadError => err
  warn "Couldn't load rubygems: #{err}"
end

rvm_ruby_string = ENV["rvm_ruby_string"] || "#{RUBY_ENGINE rescue 'ruby'}-#{RUBY_VERSION}-#{(RUBY_PATCHLEVEL) ? "p#{RUBY_PATCHLEVEL}" : "r#{RUBY_REVISION}"}"
IRB.conf[:PROMPT][:DOTFILES] = {
  # Do not use coloring for prompts because of weird bug in cursor positioning in IRB.
  # \001 and \002 are special characters prcessed by readline, so the substring between them
  # will not be counted in prompt length calculation.
  # http://www.tek-tips.com/viewthread.cfm?qid=1560209&page=20
  :PROMPT_I => "\001\e[90m\002#{rvm_ruby_string}\001\e[0m\002\001\e[0;36m\002 >> \001\e[0m\002",
  :PROMPT_S => "\001\e[90m\002#{rvm_ruby_string}\001\e[0m\002\001\e[0;32m\002%l>> \001\e[0m\002",
  :PROMPT_C => "\001\e[90m\002#{rvm_ruby_string}\001\e[0m\002\001\e[0;36m\002 .. \001\e[0m\002",
  :PROMPT_N => "\001\e[90m\002#{rvm_ruby_string}\001\e[0m\002\001\e[0;36m\002?.. \001\e[0m\002",
  :RETURN   => "\e[1;31m\342\206\222\e[0m %s\n"
}
if Readline::VERSION == 'EditLine wrapper'
  puts "\e[31mWARNING\e[0m: You ruby built with \e[35meditline\e[0m, instead of \e[35mreadline\e[0m, so it does not support" +
    "Unicode and ANSI chars in prompt.\n" +
    "Please re-build your Ruby with readline support (see http://bit.ly/dxQmvQ for details):
    \e[90mrvm install ree -C --with-readline-dir=/opt/homebrew/Cellar/readline/6.0\e[0m"
  IRB.conf[:PROMPT][:DOTFILES].each do |k, v|
    IRB.conf[:PROMPT][:DOTFILES][k] = v.gsub(%r{\001[^\002]*\002}, '')
  end
end
IRB.conf[:PROMPT_MODE] = :DOTFILES

require 'irb/ext/save-history'
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

begin
  require 'pp'
rescue LoadError => err
  warn "Couldn't load Pretty Print: #{err}"
end

begin
  require "ap"
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
rescue LoadError
  warn "Couldn't load Awesome Print: gem install awesome_print"
end

begin
  require 'looksee/shortcuts'
rescue LoadError
  warn "Couldn't load Looksee: gem install looksee"
end

begin
  require 'bond'
  Bond.start
rescue
  warn "Couldn't load Bond: gem install bond"
end

if ENV['RAILS_ENV']
  begin
    require 'hirb'
    Hirb.enable
  rescue LoadError
    warn "Couldn't load Hirb: gem install hirb"
  end

  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end
end