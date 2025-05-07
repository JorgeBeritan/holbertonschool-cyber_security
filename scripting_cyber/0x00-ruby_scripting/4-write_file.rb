#!/usr/bin/ruby

require 'json'

def merge_json_files(file1_path, file2_path)
    readFile = File.read(file1_path)
    data = JSON.parse(readFile)
    json_string = JSON.generate(data)
    File.open(file2_path, 'w') do |file|
        file.write(json_string)
    end
end


    