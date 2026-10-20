
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://jpsaavedra3.github.io", "http://localhost:8000"

    resource "/api/v1/services",   methods: [ :get ]
    resource "/api/v1/services/*", methods: [ :get ]
  end
end