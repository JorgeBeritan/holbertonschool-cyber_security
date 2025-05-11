#!/usr/bin/ruby

def print_arguments
    if ARGV.empty?
        puts "No arguments provided."
    else
        ARGV.each_with_index do |args, index|
            puts "Arguments:"
            puts "#{index + 1}. #{args}"
        end
    end
end

if __FILE__ == $0
    print_arguments
end