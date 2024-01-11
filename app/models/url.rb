class Url < ApplicationRecord
  validates :original_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :short_url, presence: true, uniqueness: true

  before_validation :generate_short_url

  def generate_short_url
    return if short_url.present?

    self.short_url = SecureRandom.hex(4)
    self.clicks = 0
  end

  def increment_clicks
    update_column(:clicks, clicks + 1)
  end

  def self.find_by_short_url(short_url)
    find_by(short_url: short_url)
  end

  def self.all_urls_formatted
    all.map { |url| "original: #{url.original_url}, short: #{url.short_url}" }
  end
end
