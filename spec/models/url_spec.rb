require 'rails_helper'

RSpec.describe Url, type: :model do
  it { should validate_presence_of(:original_url) }
  it { should validate_uniqueness_of(:short_url) }

  describe '#generate_short_url' do
    it 'генерирует короткую ссылку' do
      url = build(:url, short_url: nil)
      url.save
      expect(url.short_url).to be_present
    end
  end

  describe '#increment_clicks' do
    it 'увеличивает значение кликов' do
      url = create(:url)
      expect { url.increment_clicks }.to change { url.clicks }.by(1)
    end
  end

  describe '.find_by_short_url' do
    it 'находит длинную ссылку по короткой' do
      url = create(:url)
      found_url = Url.find_by_short_url(url.short_url)
      expect(found_url).to eq(url)
    end
  end

  describe '.all_urls_formatted' do
    it 'форматирует ссылки и возвращает массив' do
      create_list(:url, 5)
      formatted_urls = Url.all_urls_formatted
      expect(formatted_urls.size).to eq(5)
      formatted_urls.each do |formatted_url|
        expect(formatted_url).to match(%r{original: http://*, short: [0-9a-f]{8}})
      end
    end
  end
end
