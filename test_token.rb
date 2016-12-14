require 'http'
require 'json'
require 'awesome_print'

def fb_url
	ENV['PAGE_ACCESS_TOKEN'] = 'EAAIKvl5UDKkBAAnaCkwzRjjxQZAJEf4kP0Qq7GgWLbtPUJZCx12oZBKkH29h7zcoeFKmJHNZCImM8ASfo3Ve5kvw3Q63ZCMA8OcnIjwZAUFSVpry92w378jXOm7r58yahzkJT6d5MtOCml1rJt29rkZC0mKb70ZARm1C3E2o3gZCe4AZDZD'
  "https://graph.facebook.com/v2.6/me/messages?access_token=" + ENV['PAGE_ACCESS_TOKEN']
end

def test_fb_token
  response = HTTP.post(fb_url)
  ap JSON.parse(response.to_s)
end

test_fb_token