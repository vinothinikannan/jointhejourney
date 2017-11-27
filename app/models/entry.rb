require 'net/http'

class Entry < ContentfulModel::Base

  def self.find(id)
  	url=URI("#{APP_CONFIG[:jtj_api_url]}/entries/#{id}")
  	value=load_data_url(url)

  	if value.present?
      value
  	end
  end

  def self.find_by_date(start_date,end_date,limit=100)
    entry_url = URI("#{APP_CONFIG[:jtj_api_url]}/entries?start_date=#{start_date}&end_date=#{end_date}&limit=#{limit}")
    @entry_response = load_data_url(entry_url)
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