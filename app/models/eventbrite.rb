require 'httparty'
require 'hashie'

class Eventbrite

  API_HOST = "www.eventbriteapi.com"
  API_KEY = ENV['eventbrite_key']

  def self.search(query, field_list)

    return {} if query == nil || query == ''

    url = URI.parse("https://#{API_HOST}/v3/events/search/?api_key=#{API_KEY}&format=json&resources=game&query=#{query}&field_list=#{field_list}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
    return JSON.parse(res.body)['results']
  end

  def self.event(event_id)
    url = URI.parse("https://#{API_HOST}/v3/events/#{event_id}/?api_key=#{API_KEY}&format=json")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
    return JSON.parse(res.body)['results']
  end

end