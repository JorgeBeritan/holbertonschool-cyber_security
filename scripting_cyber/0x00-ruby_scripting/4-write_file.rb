#!/usr/bin/ruby

require 'json'

def merge_json_files(source_file, destination_file)
    destination_content = File.read(destination_file)
    destination_data = JSON.parse(destination_content)

    source_content = File.read(source_file)
    source_data = JSON.parse(source_content)

    merged_data = destination_data.concat(source_data)
    merged_json_string = JSON.generate(merged_data)

    File.open(destination_file, 'w') do |file|
        file.write(merged_json_string)
    end
    puts "Merged JSON written to file.json"
end

    