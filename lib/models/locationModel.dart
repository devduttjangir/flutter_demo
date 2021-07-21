class Location {
  // name of the location
  final String name;

  // location id
  final String id;

  // Constructor
  Location({this.id, this.name});
}

List<Location> locations = [
  Location(id: "1", name: "Location1"),
  Location(id: "2", name: "Location2"),
  Location(id: "3", name: "Location3")
];
