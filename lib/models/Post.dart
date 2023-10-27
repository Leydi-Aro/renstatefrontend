
class Post {
  final int id;
  final String title;
  final String description;
  final String characteristics;
  final String location;
  final double price;
  final String imgUrl;
  final String category;
  final int author_id;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.characteristics,
    required this.location,
    required this.price,
    required this.imgUrl,
    required this.category,
    required this.author_id,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int? ?? 0, //
      title: json['title'],
      description: json['description'],
      characteristics: json['characteristics'],
      location: json['location'],
      price: json['price']?.toDouble() ?? 0.0,
      imgUrl: json['imgUrl'],
      category: json['category'],
      author_id: json['author_id'],
    );
  }

}