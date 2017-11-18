require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'json'

module ContentHelper
  def get_last_push_date(user_name, repo_name)
      url = "https://api.github.com/repos/#{user_name}/#{repo_name}"
      info = open(url).read
      json_response = JSON.parse(info)
      date = DateTime.parse(json_response['pushed_at'])
      date.strftime('%F %H:%M')
  end
end
