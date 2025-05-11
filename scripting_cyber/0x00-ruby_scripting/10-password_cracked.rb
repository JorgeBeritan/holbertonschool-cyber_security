#!/usr/bin/ruby

require 'digest'
require 'fileutils'

def crack_password
    if ARGV.length != 2
        puts "Usage: #{File.basename($0)} HASHED_PASSWORD DICTIONARY_FILE"
        exit 1
    end

    hashed_password_to_crack = ARGV[0].downcase
    dictionary_file_path = ARGV[1]

    unless File.exist?(dictionary_file_path) && File.readable?(dictionary_file_path)
        puts "Error: Dictionary file '#{dictionary_file_path}' not found or not readable."
        exit 1
    end

    File.open(dictionary_file_path, 'r') do |file|
        file.each_line do |word|
            clean_word = word.strip
            next if clean_word.empty?

            current_word_hash = Digest::SHA256.hexdigest(clean_word)

            if current_word_hash == hashed_password_to_crack
                puts "Password found: #{clean_word}"
                exit 0
            end
        end
    end
    
    puts "Password not found in dictionary."
    exit 1
end