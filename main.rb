require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://api.render.com/v1/services/#{ENV['SERVICE_ID']}/jobs")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

tasks = [
	"clean_up_deleted_files",
	"harddelete"
]

threads = []
tasks.each do |task|
	threads << Thread.new do
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		request = Net::HTTP::Post.new(url)
		request["Accept"] = 'application/json'
		request["Content-Type"] = 'application/json'
		request["Authorization"] = "Bearer #{ENV['API_KEY']}"
		request.body = "{\"startCommand\":\"python terraso_backend/manage.py #{task}\"}"

		response = http.request(request)
		puts response.inspect
  end
end

threads.each{ |t| t.join }
