#!/usr/bin/env ruby
# from http://errtheblog.com/posts/89-huba-huba

def install_all
  Dir.chdir File.dirname(__FILE__) do
    dotfiles_dir = Dir.pwd
  
    Dir['*'].each do |file|
      next unless File.extname(file).empty?
      target_name = file == 'bin' ? file : ".#{file}"
      target = File.join(ENV['HOME'], target_name)
      unless File.exist? target
        if ARGV.include?('--copy')
          system %[cp -r #{File.join(dotfiles_dir, file)} #{target}]
        else
          system %[ln -vsf #{File.join(dotfiles_dir, file)} #{target}]
        end
        p "Installed #{target}"
      end
    end
  end
end

def install_linux
  Dir.chdir File.dirname(__FILE__)+'/linux.diff' do
    dotfiles_dir = Dir.pwd
  
    Dir['*'].each do |file|
      next unless File.extname(file).empty?
      target_name = file == 'bin' ? file : ".#{file}"
      target = File.join(ENV['HOME'], target_name)
      unless File.exist? target
        if ARGV.include?('--copy')
          system %[cp -r #{File.join(dotfiles_dir, file)} #{target}]
        else
          system %[ln -vsf #{File.join(dotfiles_dir, file)} #{target}]
        end
        p "Installed #{target}"
      end
    end
  end
end

def remove_files
  Dir.chdir File.dirname(__FILE__) do
    dotfiles_dir = Dir.pwd
  
    Dir['*'].each do |file|
      next unless File.extname(file).empty?
      target_name = file == 'bin' ? file : ".#{file}"
      target = File.join(ENV['HOME'], target_name)
      next unless File.exist? target
      if ARGV.include?('--force')
        system %[rm -rf #{target}]
      else
        p "Delete #{target}? [y/N]:"
        if STDIN.gets.strip.to_s.downcase == 'y'
          system %[rm -rf #{target}]
          p "Removed #{target}"
        else
          p "Not removed #{target}"
        end
      end
    end
  end
end

case ARGV.first
  when 'install', 'setup'
    install_linux if ARGV.include?('--linux')
    install_all
  when 'remove', 'delete'
    remove_files
  else
    puts "Usage:"
    puts 'install, setup        - Install dotfiles in your home directory.'
    puts '         [--linux]    - Install for linux'
    puts '         [--copy]     - Copy files (by default, setup created symlinks)'
    puts 'remove, delete        - Remove your previos dotfiles'
    puts '         [--force]    - Remove without confirmation'
end