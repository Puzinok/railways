# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
stations = %w[Москва Воронеж Тамбов Ярославль Казань Мичуринск Екатеринбург Тольятти Курск Мурманск]

def create_stations(stations)
  stations.each do |title|
    RailwayStation.create(name: title.to_s)
  end
end

def create_routes(amount)
  stations = RailwayStation.all
  amount.times do
    random_stations = stations.sample(rand(2..stations.count))
    new_route = Route.new

    random_stations.each do |station|
      new_route.railway_stations << station
    end
    new_route.save!
  end
end

def random_time
  min_time = Time.zone.now
  max_time = Time.zone.now + 3.months
  rand(min_time..max_time)
end

def random_train_number
  ('A'..'Z').to_a.sample(2).join.to_s + '-' + rand(100..999).to_s
end

def create_trains
  Route.all.each do |route|
    route.railway_stations.each.with_index(1) do |station, position|
      station.update_position(route, position)
      station.set_time(route, random_time, random_time)
    end

    Train.create(number: random_train_number, route: route)
  end
end

create_stations(stations)
create_routes(10)
create_trains

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
