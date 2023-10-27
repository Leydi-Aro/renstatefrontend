class PostRequest {
  final String title;
  final String description;
  final String characteristics;
  final String location;
  final double price;
  final String imgUrl;
  final String category;
  final int author_id;

  PostRequest({
    required this.title,
    required this.description,
    required this.characteristics,
    required this.location,
    required this.price,
    required this.imgUrl,
    required this.category,
    required this.author_id,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'characteristics': characteristics,
      'location': location,
      'price': price,
      'imgUrl': imgUrl,
      'category': category,
      'author_id': author_id,
    };
  }
}
