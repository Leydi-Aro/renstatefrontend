import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';

class MakePost extends StatefulWidget {
  const MakePost({Key? key}) : super(key: key);

  @override
  _MakePostState createState() => _MakePostState();
}

class _MakePostState extends State<MakePost> {
  String selectedCategory = 'Room';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController characteristicsController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp(context),
      body: Center(
        child: ListView(
          children: [
            showTittle(),
            formBox('Title', titleController),
            formBox('Description', descriptionController),
            formBox('Characteristics', characteristicsController),
            formBox('Image URL', imageUrlController),
            selectCategory(),
            formBox('Price', priceController),
            SizedBox(height: 20.0,),
            buttonSubmit(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationApp(context),
    );
  }

  Widget formBox(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          children: [
            TextFormField(
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
              items: ['Room', 'Commercial Space', 'Home', 'Department']
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
      widthFactor: 0.5,
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Post",style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF064789)),
        ),
        onPressed: () {
          print("Title: ${titleController.text}");
          print("Description: ${descriptionController.text}");
          print("Characteristics: ${characteristicsController.text}");
          print("Image URL: ${imageUrlController.text}");
          print("Price: ${priceController.text}");
          print("Category: $selectedCategory");
        },
      ),
    );
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
