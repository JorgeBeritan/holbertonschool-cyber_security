#!/usr/bin/ruby

require 'open-uri'
require 'fileutils'
require 'uri'

def download_file
    
    if ARGV.length != 2
        puts "Usage: #{File.basename($0)} URL LOCAL_FILE_PATH"
        exit 1
    end

    url_string = ARGV[0]
    local_file_path = ARGV[1]

    uri = URI.parse(url_string)
    unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
        puts "Error: Invalid URL provided. Please use http or https"
        return
    end

    puts "Downloading file from #{url_string}..."

    URI.open(url_string) do |remote_file|
        FileUtils.mkdir_p(File.dirname(local_file_path))

        File.open(local_file_path, 'wb') do |local_file|
            local_file.write(remote_file.read)
        end
    end

    puts "File downloaded and saved to #{local_file_path}"
end

download_file