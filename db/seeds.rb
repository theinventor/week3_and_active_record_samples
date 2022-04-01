cities = "Galena, IL, USA	42.420296	-90.435600
Freeport, IL, USA	42.289551	-89.647018
East Saint Louis, IL, USA	38.616405	-90.159821
East Moline, IL, USA	41.511295	-90.460213
Dixon, IL, USA	41.845261	-89.491661
DeKalb, IL, USA	41.930370	-88.757355
Danville, IL, USA	40.144653	-87.634216
Collinsville, IL, USA	38.675953	-90.003471
Chicago Heights, IL, USA	41.510395	-87.644287
Chester, IL, USA	37.915825	-89.829262
Arkansas City, KS, USA	37.069611	-97.050720
Charleston, IL, USA	39.491936	-88.185867
Centralia, IL, USA	38.530453	-89.141502
Carthage, IL, USA	40.414780	-91.141708
Carlinville, IL, USA	39.280560	-89.890327
Canton, IL, USA	40.560329	-90.046028
Calumet City, IL, USA	41.611603	-87.551186
Cairo, IL, USA	37.007828	-89.184265
Bloomington, IL, USA	40.478821	-88.992706
Belvidere, IL, USA	42.259529	-88.865211
Alton, IL, USA	38.908852	-90.169662
Sun Valley, ID, USA	43.697662	-114.352829
Rexburg, ID, USA	43.825386	-111.792824
Pocatello, ID, USA	42.880363	-112.452911
Lewiston, ID, USA	46.392014	-117.010826
Kellogg, ID, USA	47.538658	-116.129227"

cities.split("\n").each do |city|
  cols = city.split("\t")
  my_date = Faker::Date.forward
  Trip.create(
    destination_city: cols.first,
    lattitude: cols.second,
    longitude: cols.third,
    arrival_date: my_date,
    departure_date: my_date+rand(1..20).days
  )

end
