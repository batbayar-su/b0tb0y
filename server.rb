require 'sinatra'
require 'json'
require 'awesome_print'
require_relative 'bot'

get '/' do
  if params["hub.mode"] == "subscribe" && params["hub.verify_token"] == "test_batbayar_b0tb0y"
    params["hub.challenge"]
  else
    'Hello world 123'
  end
end

post "/" do
  data = JSON.parse(request.body.read)
  ap data
  entries = data["entry"]
  entries.each do |entry|
    entry["messaging"].each do |messaging|
      sender_id = messaging["sender"]["id"]
      temp_bot = Bot.new
      response = temp_bot.generate_response(messaging["message"]["text"])
      temp_bot.send_message(sender_id, response)
    end
  end
  'ok'
end