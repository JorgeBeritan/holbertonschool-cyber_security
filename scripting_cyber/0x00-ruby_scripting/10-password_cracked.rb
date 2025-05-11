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

    File.open(dictionary_file_path) do |word|
        word.strip!

        hash = Digest::SHA256.hexdigest(word)

        if hash == hashed_password_to_crack
            puts "Password found: #{word}"
            exit 0
        end
    end
    
    puts "Password not found in dictionary."
    exit 1
end