import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/search_page.dart';
import 'package:renstatefrontend/shared/services/UserService.dart';
import 'package:renstatefrontend/ui-initial-section/register_view.dart';
import 'package:renstatefrontend/ui-initial-section/login_view.dart';


class InitView extends StatefulWidget {
  @override
  _InitViewState createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {

  late UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    userService = UserService();
    checkUserId();
  }

  Future<void> checkUserId() async {
    final userId = await userService.getUserLogedId();
    if (userId != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF064789),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage('https://i.ibb.co/9T6qrHD/logoroom.png'),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStyledButton(
                      "Login",
                      (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>LoginView())
                        );
                      }
                  ),
                  buildStyledButton(
                    "Register",
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>RegisterView())
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

}

ElevatedButton buildStyledButton(
    String label,
    Function onPressed,
    ) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    child: Text(label, style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    )),
    style: ElevatedButton.styleFrom(
        primary: Colors.lightBlue,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.black, width: 1),
        )
    ),
  );
}