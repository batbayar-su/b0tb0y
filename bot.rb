require 'http'

class Bot
  def fb_url
    "https://graph.facebook.com/me/messages?access_token=" + ENV['PAGE_ACCESS_TOKEN']
  end

  def send_message(recipient_id, message_text)
    data = {recipient: {id: recipient_id}, message: {text: message_text}}
    HTTP.post(fb_url, json: data)
  end

  def get_token
  	HTTP.get("https://graph.facebook.com/oauth/access_token?grant_type=fb_exchange_token&
    client_id=574762696051881&client_secret=23ce73e3828f3e362d13d6fb5e40243f&fb_exchange_token=ENV['PAGE_ACCESS_TOKEN']")  	
  end
end