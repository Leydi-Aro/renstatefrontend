import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:renstatefrontend/models/PostRequest.dart';
import 'package:renstatefrontend/properties-searching/ui/post-ui/ShowPosts.dart';
import 'package:renstatefrontend/properties-searching/ui/search_page.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';
import 'package:http/http.dart' as http;

import '../../../models/Post.dart';

class MakePost extends StatefulWidget {
  const MakePost({Key? key}) : super(key: key);

  @override
  _MakePostState createState() => _MakePostState();
}

class _MakePostState extends State<MakePost> {
  String selectedCategory = 'room';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController characteristicsController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp(context),
      body: Center(
        child: ListView(
          children: [
            showTittle(),
            formBox('Title', titleController, false),
            formBox('Description', descriptionController, false),
            formBox('Characteristics', characteristicsController,false),
            formBox('Location', locationController,false ),
            formBox('Image URL', imageUrlController, false),
            selectCategory(),
            formBox('Price', priceController, true),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: buttonSubmit(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationApp(context),
    );
  }

  //type = 0 : text
  //type = 1 : only number
  Widget formBox(String labelText, TextEditingController controller, bool isNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          children: [
            TextFormField(
              maxLines: null,
              inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
              controller: controller,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget selectCategory() {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Column(
        children: [
          InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFD9D9D9),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: DropdownButton<String>(
              value: selectedCategory,
              items: ['room', 'commercialSpace', 'home', 'department']
                  .map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category,style: TextStyle(
                    fontSize: 20.0,
                  ),),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonSubmit(){
    return FractionallySizedBox(
      widthFactor: 0.55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF064789)),
        ),
        onPressed: () {
          createPost();
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Post",style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }

  Future<void> createPost() async {

    final String apiUrl = 'https://roomrest.azurewebsites.net/api/posts';

    final PostRequest newPost = PostRequest(
      title: titleController.text,
      description: descriptionController.text,
      characteristics: characteristicsController.text,
      location: locationController.text,
      price: double.parse(priceController.text),
      imgUrl: imageUrlController.text,
      category: selectedCategory,
      author_id: 1,
    );

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(newPost.toJson()),
    );

    if (response.statusCode == 200) {
      print('Post created successfully');
      Fluttertoast.showToast(msg: 'Post created successfully',
      toastLength: Toast.LENGTH_SHORT);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>SearchPage())
      );
    } else {
      print('Error creating post: ${response.statusCode}');
      Fluttertoast.showToast(msg: 'Error creating post',
          toastLength: Toast.LENGTH_SHORT);
    }
  }

}

Widget showTittle(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Center(
      child: Text("Create a post", style:
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Color(0xFF064789),
          ),
      ),
    ),
  );
}




