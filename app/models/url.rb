require 'uri'
class Url < ActiveRecord::Base
  before_create :generate_short_url
  # validates :valid_url_or_ip
  validates_format_of :long_url, :with => URI::regexp(%w(http https))

  def generate_short_url
    self.short_url = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Url.where(short_url: random_token).exists?
    end
  end


  # private
  # def valid_url_or_ip
  #   unless valid_url?(long_url)# || IPAddress.valid?(long_url)
  #     errors.add(:long_url, "Not an URL or IP address")
  #   end
  # end

  # def valid_url?(long_url)
  #   uri = URI.parse(long_url)
  #   uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  # rescue URI::InvalidURIError
  #   false
  # end

end