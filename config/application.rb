require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Truc
  class Application < Rails::Application
    config.load_defaults 8.0

    # Thêm cấu hình URL mặc định cho ActionMailer
    config.action_mailer.default_url_options = { host: "example.com" }
    config.action_mailer.asset_host = "http://example.com"

    config.autoload_lib(ignore: %w[assets tasks])

    # Các cấu hình khác cho ứng dụng
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
