class DataModel {
  String name;
  String description;
  int price;
  num stars;
  num people;
  num selected_people;
  String location;
  String image;


  DataModel(
      {required this.name,
        required this.image,
      required this.description,
      required this.price,
      required this.stars,
      required this.people,
      required this.selected_people,
      required this.location});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      image: json["img"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        people: json["people"],
        selected_people: json["selected_people"],
        location: json["location"]);
  }
}
