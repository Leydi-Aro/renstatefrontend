import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renstatefrontend/models/PostRequest.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';
import 'package:http/http.dart' as http;
import 'package:renstatefrontend/shared/services/MediaService.dart';
import 'package:renstatefrontend/shared/services/PostService.dart';
import 'package:renstatefrontend/shared/services/UserService.dart';

import '../../../external-service/maps/maps.dart';


class MakePost extends StatefulWidget {
  const MakePost({Key? key}) : super(key: key);

  @override
  _MakePostState createState() => _MakePostState();
}

class _MakePostState extends State<MakePost> {

  PostService postService = PostService();
  MediaService mediaService = MediaService();
  UserService userService = UserService();

  String selectedCategory = 'room';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController characteristicsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  //File? _imageFile;

  List<File> _images = [];


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
            FractionallySizedBox(
              widthFactor: 0.5,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoogleMaps()),
                  );
                },
                child: Text("Google Maps"),
              ),
            ),
            formBox('Location', locationController,false ),

            Text("Seleccion imagenes de tu inmueble",style:
              TextStyle(
                fontSize: 15.0
              ),
            textAlign: TextAlign.center,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){_pickImage(ImageSource.camera);},
                  child: Text("Camera"),
                ),
                SizedBox(width: 25.0),
                ElevatedButton(
                  onPressed: (){_pickImage(ImageSource.gallery);},
                  child: Text("Gallery"),
                ),
              ],
            ),
            if (!_images.isEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                    child: Image.file(_images.last, fit: BoxFit.contain)
                ),
              ),

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
              items: ['room', 'commercialSpace', 'house', 'department']
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
          postService.createPost(
              new PostRequest(
                title: titleController.text,
                description: descriptionController.text,
                characteristics: characteristicsController.text,
                location: locationController.text,
                price: double.parse(priceController.text), // Parsea el precio a double
                category: selectedCategory,
                author_id: 0,
              ), _images);
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


  // Nuevo método para seleccionar o tomar una foto
  Future<void> _pickImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
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




