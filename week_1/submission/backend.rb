require 'faraday'
require 'json'

#MAX articles to fetch
NUMBER = 20

puts("Backend has started working!")

#Account for any query
query = ""
File.open('search_query.txt', 'r') do |file|
    query = file.read()  # Pretty print the JSON to the file
end

#Interpolate the reqd. url
url = ""
if(query == '')
    url = "https://newsapi.org/v2/top-headlines?language=en&pageSize=#{NUMBER}&apiKey=1b2fc2d4815b4d8d806df537115851e7"
else
    puts query
    url = "https://newsapi.org/v2/everything?language=en&pageSize=#{NUMBER}&q=#{query}&apiKey=1b2fc2d4815b4d8d806df537115851e7"
end

#Get the articles from API: no async since server!
response = Faraday.get(url)
json = JSON.parse(response.body)

#Write to 'db'
File.open('response.json', 'w') do |file|
    file.write(JSON.pretty_generate(json))  # Pretty print the JSON to the file
end

#Flush query param
File.open('search_query.txt', 'w') do |file|
    file.write("")
end
  
puts("Backend has fetched!")
