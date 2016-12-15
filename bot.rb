require 'http'
require 'json'

class Bot
  def fb_url
    "https://graph.facebook.com/me/messages?access_token=" + ENV['PAGE_ACCESS_TOKEN']
  end

  def aqi_url
    "http://api.waqi.info/feed/here/?token=" + ENV['AQI_API_TOKEN']
  end

  def yahoo_url
  end

  def send_message(recipient_id, message_text)
    data = {recipient: {id: recipient_id}, message: {text: message_text}}
    HTTP.post(fb_url, json: data)
  end

  def generate_response(message_text)
    if message_text.include? "weather"
      response = HTTP.get(aqi_url)
      parsed_json = JSON.parse(response)
      "Current Temp: " + parsed_json['data']['aqi']
    elsif message_text.include? "air quality" or message_text.include? "airquality"
      response = HTTP.get(aqi_url)
      parsed_json = JSON.parse(response)
      "Current AQI: " + parsed_json['data']['aqi']
    else
      "You said \"#{message_text}\" and i cannot help with that."
    end
  end
end