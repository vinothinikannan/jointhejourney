require 'net/http'

class Jtjcms < ContentfulModel::Base

  def self.find()
  	url=URI("#{APP_CONFIG[:jtj_api_url]}")
  	value=load_data_url(url)

  	if value.present?
      value
  	end
  end

  private

  def self.load_data_url(url)
  	http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = false
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(url)
		request["content-type"] = 'application/json'
		response = http.request(request)
		data = response.read_body
		val=JSON.parse(data)
  end

end