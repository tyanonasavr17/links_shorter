FactoryBot.define do
  factory :url do
    original_url { "http://11786tdbgchjiruiiunjdnu333u8jjdjeuuu33" }
    short_url { SecureRandom.hex(4) }
    clicks { 0 }
  end
end
