# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     # todo: will work this out later as not certain with heroku will do
#     origins '*'
#
#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3001', 'https://gizmo-blogger-backend.herokuapp.com/'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
      # methods: [:get, :options, :head]
    end

    # allow do
    #   origins 'http://localhost:4040', 'https://gizmo-blogger-frontend.herokuapp.com/'
    #
    #   resource '*',
    #     headers: :any,
    #     methods: [:get, :post, :put, :patch, :delete, :options, :head]
    #   end
end
