
class Post {
  final int id;
  final String title;
  final String description;
  final String characteristics;
  final String location;
  final double price;
  final String imgUrl;
  final String category;
  final int authorId;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.characteristics,
    required this.location,
    required this.price,
    required this.imgUrl,
    required this.category,
    required this.authorId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      characteristics: json['characteristics'],
      location: json['location'],
      price: json['price'].toDouble(),
      imgUrl: json['imgUrl'],
      category: json['category'],
      authorId: json['author_id'],
    );
  }
}