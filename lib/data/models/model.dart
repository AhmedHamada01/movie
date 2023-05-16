class CharacterModel {
  String? id;
  String? name;
  String? imDbRating;
  String? gender;
  String? image;
  String ? title;
  String ? fullTitle;
  String ? crew ;

  CharacterModel({
    required this.id,
    required this.name,
    required this.imDbRating,
    required this.gender,
    required this.image,
    required this.title,
    required this.fullTitle,
    required this.crew,
  });

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imDbRating = json['imDbRating'];
    gender = json['gender'];
    image = json['image'];
    title = json['title'];
    fullTitle = json['fullTitle'];
    crew = json['crew'];
  }
}
