#!/usr/bin/ruby

require 'net/http'
require 'json'
require 'uri'

def post_request(url_string, body_params = {})
    begin
        uri = URI.parse(url_string)
        http = Net::HTTP.new(uri.host, uri.port)

        if uri.scheme == 'https'
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        end

        request = Net::HTTP::POST.new(uri.request_uri)
        request['Content-Type'] = 'application/json: charset=UTF-8'
        request.body = body_params.to_json

        response = http.request(request)

        puts "Response status: #{response.code} #{response.message}"
        puts "Response body:"

        if response.body && !response.body.empty?
            begin
                parsed_json = JSON.parse(response.body)
                puts JSON.pretty_generate(parsed_json)
            rescue JSON::ParseError
                puts response.body
            end
        else
            puts "{}"
        end

    rescue StandardError => e
        puts "Error: #{e.message}"
    end
end
