import 'package:flutter/material.dart';
import 'package:renstatefrontend/ui-initial-section/register_view.dart';
import 'package:renstatefrontend/ui-initial-section/login_view.dart';

class InitView extends StatelessWidget {
  const InitView({super.key});
  static String id = 'init_view';

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
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