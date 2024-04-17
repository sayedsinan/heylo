class User {
  final String name;
  final String about;
  final String image;

  User(this.image, {
    required this.name,
    required this.about,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'about': about,
      'image':image
    };
  }
}
