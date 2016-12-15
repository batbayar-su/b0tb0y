require 'sinatra'
require 'json'
require 'awesome_print'
require_relative 'bot'

get '/' do
  if params["hub.mode"] == "subscribe" && params["hub.verify_token"] == "test_batbayar_b0tb0y"
    params["hub.challenge"]
  else
    'Hello world'
  end
end

post "/" do
  data = JSON.parse(request.body.read)
  ap data
  entries = data["entry"]
  entries.each do |entry|
    entry["messaging"].each do |messaging|
      sender_id = messaging["sender"]["id"]
      text = messaging["message"]["text"]
      reply = "You said: #{text}"
      Bot.new.send_message(sender_id, reply)
    end
  end
  'ok'
end

get "/get_long_token" do
  Bot.new.get_token
end