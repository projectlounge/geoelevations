require Rails.root.join('app', 'geo_elevation', 'srtm.rb')

namespace :geo do

  task :test => :environment do

    srtm = GeoElevation::Srtm.new
    elevation = srtm.get_elevation(45.276, 13.72)
    puts "Visnjan is #{elevation} meters above sea level"

  end
end

