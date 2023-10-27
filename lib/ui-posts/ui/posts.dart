import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';
import 'package:renstatefrontend/ui-posts/model/Post.dart';


List<Map<Posts, dynamic>> listPosts = [
  {Posts(1, "Title 1", "Room", 360): "Some data 1"},
  {Posts(2, "Title 2", "Department", 7851): "Some data 2"},
  {Posts(3, "Title 3", "House", 520): "Some data 3"},
  {Posts(4, "Title 4", "Commercial Space", 1200): "Some data 4"},
];


class PostsList extends StatefulWidget {
  const PostsList({super.key});
  static String id = 'posts_list';

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarApp(context),
      body: Column(
        children: [
          title(),
          Expanded(
            child: ListView.builder(
              itemCount: listPosts.length,
              itemBuilder: (context, index) {
                final postData = listPosts[index].keys.first;
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Titulo: ${postData.getTitle()}"),
                        Text("Categoria: ${postData.getCategory()}"),
                        Text("Precio: ${postData.price}"),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPost(post: postData),
                              ),
                            );
                            if (result == true) {
                              setState(() {});
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              listPosts.removeWhere((element) => element.keys.first == postData);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          buttonBack(),
        ],
      ),
      bottomNavigationBar: bottomNavigationApp(context),
    );
  }
}

Widget title() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        "Your Posts",
        style: TextStyle(
          color: Color(0xFF064789),
          fontWeight: FontWeight.bold,
          fontSize: 26.0,
        ),
      ),
    ),
  );
}

Widget buttonBack(){
  return FractionallySizedBox(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: () {

        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF064789)),
        ),
        child: Text(
          "Back",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

class EditPost extends StatefulWidget {
  final Posts post;

  EditPost({required this.post});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.post.title;
    categoryController.text = widget.post.category;
    priceController.text = widget.post.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Post')),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: categoryController,
            decoration: InputDecoration(labelText: 'Category'),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: 'Price'),
          ),
          ElevatedButton(
            onPressed: () {
              String newTitle = titleController.text;
              String newCategory = categoryController.text;
              int newPrice = int.tryParse(priceController.text) ?? 0;
              final postIndex = listPosts.indexWhere((element) => element.keys.first == widget.post);
              if (postIndex != -1) {
                listPosts[postIndex][widget.post] = "Updated data";
                widget.post.editPost(newTitle, newCategory, newPrice);
              }


              Navigator.pop(context, true);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}