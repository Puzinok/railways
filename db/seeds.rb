# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
stations = %w[Москва Воронеж Тамбов Ярославль Казань Мичуринск Екатеринбург Тольятти Курск Мурманск]

stations.each do |title|
  RailwayStation.create(name: title.to_s)
end

all_stations = RailwayStation.all

5.times do
  random_stations = all_stations.sample(rand(2..all_stations.count))
  new_route = Route.new
  random_stations.each do |station|
    new_route.railway_stations << station
  end
  new_route.save!
end

Route.all.each do |route|
  route.railway_stations.each.with_index(1) do |station, position|
    station.update_position(route, position)
    station.set_time(route, Time.at(rand(24.hours)), Time.at(rand(24.hours)))
  end
  train_number = "#{('A'..'Z').to_a.shuffle[0,2].join}"+"-"+"#{rand(000..1000)}"
  Train.create(number: train_number, route: route)
end

admin = User.new(
  name: 'Pavel',
  surname: 'Puzin',
  email: 'admin@example.com',
  admin: true,
  password: '123456', 
  password_confirmation: '123456'
)
admin.skip_confirmation!
admin.save!