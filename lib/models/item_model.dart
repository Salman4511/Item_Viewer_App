class Item {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String imageUrl;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.imageUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'].toString(),
      title: json['title'],
      description: json['body'],
      thumbnailUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSimt7QsEgO0DgaT7l1YBvX7teOaGerpOY47Q&s',
      imageUrl: 'https://cdn.wallpapersafari.com/23/56/G8w1Zh.jpg', 
    );
  }
}
