if Rails.env.production?
  Resend.configure do |config|
    config.api_key = ENV['RESEND_API_KEY']
  end
end