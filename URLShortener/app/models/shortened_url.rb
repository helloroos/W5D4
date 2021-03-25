class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true
    validates :short_url, uniqueness: true

    def self.random_code
        code = SecureRandom.urlsafe_base64
        until !ShortenedUrl.exists?(code)
            code = SecureRandom.urlsafe_base64
        end
        code
    end

    def self.create_short_urls(user, long_url)
        short_url = ShortenedUrl.random_code
        ShortenedUrl.create!(user, long_url, short_url)
    end
end