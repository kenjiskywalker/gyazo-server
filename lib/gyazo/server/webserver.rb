require 'sinatra'

module Gyazo
  module Server
    class WebServer < Sinatra::Base

      set :root, "#{File.dirname(__FILE__)}/../../../"

      post '/' do
        id = request[:id]
        data = request[:imagedata][:tempfile].read
        image = Image.new(options.root, id, data)

        "http://#{options.host}:#{options.port}/data/#{image.hash}.png"
      end

      get '/' do
        send_file File.join(settings.public_folder, 'index.html')
      end

    end
  end
end
