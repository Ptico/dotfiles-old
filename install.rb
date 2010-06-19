#!/usr/bin/env ruby
require "erb"

SKIP = %w{install.rb README goodies}

def install_all
  Dir.chdir File.dirname(__FILE__) do
    dotfiles_dir = Dir.pwd
  
    Dir['*'].each do |file|
      next if (SKIP.include?(file.to_s) or file.to_s == 'gitconfig')

      target_name = ".#{file}"
      target = File.join(ENV['HOME'], target_name)

      if File.exist?(target) and !ARGV.include?('--force')
        puts "Rewrite #{target}? [y/N]:"
        next unless STDIN.gets.strip.to_s.downcase == 'y'
      end

      if ARGV.include?('--symlink')
        `ln -vsf #{File.join(dotfiles_dir, file)} #{target}`
      else
        `cp -r #{File.join(dotfiles_dir, file)} #{target}`
      end

      puts "Installed #{target}"
    end
  end
end

def install_gitconfig
  target = File.join(ENV['HOME'], '.gitconfig')
  if File.exist?(target) && !ARGV.include?('--force')
    puts "Rewrite #{target}? [y/N]:"
    return unless STDIN.gets.strip.to_s.downcase == 'y'
  end
  puts "Your full name:"
  name = STDIN.gets.strip.to_s
  puts "Your email:"
  email = STDIN.gets.strip.to_s
  gitconfig = File.read('gitconfig')
  out = ERB.new(gitconfig)
  File.new(target,  "w+").write(out.result(binding))
end

def remove_files
  Dir.chdir File.dirname(__FILE__) do
    dotfiles_dir = Dir.pwd
  
    Dir['*'].each do |file|
      next if SKIP.include?(file.to_s)
      target_name = ".#{file}"
      target = File.join(ENV['HOME'], target_name)
      next unless File.exist?(target)
      if ARGV.include?('--force')
        `rm -rf #{target}`
      else
        puts "Delete #{target}? [y/N]:"
        if STDIN.gets.strip.to_s.downcase == 'y'
          `rm -rf #{target}`
          puts "Removed #{target}"
        else
          puts "Not removed #{target}"
        end
      end
    end
  end
end

case ARGV.first
  when 'install', 'setup'
    install_all
    install_gitconfig
  when 'remove', 'delete'
    remove_files
  else
   puts <<-EOF
    Usage:
    install, setup        - Install dotfiles in your home directory.
             [--force]    - Rewrite target if exist
             [--symlink]  - Create symlinks instead of copy files
    remove, delete        - Remove dotfiles
             [--force]    - Remove without confirmation for each file
   EOF
end