class PostRequest {
  String title;
  String description;
  String characteristics;
  String location;
  double price;
  String category;
  int author_id;

  PostRequest({
    required this.title,
    required this.description,
    required this.characteristics,
    required this.location,
    required this.price,
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
      'category': category,
      'author_id': author_id,
    };
  }
}
