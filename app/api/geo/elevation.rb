require Rails.root.join('app', 'geo_elevation', 'srtm.rb')
module Geo
  class Elevation < Grape::API
    format :json
    desc "Returns elevation in meters above sea level given latitude and longitude."
    params do
      requires :latitude, desc: "latitude"
      requires :longitude, desc: "longitude"
    end
    get :elevation do

      @@srtm = GeoElevation::Srtm.new
      elevation = @@srtm.get_elevation(params[:latitude].to_f, params[:longitude].to_f)
      { results: {elevation: elevation } }
    end
  end
end
