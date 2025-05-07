#!/usr/bin/ruby

require "json"

def count_user_ids(path)
    user_counts = {}
    contenido_json = File.read(path)

    datos = JSON.parse(contenido_json)

    if datos.is_a?(Array)
        datos.each do |elemento|
            if elemento.is_a?(Hash) && elemento.key?('userId')
                user_id = elemento['userId']
                next if user_id.nil?
                user_id = user_id.to_s
                user_counts[user_id] = (user_counts[user_id] || 0) + 1
            end
        end
    else
        puts "Algo salio mal"
        return {}
    end
    user_counts.each do |user_id, count|
        puts "#{user_id}: #{count}"
    end
end

