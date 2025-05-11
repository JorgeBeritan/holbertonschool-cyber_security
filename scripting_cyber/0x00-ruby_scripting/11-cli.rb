#!/usr/bin/ruby

require 'optparse'

def cli
    tasks_file = 'tasks.txt'

    read_task_from_file = ->(file_path) do
        if File.exist?(file_path)
            File.readlines(file_path).map(&:chomp)
        else
            []
        end
    end

    write_task_to_file = ->(file_path, tasks_array) do
        File.open(file_path, 'w') do |file|
            tasks_array.each { |task| file.puts(task) }
        end
    end

    options = {}

    parser = OptionParser.new do |opts|
        opts.banner = "Usage: cli.rb [options]"

        opts.on("-a", "--add TASK", "Add a new task") do |task|
            options[:add] = task
        end

        opts.on("-l", "--list", "List all tasks") do
            options[:list] = true
        end

        opts.on("-r", "--remove INDEX", Integer, "Remove a task by index") do |index|
            options[:remove] = index
        end

        opts.on("-h", "--help", "Show help") do
            puts opts
            exit
        end
    end

    begin
        parser.parse!
    rescue OptionParser::MissingArgument => e
        puts "Error: #{e}"
        puts parser 
        exit 1
    rescue OptionParser::InvalidOption => e 
        puts "Error: #{e}"
        puts parser 
        exit 1
    end

    unless File.exist?(tasks_file)
        File.open(tasks_file, 'w') { |file| file.write("") }
    end

    if options[:add]
        tasks = read_task_from_file.call(tasks_file)
        tasks << options[:add]
        write_task_to_file.call(tasks_file, tasks)
        puts "Task '#{options[:add]}' added."
    elsif options[:list]
        tasks = read_task_from_file.call(tasks_file)
        if tasks.empty?
            puts "No tasks found"
        else
            puts "Tasks:"
            tasks.each_with_index do |task, index|
                puts "#{index + 1}. #{task}"
            end
        end
    elsif options[:remove]
        tasks = read_task_from_file.call(tasks_file)
        index_to_remove = options[:remove] - 1

        if index_to_remove >= 0 && index_to_remove < tasks.length
            remove_task = tasks.delete_at(index_to_remove)
            write_task_to_file.call(tasks_file, tasks)
            puts "Task '#{remove_task}' removed."
        else
            puts "Invalid task index. Use '--list' to see available tasks and their indices."
        end
    elsif ARGV.empty? && options.empty?
        puts parser 
    elsif !option.empty?
    else
        puts "Unknow command or arguments: #{ARGV.join(' ')}"
        puts parser
        exit 1
    end
end

cli
