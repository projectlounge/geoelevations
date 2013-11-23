class API < Grape::API
  prefix 'api'

  mount Geo::Ping
  mount Geo::Elevation
  add_swagger_documentation
end
