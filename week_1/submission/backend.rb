require 'faraday'
require 'json'

NUMBER = 20

puts("Backend has started working!")

query = ""

File.open('search_query.txt', 'r') do |file|
    query = file.read()  # Pretty print the JSON to the file
end

url = ""
if(query == '')
    url = "https://newsapi.org/v2/top-headlines?language=en&pageSize=#{NUMBER}&apiKey=1b2fc2d4815b4d8d806df537115851e7"
else
    puts query
    url = "https://newsapi.org/v2/everything?language=en&pageSize=#{NUMBER}&q=#{query}&apiKey=1b2fc2d4815b4d8d806df537115851e7"
end

response = Faraday.get(url)

json = JSON.parse(response.body)

File.open('response.json', 'w') do |file|
    file.write(JSON.pretty_generate(json))  # Pretty print the JSON to the file
end

File.open('search_query.txt', 'w') do |file|
    file.write("")
end
  
puts("Backend has fetched!")
